if !has('nvim')
  set nocompatible                    " be iMproved, required
endif

" Install VimPlug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" Install Harlequin theme
if empty(glob('~/.vim/colors/harlequin.vim'))
  !curl -fLo ~/.vim/colors/harlequin.vim --create-dirs https://raw.githubusercontent.com/nielsmadan/harlequin/master/colors/harlequin.vim
endif

" Plugins!!
call plug#begin()

Plug 'tpope/vim-sensible'                    " Some sensible settings
Plug 'tpope/vim-sleuth'                      " Autodetect file spacing
Plug 'scrooloose/nerdcommenter'              " Awesome Commenting
Plug 'bronson/vim-trailing-whitespace'       " Display trailing whitespace
Plug 'vim-scripts/auto-pairs-gentle'         " Add brackets automatically
Plug 'vim-scripts/autoswap.vim'              " Handle swap files intelligently
Plug 'vim-scripts/AutoComplPop'              " Auto Complete Popup
Plug 'sheerun/vim-polyglot'                  " Mega language support pack
Plug 'ervandew/supertab'                     " Autocomplete
Plug 'igorjan94/codeforces.vim'              " CodeForces PlugIn
Plug 'junegunn/vim-easy-align'               " CodeForces PlugIn - Dependency Beautiful standings
Plug 'aperezdc/vim-template'                 " Load Template
Plug 'shougo/vimfiler.vim'                   " File Manager
Plug 'shougo/unite.vim'                      " File Manager Dependency
Plug 'cocopon/vaffle.vim'                    " File Manager
"Plug 'vim-scripts/DeleteTrailingWhitespace' " Delete Trailing Whitespace
Plug 'ensime/ensime-vim'                     "Ensime Plugin For Scala
Plug 'derekwyatt/vim-scala'                  "Vim-Scala gor scala file type detection
Plug 'vim-syntastic/syntastic'               "Syntax checking hacks for vim
Plug 'morhetz/gruvbox'                       "Theme.

call plug#end()

if !has('nvim')
  set t_Co=256
endif

"set termguicolors
set background=dark
colorscheme gruvbox

set number                      " Show line number
set relativenumber              " Show relative line number
set showcmd                     " Show current command
set showmode                    " Show current mode
set wildmode=longest:list,full  " Autocomplete
set wildignore=*.o,*.obj,*~     " Ignore file
set showmatch                   " highlight matching braces
set autoindent                  " In vim-sensible
"set backspace=indent,eol,start  " In vim-sensible
"set smarttab                    " In vim-sensible
"set incsearch                   " In vim-sensible
"set laststatus=2                " In vim-sensible
"set ruler                       " In vim-sensible
"set wildmenu                    " In vim-sensible
"set expandtab                   " In vim-sleuth
set hlsearch                    " Highlight search
set ignorecase                  " ignore case while searching
set smartcase                   " unless uppercase explicitly mentioned
set smartindent                 " indent smartly
set nowrap                      " Don't wrap text
set scrolloff=5                 " Minimum space on bottom/top of window
set sidescrolloff=7             " Minimum space on side
set sidescroll=1
set list                        " Display hidden chars as defined below
set listchars=tab:▷⋅,trail:⋅,nbsp:+,extends:»,precedes:«
set splitright                  " Open vsp on right

" Function to set cursor postion
function! SetCursorPosition()
  " dont do it when writing a commit log entry
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  else
    call cursor(1,1)
  endif
endfunction
autocmd! BufReadPost * call SetCursorPosition()

" Filetype specific settings
autocmd! filetype svn,*commit*,markdown setlocal spell         " Spell Check
autocmd! filetype svn,*commit*,markdown setlocal textwidth=72  " Looks good
autocmd! filetype make setlocal noexpandtab                    " In Makefiles DO NOT use spaces instead of tabs

set ff=unix

" Easy mistake ; instead of :
nnoremap ; :
vnoremap ; :
" Easily Comment out using NERDCommenter
nmap // <leader>c<space>
vmap // <leader>cs
" Move lines up(-) or down(_)
noremap - ddp
noremap _ ddkP
" Write file as sudo
cnoremap w!! w !sudo tee > /dev/null %

" Display Filename
set statusline=%<%#identifier#
set statusline+=[%f]
set statusline+=%*

" Display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%y  " FileType
set statusline+=%h  " Help Tag

" Read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

" Modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

" Syntastic Error messages
set statusline+=%#warningmsg#
if exists(':SyntasticInfo')
  set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*

"Syntastic Plugin Configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%=
set statusline+=%-14.(%c%V\ ,\ %l/%L%)\ %P

"Set tab size to 4 Spaces
set tabstop=4
set shiftwidth=4
set expandtab

autocmd BufWritePre * :%s/\s\+$//e " Trim Trailing Whitespace

" Plugin Settings

"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <sid>"\<Tab>"
"inoremap <silent> <CR> <C-r>=<SID>pumvisible() ? "\<C-y>" : "\<CR>"<CR>
