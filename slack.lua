
-- Blocksep is used to separate block elements.
function Blocksep()
  return "\n"
end

-- This function is called once for the whole document. Parameters:
-- body is a string, metadata is a table, variables is a table.
-- This gives you a fragment.  You could use the metadata table to
-- fill variables in a custom lua template.  Or, pass `--template=...`
-- to pandoc, and pandoc will add do the template processing as
-- usual.
function Doc(body, metadata, variables)
  local buffer = {}
  local function add(s)
    table.insert(buffer, s)
  end
  add(body)
  return table.concat(buffer,'\n')
end

function Str(s)
  return s
end

function Space()
  return " "
end

function Link(s, src, tit)
  return src
end

function Plain(s)
  return s
end

function Para(s)
  return s .. "\n"
end

function HorizontalRule()
  return "---"
end

function CodeBlock(s, attr)
  return "```\n" .. s .. "```\n"
end

function SoftBreak()
  return ""
end

function LineBreak()
  return "\n"
end

function Emph(s)
  return "_" .. s .. "_"
end

function Strong(s)
  return "*" .. s .. "*"
end

function Strikeout(s)
  return '~' .. s .. '~'
end

function  BlockQuote(s)
  return "> " .. s
end

function Code(s, attr)
  return string.format("`%s`", s)
end

function Header(lev, s, attr)
  return '*'.. string.rep('#', lev) ..' ' .. s .. '*\n'
end

function BulletList(items)
  local buffer = {}
  for _, item in pairs(items) do
    table.insert(buffer, "  • " .. item)
  end
  return table.concat(buffer, "\n") .. "\n"
end

function OrderedList(items, v, x, z)
  local buffer = {}
  for i, item in pairs(items) do
    table.insert(buffer, "  ".. i .. ". " .. item .. "")
  end
  return table.concat(buffer, "\n") .. "\n"
end

-- The following code will produce runtime warnings when you haven't defined
-- all of the functions you need for the custom writer, so it's useful
-- to include when you're working on a writer.
local meta = {}
meta.__index =
  function(_, key)
    io.stderr:write(string.format("WARNING: Undefined function '%s'\n",key))
    return function() return "" end
  end
setmetatable(_G, meta)
