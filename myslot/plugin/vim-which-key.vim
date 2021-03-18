vim9script noclear

################################
#  Settings for vim-which-key  #
################################

# Shorter timeoutlen makes which-key buffer popup quickly.
set timeoutlen=500

# Make <space> to be <leader> now.
g:mapleader = "\<Space>"

###################################
#  KeyMappings for vim-which-key  #
###################################
nnoremap <silent><leader> :WhichKey '<space>'<CR>



