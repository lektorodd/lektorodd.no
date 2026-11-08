-- lf.lua: felles grep for løysingsforslaga på lektorodd.no
--
-- 1) «# Løysingsforslag S1 - våren 2025» blir fjerna, sidan tittelen alt står
--    øvst. Teksten blir brukt som undertittel om dokumentet ikkje har ein.
-- 2) «# Del 1», «# Del 1 - utan hjelpemiddel» eller «# Del 1: utan hjelpemiddel»
--    blir eit tydeleg delskilje (klassen .lf-del på nett, eige band i PDF).
--    Står det berre «Del 1» eller «Del 2», blir «utan/med hjelpemiddel» lagt til.

local auto_subtitle = nil

local function inlines(s)
  local r = pandoc.Inlines({})
  for w in s:gmatch("%S+") do
    if #r > 0 then r:insert(pandoc.Space()) end
    r:insert(pandoc.Str(w))
  end
  return r
end

local function del_parts(text)
  text = text:gsub("–", "-"):gsub("—", "-")
  local nr, rest = text:match("^[Dd]el%s*(%d+)%s*[-:]?%s*(.-)%s*$")
  if not nr then return nil end
  if rest == "" then
    if nr == "1" then rest = "utan hjelpemiddel" elseif nr == "2" then rest = "med hjelpemiddel" end
  end
  return "Del " .. nr, rest
end

local function header(h)
  if h.level ~= 1 then return nil end
  local text = pandoc.utils.stringify(h.content)

  if text:match("^Løysingsforslag") then
    auto_subtitle = auto_subtitle or text:gsub("%s+%-%s+", ", ")
    return {}
  end

  local nr, rest = del_parts(text)
  if not nr then return nil end
  h.classes:insert("lf-del")

  if quarto.doc.is_format("typst") then
    -- Malen deler ved «: » og set nummer og tekst kvar for seg
    h.content = inlines(rest ~= "" and (nr .. ": " .. rest) or nr)
    if nr ~= "Del 1" then
      -- Del 2 og vidare byrjar på ny side
      return { pandoc.RawBlock("typst", "#pagebreak(weak: true)"), h }
    end
  else
    local c = pandoc.Inlines({ pandoc.Span(inlines(nr), { class = "lf-del-nr" }) })
    if rest ~= "" then
      c:insert(pandoc.Space())
      c:insert(pandoc.Span(inlines(rest), { class = "lf-del-tekst" }))
    end
    h.content = c
  end
  return h
end

-- «H25 // 2P-Y» blir «Løysingsforslag 2P-Y, hausten 2025»
local function subtitle_from_title(title)
  local sesong, aar, fag = title:match("^%s*([HhVv])(%d%d)%s*//%s*(.-)%s*$")
  if not sesong then return nil end
  sesong = (sesong:upper() == "H") and "hausten" or "våren"
  return "Løysingsforslag " .. fag .. ", " .. sesong .. " 20" .. aar
end

local function meta(m)
  if m.subtitle == nil then
    -- I PDF-en er innleiinga (og overskrifta i ho) alt fjerna av Quarto
    local s = auto_subtitle
    if s == nil and m.title ~= nil then s = subtitle_from_title(pandoc.utils.stringify(m.title)) end
    if s ~= nil then m.subtitle = inlines(s) end
  end
  return m
end

return {
  { Header = header },
  { Meta = meta },
}
