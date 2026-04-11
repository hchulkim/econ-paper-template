
-- 
-- Conditionally load natbib package based on the cite method.
-- The extension defaults to cite-method: natbib, but users can switch to
-- citeproc or biblatex by setting cite-method in their document YAML.
local function setup_natbib(meta)
  if quarto.doc.is_format("pdf") then
    -- Determine whether natbib should be loaded.
    -- Pandoc sets meta.natbib = true when cite-method is natbib;
    -- meta.biblatex = true when cite-method is biblatex.
    -- Quarto may also expose cite-method directly in meta.
    -- Default to natbib (the extension's default) when no signal is found.
    local use_natbib = true

    -- Helper to resolve a meta value to a Lua boolean.
    -- Handles both raw Lua booleans and Pandoc MetaValue types.
    local function meta_bool(val)
      if type(val) == "boolean" then
        return val
      end
      return pandoc.utils.stringify(val) ~= "false"
    end

    -- Explicit natbib=false in document YAML disables natbib loading.
    if meta.natbib ~= nil then
      use_natbib = meta_bool(meta.natbib)
    end

    -- An explicit cite-method value of citeproc or biblatex overrides the default.
    if meta['cite-method'] ~= nil then
      local cm = pandoc.utils.stringify(meta['cite-method'])
      if cm == "citeproc" or cm == "biblatex" then
        use_natbib = false
      end
    end

    -- Pandoc sets meta.biblatex = true when --biblatex is used.
    if meta.biblatex ~= nil and meta_bool(meta.biblatex) then
      use_natbib = false
    end

    if use_natbib then
      quarto.doc.include_text('in-header', '\\usepackage{natbib}')
    end
  end
end

local kHeightAttr = 'add-textheight'

local text_height_div = function(el)
  for k,v in pairs(el.attr.attributes) do
    if k == kHeightAttr then
      if quarto.doc.is_format("pdf") then
        local heightAdjust = pandoc.utils.stringify(v)
        local endHeight = '-' .. heightAdjust
        if heightAdjust:sub(1,1) == "-" then
          endHeight = heightAdjust:sub(2)
        end

        local rawStart = pandoc.RawBlock("latex", "\\addtolength{\\textheight}{" .. heightAdjust .."}%")
        local rawEnd = pandoc.RawBlock("latex", "\\addtolength{\\textheight}{" .. endHeight .."}%")
        table.insert(el.content, 1, rawStart)
        table.insert(el.content, rawEnd)

        return el
      end
    end
  end
end

local processSupplementary = function(el) 
  if el.attr.classes:includes('supplementary') then

    if quarto.doc.is_format("pdf") then
      local content = el.content
      local titleText = pandoc.utils.stringify(content);
      titleText = pandoc.text.upper(titleText);
      local rendered = {
        pandoc.RawInline("latex", "\\bigskip\n"),
        pandoc.RawInline("latex", "\\begin{center}\n"),
        pandoc.RawInline("latex", "{\\large\\bf " .. titleText .. "}\n"),
        pandoc.RawInline("latex", "\\end{center}"),
      }
      return pandoc.Div(rendered, el.attr)
    elseif quarto.doc.is_format("html") then
      local content = el.content
      local titleText = pandoc.write(pandoc.Pandoc(pandoc.Plain(content)), 'html')
      local heading = pandoc.Header(2, content, { el.attr.identifier, {"supplementary", "unnumbered"}, el.attr.attributes} )
      return heading
    end
  end
end

return {
  {
    Meta = setup_natbib,
    Div = text_height_div,
    Header = processSupplementary
  }
}