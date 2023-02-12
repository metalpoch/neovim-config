set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode

" --- Terminal inside neovim
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
    "split term://zsh
    split term://bash
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" MAP KEY
let mapleader=" "
" Save
nmap <leader>w :w<CR>
" Close
nmap <leader>q :q<CR>
" Clean mark from previus search
nnoremap <silent> <leader>z :nohlsearch<CR>

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

call plug#begin('~/.vim/plugged')
" Theme
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'vim-airline/vim-airline' " A cool status bar
Plug 'sonph/onehalf', { 'rtp': 'vim' }'

" UI
Plug 'easymotion/vim-easymotion' " Move between words (space+m)
Plug 'scrooloose/nerdcommenter' " Comment/Uncomment tool
Plug 'ryanoasis/vim-devicons' " Icons over NerdTree
Plug 'jiangmiao/auto-pairs' " Auto-close braces and scopes
Plug 'scrooloose/nerdtree' " A Tree-like side bar for better navigation
Plug 'Yggdroot/indentLine' " Identline

" Git
Plug 'tpope/vim-fugitive'

" HTML5 
Plug 'mattn/emmet-vim' " Auto close tags html with: ,,

" React syntax highlighting
Plug 'yuezk/vim-js' "JS
Plug 'HerringtonDarkholme/yats.vim' "TS
Plug 'maxmellon/vim-jsx-pretty' "JSX-TSX
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } "Styles
Plug 'jparise/vim-graphql' "graphql

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" nvim styles
" -----------------------------------------------
syntax on
set t_Co=256
colorscheme onehalfdark
let g:lightline = { 'colorscheme': 'onehalfdark' }
" -----------------------------------------------

" 
" Coc extensions
"---------------
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-git',
  \ 'coc-sh',
  \ ]

"---------------
"
" Coc Settings
"----------------------------------------------------------------------------------
" display diagnostics (errors and warnings) in a tooltip for words you cursor over
nnoremap <silent> K :call CocAction('doHover')<CR>

" Navigating 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" navigate my current file by jumping to the next or previous error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
"----------------------------------------------------------------------------------

" Javascript/Typescript Enviroment Settings
"-----------------------------------------------------------------------------------
" enable buffering on javascript/typescript input and disable on exit
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" optionally install if these modules exist
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
"-----------------------------------------------------------------------------------


" Othe pluggins
"-----------------------------------------------------------------------------------
"
" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,hbs,ejs,htmldjango,jsx EmmetInstall
let g:user_emmet_leader_key=','
"
" Easymotion
nmap <leader>m <Plug>(easymotion-s2)
"
" Nerdtree
let g:NERDTreeChDirMode = 2
nmap <F2> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
"
" NerdCommenter
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
"
" Identline
let g:indentLine_fileTypeExclude = ['text', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
"-----------------------------------------------------------------------------------
