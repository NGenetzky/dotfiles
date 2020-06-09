" Plug 'Shougo/unite.vim'
" Denite requires Neovim or Vim8.0+ with if_python3.
" Plug 'Shougo/denite.nvim'
"

Plug 'vim-syntastic/syntastic'

Plug 'mhinz/vim-grepper'


" filetype
Plug 'kergoth/vim-bitbake'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'

" Lint/Checker
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'ntpeters/vim-better-whitespace'

" Visual
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" Python
" Plug 'python-mode/python-mode'

" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'

" Fuzzy File Finder
" Plug 'ctrlpvim/ctrlp.vim'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'Chiel92/vim-autoformat'
Plug 'tell-k/vim-autopep8'

Plug 'ctrlpvim/ctrlp.vim'
