
set nocompatible

call pathogen#infect()

set t_Co=256

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch

"set number
set relativenumber
set ruler                         " Show cursor position.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup
set noswapfile

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

set autoindent

set cursorline

set modelines=0

set background=dark

 " Make cursor move by screen line instead of by file line
nnoremap j gj
nnoremap k gk


let mapleader = ","

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:▸\              " a tab should display as "  ", trailing whitespace as "."
set listchars+=eol:¬
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen

set pastetoggle=<F2>

map <leader>n :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize = 40

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

map <leader>r ggVG=

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Copy and paste with ctrl-c and ctrl-v
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Move between windows with alt+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"You know, for example, that in Normal mode >> and <<  indent and outdent the current line. In Visual mode, a single angle bracket indents and outdents the selected block -- returning you to Normal mode immediately afterward. This can be tiresome if you were hoping to do something else with the selected region.
"Here's a nugget that will take us the rest of the way: gv starts Visual mode with the previously selected area re-selected. We can use this right in the current editing sesion to create a mapping that solves our problem.
:vmap > >gv
:vmap < <gv

" indent and unindent in visual mode with Tab and Shift-Tab
:vmap <Tab> >gv
:vmap <S-Tab> <gv

"mapping Tab to autocomplete in insert mode
"hit tab to bring up the autocompletion window, and tab or shift-tab through the options
:imap <Tab> <C-N>
:imap <S-Tab> <C-P>


" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

else
  set autoindent		" always set autoindenting on
endif

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()


if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

if &t_Co >= 256 || has("gui_running")
  colorscheme Tomorrow-Night-Eighties
endif



