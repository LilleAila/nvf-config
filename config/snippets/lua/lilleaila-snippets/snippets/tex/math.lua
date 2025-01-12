local tex = require("lilleaila-snippets.helpers.tex")
local utils = require("lilleaila-snippets.helpers.utils")
local tsnip = tex.tsnip
local _tsnip = tex._tsnip
local msnip = tex.msnip
local _msnip = tex._msnip

require("lilleaila-snippets.helpers.ls").load_vars()

local M = {
  tsnip({ trig = "mm", name = "inline math" }, [[$ $1 $]]),
  tsnip({ trig = "mf", name = "flalign math" }, [[
    \begin{flalign*}
      $1&$2 & $0
    \end{flalign*}
  ]]),
  tsnip({ trig = "ma", name = "align math" }, [[
    \begin{align*}
      $1&$2 & $0
    \end{align*}
  ]]),
  _msnip({ trig = "aa", name = "answer" }, fmta([[\ans{<>}]], {d(1, utils.get_visual)})),
}

return M
