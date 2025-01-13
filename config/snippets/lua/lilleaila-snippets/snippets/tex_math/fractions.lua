local ls            = require("lilleaila-snippets.helpers.ls")
local i, d, f       = ls.i, ls.d, ls.f
local fmta, postfix = ls.fmta, ls.postfix

local tex           = require("lilleaila-snippets.helpers.tex")
local utils         = require("lilleaila-snippets.helpers.utils")
local tsnip         = tex.tsnip
local _tsnip        = tex._tsnip
local msnip         = tex.msnip
local _msnip        = tex._msnip

M                   = {
  postfix({ trig = "/", name = "fraction", condition = tex.in_math, snippetType = "autosnippet" },
    fmta(
      [[\frac{<>}{<>}]],
      {
        f(function(_, parent)
          return parent.snippet.env.POSTFIX_MATCH
        end, {}), i(1)
      })),
  _msnip({ trig = "ft", name = "fraction teller" },
    fmta(
      [[
      \frac{<>}{<>}<>
    ]],
      {
        d(2, utils.get_visual),
        i(1),
        i(0)
      })),
  _msnip({ trig = "fn", name = "fraction nevner" },
    fmta(
      [[
      \frac{<>}{<>}<>
    ]],
      {
        i(1),
        d(2, utils.get_visual),
        i(0)
      })),
  msnip({ trig = "ff", name = "fraction" }, [[\frac{$1}{$2}]])
}

return M
