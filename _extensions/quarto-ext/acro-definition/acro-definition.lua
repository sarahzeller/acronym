-- defines Acronyms.
-- in Latex with \acro; else simply as a list

return {
  ["acrodef"] = function(args)
    -- define abbreviation and explanation
    local my_abbreviation = pandoc.utils.stringify(args[1])
    local my_explanation = pandoc.utils.stringify(args[2])
    local abbreviation_wo_math = string.gsub(my_abbreviation, "[\\_]", "")
    local abbreviation_wo_math = string.gsub(abbreviation_wo_math, "[\\]", "")
    local abbreviation_wo_math_html = string.gsub(my_abbreviation, "[\\]", "")

    -- check out if there is any 3rd argument called "symbol"
    if args[3] == nil then
      symbol = false
    else
      symbol_text = pandoc.utils.stringify(args[3])
      if string.find(symbol_text, "symbol") then
        symbol = true
      else
        symbol = false
      end
    end

    -- for PDFs
    if quarto.doc.isFormat("pdf") then
      -- add special sequence for math mode
      if symbol == true then
        return pandoc.RawInline(
          "tex",
          '\\acro{' .. abbreviation_wo_math .. '}[$' .. my_abbreviation .. '$]{' .. my_explanation .. '}'
        )
      -- otherwise make it simple
      else
        return pandoc.RawInline(
           "tex",
           '\\acro{' .. my_abbreviation .. "}{" .. my_explanation .. "}"
           )
      end
    -- for html & doc
    else
      if symbol == true then
        return pandoc.Para({
          pandoc.Emph(abbreviation_wo_math_html), "\t\t",
          my_explanation
        })
      else
        return pandoc.Para({
          pandoc.Strong(abbreviation_wo_math_html), "\t\t",
          my_explanation
        })
      end
    end
  end
}
