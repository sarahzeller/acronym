-- shortcode that provides a nicely formatted latex string;
-- in all other cases, the acronym is simply printed 

return {
  ["acro"] = function(args)
    local my_abbreviation = pandoc.utils.stringify(args[1])
    
  -- detect PDF    
    if quarto.doc.isFormat("pdf") then
      return pandoc.RawInline(
         "tex",
         '\\ac{' .. my_abbreviation .. "}"
         )

    elseif quarto.doc.isFormat("html") then
      return pandoc.RawInline(
        "html",
        my_abbreviation
      ) 
    else 
      return pandoc.Span(my_abbreviation)
    end
  end
}
