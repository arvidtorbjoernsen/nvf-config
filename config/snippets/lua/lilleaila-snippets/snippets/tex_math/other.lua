local ls = require("lilleaila-snippets.helpers.ls")
local i, rep, fmta = ls.i, ls.rep, ls.fmta
local tex = require("lilleaila-snippets.helpers.tex")
local utils = require("lilleaila-snippets.helpers.util")
local tsnip = tex.tsnip
local _tsnip = tex._tsnip
local msnip = tex.msnip
local _msnip = tex._msnip
local fsnip = tex.fsnip
local _fsnip = tex._fsnip

return {
  fsnip({ trig = "lim", descr = "Limit" }, [[\lim_{$1 \to \infty}]]),

  fsnip("pm", [[\pm]]),
  fsnip("in", [[\in]]),
  fsnip("notin", [[\notin]]),
  fsnip("forall", [[\forall]]),
  fsnip("impl", [[\implies]]),
  fsnip("iff", [[\iff]]),
  fsnip("ø", [[\emptyset]]),

  _fsnip({ trig = "kv1", descr = "Første kvadratsetning" },
    fmta(
      [[\left(<>+<>\right)^{2} = <>^{2} + 2 \cdot <> \cdot <> + <>^{2}]],
      { i(1), i(2), rep(1), rep(1), rep(2), rep(2) }
    )),
  _fsnip({ trig = "kv2", descr = "Andre kvadratsetning" },
    fmta(
      [[\left(<>-<>\right)^{2} = <>^{2} - 2 \cdot <> \cdot <> + <>^{2}]],
      { i(1), i(2), rep(1), rep(1), rep(2), rep(2) }
    )),
  _fsnip({ trig = "kv3", descr = "Tredje kvadratsetning / konjugatsetningen" },
    fmta(
      [[\left(<>+<>\right) \left(<>-<>\right) = <>^{2} - <>^{2}]],
      { i(1), i(2), rep(1), rep(2), rep(1), rep(2) }
    ), { condition = tex.in_math }),
  _fsnip({ trig = "abc", descr = "ABC-formelen" },
    fmta(
      [[x = \frac{-<> \pm \sqrt{<>^{2} - 4 \cdot <> \cdot <>}}{2 \cdot <>} ]],
      { i(2, "b"), rep(2), rep(1), i(3, "c"), i(1, "a") }
    )),
}
