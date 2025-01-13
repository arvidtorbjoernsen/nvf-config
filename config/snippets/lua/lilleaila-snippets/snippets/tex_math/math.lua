local ls = require("lilleaila-snippets.helpers.ls")
local d, i, fmta = ls.d, ls.i, ls.fmta

local tex = require("lilleaila-snippets.helpers.tex")
local utils = require("lilleaila-snippets.helpers.util")
local tasnip = tex.tasnip
local _tasnip = tex._tasnip
local masnip = tex.masnip
local _masnip = tex._masnip

M = {
  -- align-environments
  -- for some reason \\ expands to \ even when it's inside [[]] /shrug
  masnip({ trig = "nn", name = "newline" }, [[
    \\\\
    $1&$2 & $0
  ]]),
  masnip({ trig = "na", name = "newline with answer" }, [[
    \\\\
    \ans{$1&$2} & $0
  ]]),
  masnip({ trig = "*", name = "multiplication" }, [[\cdot]]),
  _masnip({ trig = "^", name = "exponent" }, fmta([[^{<>}]], { d(1, utils.get_visual) })),
  _masnip({ trig = "uu", name = "underset" }, fmta([[\underset{<>}{<>}]], { i(1), d(2, utils.get_visual) })),
  _masnip({ trig = "ss", name = "square root" }, fmta([[\sqrt{<>}]], { d(1, utils.get_visual) })),
  _masnip({ trig = "sr", name = "nth root" }, fmta([=[\sqrt[<>]{<>}]=], { i(1), d(2, utils.get_visual) })),
  -- TODO: de list-relaterte snippetene i https://github.com/LilleAila/nvim-nix/blob/ff3c6efdd0ddc178a9dab31747d7cfbc76f970b8/config/plugins/utils/luasnip/snippets/tex/math.lua (commiten før jeg startet med dette)
}

return M
