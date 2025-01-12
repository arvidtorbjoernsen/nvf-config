local tex = require("lilleaila-snippets.helpers.tex")
local utils = require("lilleaila-snippets.helpers.utils")
local tsnip = tex.tsnip
local _tsnip = tex._tsnip
local msnip = tex.msnip
local _msnip = tex._msnip

require("lilleaila-snippets.helpers.ls").load_vars()

local M = {
  tsnip({ trig = "mm", name = "inline math" }, [[$$1$]]),
  tsnip({ trig = "md", name = "display math" }, [[
    $$
    $1
    $$
  ]]),
  _msnip({ trig = "aa", name = "answer" }, fmta([[\underline{\underline{<>}}]], {d(1, utils.get_visual)})),
}

return M
