" ============================================================================
" Personal .vimrc by Beau Hoyt "
" ============================================================================

" Fix vim color with screen
set t_Co=256

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Prevents VIM from being nerfed into acting like VI
set nocompatible

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Enable mouse
" on OSX press ALT and click
"" set mouse=a 

" Enabled backspace
" make backspace behave like normal again
set bs=2

" Rebhind <Leader> key
let mapleader=','

" Bind nohl
" Remove highlight of your last search
" Ctrl+m to remove highlighting
noremap <C-p> :nohl<CR>
vnoremap <C-p> :nohl<CR>
inoremap <C-p> :nohl<CR>

" Quicksave command
" Ctrl+Z to save
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
" ,+e will close out buffer
" ,+E will quit all files opened
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" Bind Ctrl + <movement> keys to move around the windows, instead of using
" Ctrl+W + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easier mvoing between tabs
" ,+n will go to previous tab
" ,+m will go to next tab
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Map sort function to a key
" s will sort normally
" S will sort in reverse 
vnoremap <Leader>s :sort<CR>
vnoremap <Leader>S :sort!<CR>

" Easier moving of code blocks
" So you don't lose your virtural select
" For better indentation
vnoremap < <gv
vnoremap > >gv 

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256       " Set max colors to 256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number " Show line numbers
set tw=79  " Width of document (used by gd)
set nowrap " Don't automatically wrap on load
set fo-=t  " Don't automatically wrap text when typing

" Display right margin column
" Set color of right display margin column
set colorcolumn=80 
highlight ColorColumn ctermbg=233

" Easier formatting of paragraphs
" Q will reorder word within 80 character limit 
vmap Q qq
nmap Q gqap

" Userful setting for history and number of undos
set history=750
set undolevels=750

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Settings for vim-powerline
" Vim powerline is a more beautiful info bar at the bottom of vim
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" Control P is a full path fuzzy file, buffer, mru, tag, ... finder for Vim
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" Ctrl+p will open control P
let g:ctrlp_max_height = 30
set wildignore+=*.pyc

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" j will map to ctrl+N
" k will map to ctrl+P
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
