require("lilleaila-snippets.helpers.ls").load_vars()

local word = require("lilleaila-snippets.helpers.utils").word

local M = {
  s("test123", t("Hello, World!")),
  s({ trig = "hmm", snippetType = "autosnippet" }, t("Lorem ipsum")),
  s({ trig = "abc", snippetType = "autosnippet", wordTrig = false }, t("42"), { condition = word })
}

return M
