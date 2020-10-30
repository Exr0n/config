" QUICK CONFIG
let g:airline_theme='cobalt2'



set nocompatible
exe 'set rtp+=' . $VIMCONFIG

call plug#begin($VIMCONFIG.'/plugged')



" Editing
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets' " https://github.com/neoclide/coc-snippets/issues/126
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"Plug 'dpc/vim-smarttabs'   // TODO: would be nice but doesn't actually work

"Decent
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wadackel/vim-dogrun'
"Favorite so far:
Plug 'shapeoflambda/dark-purple.vim' " rec
Plug 'arzg/vim-colors-xcode'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

"   HUD
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'		" .toml syntax highlighting
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'rickhowe/diffchar.vim'
"Plug 'Yggdroot/indentLine'
"let g:indentLine_char = '▏'
"let g:indentLine_conceallevel = 1
"let g:indentLine_concealcursor = 'nv'
"   tmux integration
Plug 'christoomey/vim-tmux-navigator'

" HUD Toggles
let g:rainbow_active=1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['magenta', 'cyan', 'orange', 'green', 'yellow'],
\}

let g:gitgutter_highlight_linenrs = 1 " auto highlight change line numbers
let g:gitgutter_preview_win_floating = 0 " Disable floating/popup window for <Leader>hp

" Rednering
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Zettelksaten
"Plug 'BurntSushi/ripgrep'
"Plug 'ihsanturk/neuron.vim'

" Memes
Plug 'wakatime/vim-wakatime'

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
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
set number " line numbers
set ruler " display current cursor "coordinates"
set nosm    " don't show match
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
set regexpengine=1 " supposedly makes things faster
colo dark_purple
highlight Comment cterm=italic gui=italic
highlight Conditional cterm=italic gui=italic
highlight Repeat cterm=italic gui=italic
highlight Keyword cterm=italic gui=italic

"set search stuff
set hlsearch
set incsearch
set ignorecase
set smartcase

" tab sizing
set shiftwidth=4
set ts=4
set et
set si " smart indent

" stop physical line wrapping
" https://stackoverflow.com/questions/2280030/how-to-stop-line-breaking-in-vim
set textwidth=0
set wrapmargin=0

"   persistent folds (https://til.hashrocket.com/posts/17c44eda91-persistent-folds-between-vim-sessions)
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  "autocmd BufWinLeave * echom 'hi' " TODO: don't mkview on diff files
  autocmd BufWinEnter * silent! loadview
augroup END

"   [fancy looking folds](https://dhruvasagar.com/2013/03/28/vim-better-foldtext)
function! NeatFoldText()
	let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
	let lines_count = v:foldend - v:foldstart + 1
	let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
	let foldchar = matchstr(&fillchars, 'fold:\zs.')	" TODO typo on this line?
	let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
	let foldtextend = lines_count_text . repeat(foldchar, 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

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

" nerd commenter
nmap <Leader>t <Plug>NERDCommenterInvert
xmap <Leader>t <Plug>NERDCommenterInvert

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"map cn to NERDTreeToggle
nnoremap <Leader>d :NERDTreeToggle<CR>
xnoremap <Leader>d :NERDTreeToggle<CR>

" git gutter jump to next hunk
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap ghn <Plug>(GitGutterNextHunk)
nmap <Leader>hN <Plug>(GitGutterPrevHunk)
nmap ghN <Plug>(GitGutterPrevHunk)
nmap <Leader>HN <Plug>(GitGutterPrevHunk)

" git gutter stage/revert hunk because the default seems to be broken...
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterRevertHunk)

" clipboard https://coderwall.com/p/v-st8w/vim-copy-to-system-clipboard-on-a-mac
xmap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>yy :%w !pbcopy<CR><CR>

" split direction
set splitbelow
set splitright

source $VIMCONFIG/coc-config.vim
source $VIMCONFIG/zettel.vim
noh
