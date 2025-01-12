local M = {}

-- This is not the cleanest way to do it at all, but it makes it a bit easier to use the variables in snippets
-- FIXME: don't pollute the global namespace
function M.load_vars()
  local ls = require("luasnip")
  local extras = require("luasnip.extras")

  _G.ls = ls
  _G.extras = extras
  _G.s = ls.snippet
  _G.sn = ls.snippet_node
  _G.isn = ls.indent_snippet_node
  _G.t = ls.text_node
  _G.i = ls.insert_node
  _G.f = ls.function_node
  _G.c = ls.choice_node
  _G.d = ls.dynamic_node
  _G.r = ls.restore_node
  _G.l = extras.lambda
  _G.rep = extras.rep
  _G.p = extras.partial
  _G.m = extras.match
  _G.n = extras.nonempty
  _G.dl = extras.dynamic_lambda
  _G.fmt = require("luasnip.extras.fmt").fmt
  _G.fmta = require("luasnip.extras.fmt").fmta
  _G.conds = require("luasnip.extras.expand_conditions")
  _G.postfix = require("luasnip.extras.postfix").postfix
  _G.types = require("luasnip.util.types")
  _G.parse = require("luasnip.util.parser").parse_snippet
  _G.ms = ls.multi_snippet
end

return M
