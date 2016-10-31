" ################################
" # 2014. WTFPL.                 #
" #.vimrc by David Aizenberg     #
" # david.aizenberg@paranoici.org# 
" ################################

" #Requirements: Pathogen, Airline, NERDTree, Mustang colour theme

" Turn syntax highlight on.
syntax on



"for future use.
let mapleader = ","

"Enable Pathongen
execute pathogen#infect() 

"Enable Airline
set laststatus=2
let g:airline_powerline_fonts = 1 

autocmd VimEnter * NERDTree

"bind F2 as a Toggle for NERDTree
map <F2> :NERDTreeToggle<CR>

"Configure vim to backup files, might save sometime, definitely will not hurt.
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set autochdir

" Make Vim highlight current line
set cul                          

" Enable line Numbers on left, and set their colour.
set number
highlight LineNr ctermfg=grey


"set list                        " show invisible characters
"set mouse=a                     " try to use a mouse in the console (wimp!)
set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set noexpandtab

" ###############################
" # Language Dependent settings #
" ###############################


" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Makefiles
autocmd FileType make setlocal noexpandtab

" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
let javascript_enable_domhtmlcss=1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


" Set 256 colour mode and Theme.
set t_Co=256
colorscheme mustang

