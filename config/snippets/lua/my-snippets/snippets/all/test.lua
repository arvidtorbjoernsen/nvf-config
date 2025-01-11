local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local M = {
  s("test123", t("Hello, World!")),
  s({ trig = "hmm", snippetType = "autosnippet" }, t("Lorem ipsum"))
}

return M
