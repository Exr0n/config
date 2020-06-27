" QUICK CONFIG
let g:airline_theme='cobalt2'



set nocompatible
exe 'set rtp+=' . $VIMCONFIG

call plug#begin($VIMCONFIG.'/plugged')

" Meta File Stuff
Plug 'scrooloose/nerdtree'
" auto quit if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" auto start on the correct window (not nerdtree)
autocmd vimenter * wincmd l

let NERDTreeShowHidden=1

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

Plug 'rickhowe/diffchar.vim'

" Editing
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsSnippetDirectories = [$CONFIG . '/coc/UltiSnips', 'UltiSnips']
" let g:UltiSnipsExpandTrigger="jn"
" let g:UltiSnipsJumpForwardTrigger="jk"
" let g:UltiSnipsJumpBackwardTrigger="kj"
" LSP / Linting
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" CoC options

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
imap <C-f> <Plug>(fzf-complete-line)
nmap <C-f> :Lines<return>

" Colors
" Plug 'cocopon/pgmnt.vim'
" Plug 'keith/parsec.vim'
" Plug 'niklas-8/vim-darkspace'
" Plug 'cocopon/iceberg.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'kaicataldo/material.vim'
" Plug 'pgavlin/pulumi.vim'
" Plug 'Badacadabra/vim-archery'
" Plug 'ayu-theme/ayu-vim' " rec
" Plug 'vim-scripts/pink'
" Plug 'ntk148v/vim-horizon'
" Plug 'victorze/foo'
" Plug 'sainnhe/edge'
" Plug 'jdsimcoe/abstract.vim'
" Plug 'rainglow/vim'
"Decent 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wadackel/vim-dogrun'
"Favorite so far:
Plug 'shapeoflambda/dark-purple.vim' " rec
Plug 'arzg/vim-colors-xcode'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

"   HUD
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" TODO: failed attempt at loading it later and async
"Plug 'vim-airline/vim-airline', { 'on': 'MyAsyncLoad' }
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = 'nv'
"   tmux integration
"Plug 'edkolev/tmuxline.vim' | source $VIMCONFIG/tmuxline-config.vim
Plug 'christoomey/vim-tmux-navigator'

" HUD Toggles
Plug 'junegunn/limelight.vim'
let g:limelight_default_coefficient = 0.3
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_paragraph_span = 1

let g:rainbow_active=1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['magenta', 'cyan', 'orange', 'green', 'yellow'],
\}

let g:gitgutter_highlight_linenrs = 1 " auto highlight change line numbers
let g:gitgutter_preview_win_floating = 0 " Disable floating/popup window for <Leader>hp

" Rednering
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

call plug#end()


" My Customs
" " CUSTOM: change backup dir https://stackoverflow.com/a/1625850/10372825
set backupdir=$VIMCONFIG/autogentmp//
set directory=$VIMCONFIG/autogentmp//
set undodir=$VIMCONFIG/autogentmp//,~/.vim/autogentmp/undo//

" jump to previous position https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

" from https://www.linode.com/docs/tools-reference/tools/introduction-to-vim-customization/
set ttyfast " speed up scrolling
set scrolloff=5 " display 8 lines above and below cursor at all times
set matchpairs+=<:>

" autoread (https://vi.stackexchange.com/a/13092)
set autoread
au FocusGained,BufEnter * :checktime

" passive and HUD
autocmd VimEnter * AirlineRefresh " TODO: cuz it doesn't work sometimes:
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
autocmd VimEnter * RainbowToggleOn " TODO: also jank
set number " line numbers
set ruler " display current cursor "coordinates"
set showmatch " highlight the matching bracket
" show invisibles
set encoding=utf-8
set listchars=eol:⏎,tab:→·,trail:·,extends:>,precedes:<
set list


" colors
" fix neovim's weird highlight (https://github.com/neovim/neovim/issues/9019#issuecomment-521532103)
function! s:CustomizeColors()
	if has('guirunning') || has('termguicolors')
		let cursorline_gui=''
		let cursorline_cterm='ctermfg=white'
	else
		let cursorline_gui='guifg=white'
		let cursorline_cterm=''
	endif
	exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction

augroup OnColorScheme
	autocmd!
	autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END

" force vim to use true colors (https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be)
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"colo darkspace
"colo material | let g:material_theme_style = 'ocean'
"colo ayu | let ayucolor="mirage" " for mirage version of theme
"colo dracula
"colo archery
"colo onehalfdark
"colo xcodedarkhc
"colo hyper
colo dark_purple


"TODO: this doesn't work??
highlight Comment cterm=italic gui=italic

"set search stuff
set hlsearch
set incsearch
set ignorecase
set smartcase
" remove search highlight on escape
" nnoremap <esc> :noh<return><esc>

" tab sizing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ai " autoindent
set si " smart indent

" stop physical line wrapping
" https://stackoverflow.com/questions/2280030/how-to-stop-line-breaking-in-vim
set textwidth=0
set wrapmargin=0

" code folding: https://codeyarns.com/2014/09/02/how-to-fold-code-in-vim/
set foldmethod=indent
set foldlevelstart=5
set nofoldenable
"   persistent folds (https://til.hashrocket.com/posts/17c44eda91-persistent-folds-between-vim-sessions)
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" cursor stuff
set mouse=a

" background and performance
set lazyredraw " don't redraw when executing macros
set updatetime=100

" Delete trailing white space on save, useful for some filetypes ;)
" Stolen from https://github.com/nickmahd/.vim/blob/master/vimrc in Jan 2020
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.cpp :call CleanExtraSpaces()
endif


" custom keymaps
let mapleader = " "
set timeoutlen=500

nnoremap q: <Nop>

nnoremap <Leader>h :noh<return>
" nerd commenter
nmap <Leader>t <Plug>NERDCommenterInvert
xmap <Leader>t <Plug>NERDCommenterInvert

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"map cn to NERDTreeToggle
nmap <Leader>n :NERDTreeToggle<CR>
xmap <Leader>n :NERDTreeToggle<CR>

" git gutter jump to next hunk
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap ghn <Plug>(GitGutterNextHunk)
nmap <Leader>hN <Plug>(GitGutterPrevHunk)
nmap ghN <Plug>(GitGutterPrevHunk)
nmap <Leader>HN <Plug>(GitGutterPrevHunk)

" git gutter stage/revert hunk because the default seems to be broken...
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterRevertHunk)

"no escape key (escape pressing escape)
inoremap jc <Esc>
inoremap jt <Esc>:w<return>
" movement in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>

" clipboard https://coderwall.com/p/v-st8w/vim-copy-to-system-clipboard-on-a-mac
xmap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>yy :%w !pbcopy<CR><CR>

" split direction
set splitbelow
set splitright

source $VIMCONFIG/coc-config.vim
noh
