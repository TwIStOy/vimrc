vim9script noclear

# nightfly settings
g:nightflyCursorColor         = 1
g:nightflyUnderlineMatchParen = 1
g:nightflyTransparent         = 1

# Enable nightfly
colorscheme nightfly

# Enable nightfly for lightline
g:lightline = get(g:, 'lightline', {})
g:lightline.colorscheme = 'nightfly'

def s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif

  try
    lightline#init()
    lightline#colorscheme()
    lightline#update()
  catch
  endtry
enddef

s:lightline_update()

# vim: et sw=2 ts=2
