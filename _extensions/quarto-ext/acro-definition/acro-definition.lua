-- defines Acronyms.
-- in Latex with \acro; else simply as a list

return {
  ["acrodef"] = function(args)
    -- define abbreviation and explanation
    local my_abbreviation = pandoc.utils.stringify(args[1])
    local my_explanation = pandoc.utils.stringify(args[2])
    local abbreviation_wo_math = string.gsub(my_abbreviation, "[\\_]", "")
    local abbreviation_wo_math = string.gsub(abbreviation_wo_math, "[\\]", "")

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
    -- for html
    elseif quarto.doc.isFormat("html") then
      if symbol == true then
          return pandoc.RawInline(
          "html",
          "" .. my_abbreviation .. "   " .. my_explanation .. ""
          )
      else
        return pandoc.RawInline(
          "html",
          "" .. my_abbreviation .. "   " .. my_explanation .. ""
          )
      end
    -- and for word
    else
      if symbol == true then
        return pandoc.Span("" .. my_abbreviation .. "   " .. my_explanation .. "",
          {['custom-style']='Schwache Hervorhebung'})
      else
        return pandoc.Span("" .. my_abbreviation .. "   " .. my_explanation .. "")
      end
    end
  end
}
