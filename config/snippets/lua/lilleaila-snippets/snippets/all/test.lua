local ls = require("lilleaila-snippets.helpers.ls")
local s, t = ls.s, ls.t
local word = require("lilleaila-snippets.helpers.util").word

local M = {
  s("test123", t("Hello, World!")),
  s({ trig = "hmm", snippetType = "autosnippet" }, t("Lorem ipsum")),
  s({ trig = "abc", snippetType = "autosnippet", wordTrig = false }, t("42"), { condition = word })
}

return M
