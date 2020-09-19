" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
" set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set tabstop=2       " Number of spaces that a <Tab> in the file counts for.  set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.

set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.

set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.

set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.

set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

set ignorecase      " Ignore case in search patterns.

set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.

set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.

set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).

set textwidth=79    " Maximum width of text that is being inserted. A longer

set noswapfile

set modifiable

set statusline=[%t]%y%r%m%*%=[%c,%l/%L=%p%%]

filetype plugin indent on
syntax on

set cursorline

highlight cursorline   cterm=underline


au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'https://github.com/vim-scripts/L9'
Plugin 'https://github.com/jistr/vim-nerdtree-tabs'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'beautify-web/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomtom/tlib_vim'
Plugin 'tomtom/tskeleton_vim'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'https://github.com/mattn/livestyle-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tomasr/molokai'
Plugin 'Slashbunny/vim-colorsamplerpack'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let javascript_enable_domhtmlcss = 1


".vimrc
" map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType ts noremap <buffer> <c-f> :call JsBeautify()<cr>
" for json
" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css,less noremap <buffer> <c-f> :call CSSBeautify()<cr>
" autocmd BufNewFile *.php 0r  ~/.vim/bundle/skeletons.vim/skeletons/skeleton.php
autocmd FileType *  noremap <buffer> <c-x> :%s/\(\s*\)$//g <cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


let tskelUserName = 'shangwenhe'
let tskelDateFormat = "%Y-%m-%d %H:%M"

autocmd BufNewFile *.class\.js  TSkeletonSetup template.class.js
autocmd BufNewFile *.js,*.jsx,*.es  TSkeletonSetup template.js
autocmd BufNewFile *.html  TSkeletonSetup template.html
autocmd BufNewFile *.css  TSkeletonSetup template.css
autocmd BufNewFile *.tmpl  TSkeletonSetup template.tmpl
autocmd BufNewFile *.jade  TSkeletonSetup template.jade
autocmd BufNewFile *.vue  TSkeletonSetup template.vue
autocmd BufNewFile *.ts TSkeletonSetup template.ts


"autocmd BufNewFile /here/*.suffix TSkeletonSetup othertemplate.suffix
autocmd FileType jsx set filetype=js
autocmd FileType es set filetype=js
autocmd FileType ts set filetype=ts

" autocmd FileType jess  noremap <buffer> <c-f> :call normal()<cr>

" typescript
autocmd FileType typescript :set makeprg=tsc
autocmd BufRead,BufNewFile *.ts setfiletype typescript
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" color
let g:molokai_original = 1
let g:rehash256 = 1


set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'

let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=30
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.git']
let g:netrw_liststyle=3
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
