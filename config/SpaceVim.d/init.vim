"=============================================================================
" dark_powered.vim --- Dark powered mode of SpaceVim
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================


" SpaceVim Options: {{{
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
" }}}

" SpaceVim Layers: {{{

" SpaceVim Lang Layers: {{{
" call SpaceVim#layers#load('lang#c')
"call SpaceVim#layers#load('lang#csharp')
"call SpaceVim#layers#load('lang#dart')
"call SpaceVim#layers#load('lang#elixir')
"call SpaceVim#layers#load('lang#go')
"call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#html')
"call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
"call SpaceVim#layers#load('lang#lisp')
"call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#markdown')
"call SpaceVim#layers#load('lang#ocaml')
"call SpaceVim#layers#load('lang#perl')
"call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
"call SpaceVim#layers#load('lang#ruby')
"call SpaceVim#layers#load('lang#rust')
"call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#tmux')
"call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
" }}}

" SpaceVim Other Layers: {{{
call SpaceVim#layers#load('incsearch')
" call SpaceVim#layers#load('tools#screensaver')
"
"  This layer provides auto-completion to SpaceVim
call SpaceVim#layers#load('autocomplete')

" SpaceVim chatting layer provide chatting with qq and weixin in vim.
" call SpaceVim#layers#load('chat')

" This layer provides syntax checking feature
" call SpaceVim#layers#load('checkers')

" colorscheme provides a list of colorscheme for SpaceVim, default colorscheme is gruvbox with dark theme.
call SpaceVim#layers#load('colorscheme')

" This layer provide cscope manager for project
" call SpaceVim#layers#load('cscope')

" This layers adds extensive support for git
" call SpaceVim#layers#load('ctrlp')

" This layer provide debug workflow support in SpaceVim
" call SpaceVim#layers#load('debug')

" lt layer contains none plugins, but it has some better default config for vim and neovim
call SpaceVim#layers#load('default')

" Another Unite centric work-flow which use denite
" call SpaceVim#layers#load('denite')

" This layers adds extensive support for git
call SpaceVim#layers#load('git')

" This layer provides GitHub integration for SpaceVim
call SpaceVim#layers#load('github')

" list of available layers in SpaceVim
" call SpaceVim#layers#load('index')

" This layers provides language server protocol for vim and neovim
" call SpaceVim#layers#load('language-server-protocol')

" This layer provide shell support in SpaceVim
call SpaceVim#layers#load('shell')

" This layer provide tags manager for project
" call SpaceVim#layers#load('tags')

" This layer provides Dash integration for SpaceVim
" call SpaceVim#layers#load('tools#dash')

" Awesome UI layer for SpaceVim, provide IDE-like UI for neovim and vim in both TUI and GUI
" call SpaceVim#layers#load('ui')
" }}}

" }}}

" Custom Plugins: {{{
let g:spacevim_custom_plugins = [
\ ['gioele/vim-autoswap'],
\ ['kergoth/vim-bitbake', {'on_ft' : 'bitbake'}],
\ ['tpope/vim-commentary'],
\ ['tpope/vim-fugitive'],
\ ['tpope/vim-markdown', {'on_ft' : 'markdown'}],
\ ['wsdjeg/GitHub.vim'],
\ ]
" }}}
" ['malithsen/trello-vim'], " Needs python2

" Vim Before SpaceVim: {{{

" SpaceVim: {{{
" let g:spacevim_unite_leader = 'f'
" let g:spacevim_denite_leader = 'F'
" let g:spacevim_windows_leader = 's'
" let g:spacevim_enable_language_specific_leader = '1'
" let g:spacevim_windows_smartclose = 'q'
" }}}

" Vim: {{{
let g:spacevim_unite_leader = ';f'
let g:spacevim_denite_leader = ';F'
let g:spacevim_windows_leader = ';s'
let g:spacevim_enable_language_specific_leader = '0'
let g:spacevim_windows_smartclose = ''
" }}}

" }}}

" Tweak General Settings: {{{

" let g:spacevim_colorscheme = 'solarized'

" }}}

