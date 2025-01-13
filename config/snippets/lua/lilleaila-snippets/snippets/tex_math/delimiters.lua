local ls = require("lilleaila-snippets.helpers.ls")
local f, d, i, fmta = ls.f, ls.d, ls.i, ls.fmta
local tex = require("lilleaila-snippets.helpers.tex")
local utils = require("lilleaila-snippets.helpers.util")
local tasnip = tex.tasnip
local _tasnip = tex._tasnip
local masnip = tex.masnip
local _masnip = tex._masnip

-- brackets
-- maybe rename to use characters instead of symbols?
local brackets = {
  ["("] = { "(", ")" },
  ["["] = { "[", "]" },
  ["{"] = { "\\{", "\\}" },
  ["<"] = { "\\langle", "\\rangle" },
  ["|"] = { "|", "|" },
  ["d"] = { "\\|", "\\|" },
  ["c"] = { "\\lceil", "\\rceil" },
  ["f"] = { "\\lceil", "\\rceil" },
}

M = {
  _masnip({ trig = "lr([%(%[{<|dcf])", name = "left right", dscr = "left right delimiters", regTrig = true },
    fmta(
      [[
      \left<> <> \right<><>
    ]],
      {
        f(function(_, snip)
          local cap = snip.captures[1] or '('
          return brackets[cap][1]
        end),
        d(1, utils.get_visual),
        f(function(_, snip)
          local cap = snip.captures[1] or '('
          return brackets[cap][2]
        end),
        i(0)
      })),
  _masnip({ trig = "l([%(%[{<|dcf])", name = "left", dscr = "left delimiters", regTrig = true },
    fmta(
      [[
      \left<> <> \right.<>
    ]],
      {
        f(function(_, snip)
          local cap = snip.captures[1] or '('
          return brackets[cap][1]
        end),
        d(1, utils.get_visual),
        i(0)
      })),
  _masnip({ trig = "r([%(%[{<|dcf])", name = "right", dscr = "right delimiters", regTrig = true },
    fmta(
      [[
      \left. <> \right<><>
    ]],
      {
        d(1, utils.get_visual),
        f(function(_, snip)
          local cap = snip.captures[1] or '('
          return brackets[cap][2]
        end),
        i(0)
      })),
}

return M
