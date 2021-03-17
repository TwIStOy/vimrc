let g:UltiSnipsExpandTrigger = '<c-e>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = 'vertical'

" Register postfix snippets
py3 from snippet_tools.cpp import register_postfix_snippets
py3 register_postfix_snippets()

" vim: et ts=2 sw=2
