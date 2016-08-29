	"-------------------------------------------------
"	New Mappings
"-------------------------------------------------
"
"	
"	:w 		replaces w!
"	:W 		replaces sudo save
"	[ALT] + j/k 	moves lines of text
"	
"			From Surround Plugin
"	***************************************
"	(Inside of (),[] {}, '', " ")
"	
"		cs"'			"Hello world"		changes surroundings
"		changes to		'Hello world'
"
"		cs'<q>			'Hello world'
"		changes to		<q>Hello world</q>
"
"		cst"			<q>Hello world</q>	
"		changes to		"Hello world"
"		
"		ds"				"Hello world"		removes surroundings
"		changes to		Hello world
"
"	(With curor on word)
"		
"		ysiw]			Hello world			places surroundings on word
"		changes to		[Hello] world
"		
"		cs]{			[Hello] world		change surroundings
"		changes to		{ Hello } world	
"
"		yssb or yss)	{ Hello } world		wraps entire line
"		changes to		({ Hello } world)
"
"	

""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction

inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Colors and Syntax
syntax on

" 	set clipboard=unnamedplus
	
" Highlights cursor line
set cursorline

" Set line number
set relativenumber

"For Filetype Plugins
filetype plugin on
filetype indent on

" Auto reads file when changed outside of VIM
set autoread

" Use mouse
set mouse=a

" Map leader, more key combinations (look this shit up later)
let mapleader = ","
let g:mapleader = ","

" Saves stuff quickly (only need w instead of !w)
nmap<leader>w :w!<cr>
nmap<leader>q : <C-z><cr>

" Move 10 lines at a time
set so=10

" Sets line number relative to your position

" Turn Wildmenu on
set wildmenu

set winheight=20

" Wildmenu ignores compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Sets terminal color to 256
set t_Co=256

" Shows current position '??'
set ruler

" So backspace isn't retarded
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Case insensitive search
set ignorecase

" Doesn't redraw for every macro
set lazyredraw

" For regular expressions (Might take this out idk)
set magic

" Shows matching brackets when cursor is over it
set showmatch

" Standard encoding (I'm sure this is useful for something but idk what)
set encoding=utf8


" Folding
set foldmethod=syntax
"-------------------------------------------------
"		Tabbing shit
"-------------------------------------------------

set smarttab

" Smaller tab width
set shiftwidth=4
set tabstop=4

" Auto-indent, Smart-indent, Wrap-lines
set ai
set si
set wrap 

"-------------------------------------------------
"		Moving Text Around
"-------------------------------------------------

" Remap VIM 0 to first non-blank character
map 0 ^

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"-------------------------------------------------
"			Plugins
"-------------------------------------------------
"
"	Plug-vim

call plug#begin()

	Plug 'gioele/vim-autoswap' 			" Fixes that annoying auto-swap shit
	Plug 'tpope/vim-surround'			" Useful mappings for parentheses, brackets and quote handeling
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'joshdick/airline-onedark.vim'
	Plug 'tmhedberg/simpylfold'
	Plug 'scrooloose/syntastic'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'joshdick/onedark.vim'			" Fuzzy file search
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'majutsushi/tagbar'
	Plug 'raimondi/delimitmate'			" Automatic delimiter closing
	Plug 'terryma/vim-multiple-cursors'	" Multiple cursors, this shit is crazy... http://vimawesome.com/plugin/vim-multiple-cursors
	Plug 'Yggdroot/indentLine'
	Plug 'mattn/emmet-vim'
	Plug 'w0ng/vim-hybrid'

call plug#end()

" Fix air-line problem
set laststatus=2

set background=dark

let g:hybrid_custom_term_colors = 1
let g:onedark_termcolors=256
colorscheme onedark
inoremap <C-n> <Esc>
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprev<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>vs :vsplit<CR><C-w><C-w>:CtrlP<CR>

" This is for onedark color scheme
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Airline Conf
let g:airline_theme='onedark'
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
cmap <F5> :TagbarToggle<CR>

" Misc remaps
nnoremap <leader>= :!open %<CR>
let g:multi_cursor_exit_from_insert_mode=0
