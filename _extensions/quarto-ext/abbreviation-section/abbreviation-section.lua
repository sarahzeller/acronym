return{
  ["acrosection"] = function(args)
    local begin_end = pandoc.utils.stringify(args[1])
    if begin_end == "begin" then
      if quarto.doc.isFormat("pdf") then
        return pandoc.RawInline(
          "tex",
          "\\" .. begin_end .. "{acronym}[1234567891263]"
        )
      else
        return pandoc.Span("")
      end
    elseif begin_end == "end" then
      if quarto.doc.isFormat("pdf") then
        return pandoc.RawInline(
          "tex",
          "\\" .. begin_end .. "{acronym}"
        )
      else
        return pandoc.Span("")
      end
    end
  end
}
