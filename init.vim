" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')

    " Theme
    Plug 'dracula/vim'
    Plug 'joshdick/onedark.vim'
    Plug 'cocopon/iceberg.vim'


    " Better Syntax Support
    Plug 'sheerun/vim-polyglot' 

    " File Explorer
    Plug 'scrooloose/NERDTree'

    " NERDTtree addons
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'scrooloose/nerdcommenter'
    Plug 'ryanoasis/vim-devicons'

    " Git 
    Plug 'airblade/vim-gitgutter'
    Plug 'jreybert/vimagit'

    " Syntacsis check
    Plug 'scrooloose/syntastic' 

    " Сoc - autocomplite 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " File Search
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Autocomplete
    "Plug 'Valloric/YouCompleteMe

    " Comments
    Plug 'preservim/nerdcommenter'

    " Csv 
    Plug 'chrisbra/csv.vim'

    " Tagbar
    Plug 'majutsushi/tagbar'

    " Spellcheck
    Plug 'kamykn/spelunker.vim'

    " Nice buttery icon
    Plug 'lambdalisue/battery.vim'

    " Go support
    Plug 'fatih/vim-go'

    " Bottom status
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Enable theming support
" if (has("termguicolors"))
"   set termguicolors
" endif

" Open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" File Explorer settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeGitStatusWithFlags = 1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" File Serach settings
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Comments settings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Bottom line settings
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" TagBar setting
nmap <F8> :TagbarToggle<CR>

" Vimagit setting
nmap <F7> :Magit<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Battery icon
let g:battery#update_statusline = 1 " For statusline.

" Spellcheck settings
set spell

" Vim settings
set nocompatible
set t_Co=256
set number
set ruler
set autowriteall