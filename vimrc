vim9script noclear

if exists('loaded') | finish | endif

var loaded = true
set runtimepath+=$HOME/project/vimrc/myslot

# vim-plug
#
# Install vim-plug if it's not ready.
#
# To know whether vim-plug has been installed or not, check whether this file
# exists:
#
#   ~/.vim/autoload/plug.vim
#
if !filereadable($HOME .. '/.vim/autoload/plug.vim')
  silent system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs'
    .. 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  au VimEnter * PlugInstall | so $MYVIMRC
endif

# Disable shallow cloning, full copy of these repos.
g:plug_shallow = 0

# Prefer python3
set pyxversion=3

# Install Plugins
#
# Plugins declared after this line will be downloaded inside '~/.vim/plugged'
#
plug#begin('~/.vim/plugged')

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'skywind3000/asyncrun.vim'

Plug 'tenfyzhong/axring.vim'

Plug 'Yggdroot/indentLine'

Plug 'itchyny/lightline.vim'

# Theme
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'SirVer/ultisnips'

Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

plug#end()

# Enable `termguicolors` *before* sourcing the color scheme.
if ['gnome', 'konsole', 'rxvt-unicode', 'st', 'tmux', 'xterm']
	->map((_, v: string): string => v .. '-256color')
	->index(&term) >= 0 && $COLORTERM != 'xfce4-terminal'
  set termguicolors
  if !has('gui_running')
    &t_8f = "\e[38;2;%lu;%lu;%lum"
    &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
endif

