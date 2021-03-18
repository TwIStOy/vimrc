vim9script noclear

# Backspace settings:
#   - allow backspacing over autoindent
#   - allow backspacing over line breaks
#   - allow backspacing over the start of insert
set backspace=indent,eol,start

# Set internal encoding of vim, since coc.nvim using some unicode characters
set encoding=utf-8

# TextEdit might fail hidden is not set
set hidden

# Some servers have issues with backup files, @coc.nvim
set nobackup
set nowritebackup

# More space to display messages
set cmdheight=2

set updatetime=300

# Don't pass messages to |ins-completion-menu|.
set shortmess+=c

# Always show signcolumn, otherwise it would shift the text each time when
# diagnostics appear.
if has('patch-8.1.1564')
  # Recently vim can merge number column and signcolumn into one
  set signcolumn=number
else
  set signcolumn=yes
endif

# Show number column
set nu

#############
#  diffopt  #
#############
# The 'patience' algorithm gives more readable diffs
set diffopt+=algorithm:patience
# only 3 lines of context above/below a changed line
set diffopt+=context:3
# use only 1 column for the foldcolumn, instead of 2
set diffopt+=foldcolumn:1
# turn off diff mode automatically for a buffer which becomes hidden
set diffopt+=hiddenoff
set diffopt+=indent-heuristic
set diffopt+=vertical

set noemoji

set history=1000

set shiftwidth=2
set smarttab
set softtabstop=-1

set scrolloff=5
set sidescrolloff=5
set sidescroll=5
set scrollopt+=hor

# Disable bell
set noerrorbells
set visualbell
set t_vb=
