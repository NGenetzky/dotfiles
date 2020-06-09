"" altercation/vim-colors-solarized
let g:solarized_termtrans=1

"" vim-syntastic/syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0

"" mhinz/vim-grepper

" nnoremap <leader>g :Grepper -tool git<cr>
" nnoremap <leader>G :Grepper -tool ag<cr>

" nmap gs <plug>(GrepperOperator)
" xmap gs <plug>(GrepperOperator)

" " Optional. The default behaviour should work for most users.
" let g:grepper               = {}
" let g:grepper.tools         = ['git', 'ag', 'rg']
" let g:grepper.jump          = 1
" let g:grepper.next_tool     = '<leader>g'
" let g:grepper.simple_prompt = 1
" let g:grepper.quickfix      = 0

