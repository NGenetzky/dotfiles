set list
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" http://vim.wikia.com/wiki/Su-write
command WriteSudo w !sudo tee "%" > /dev/null

imap jk <Esc>
set bg=dark

if v:progname =~? "nvim"
  " guicursor
  " https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
  set guicursor=
  " Workaround some broken plugins which set guicursor indiscriminately.
  autocmd OptionSet guicursor noautocmd set guicursor=
endif

" http://vim.wikia.com/wiki/Insert_current_date_or_time
nnoremap <leader>d "=strftime("%Y-%m-%d")<CR>P
nnoremap <leader>t "=strftime("%FT%T%z")<CR>P
" inoremap <F5> <C-R>=strftime("%c")<CR>

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab
"
set modeline

autocmd FileType cpp setlocal commentstring=//\ %s

set noautoindent
