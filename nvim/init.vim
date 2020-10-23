"
"   This is the personal .vimrc file of wanglk.
"   You can find me at https://github.com/wlk1204/wlk1204-vim
"

" ==========
" Environment
" ==========
  silent function! OSX()
      return has('macunix')
  endfunction
  silent function! LINUX()
      return has('unix') && !has('macunix') && !has('win32unix')
  endfunction
  silent function! WINDOWS()
      return  (has('win32') || has('win64'))
  endfunction

" ==========
" Windows Compatible
" ==========
  set nocompatible  " Must be first line

  if !WINDOWS()
      set shell=/bin/sh
  endif
  if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  endif

" ==========
" GUI Settings
" ==========
  if has('gui_running')
      set guioptions-=T           " Remove the toolbar
      set lines=40                " 40 lines of text instead of 24
      if LINUX() && has("gui_running")
          set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
      elseif OSX() && has("gui_running")
          set guifont=HackNerdFontComplete-Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h14,Courier\ New\ Regular:h14
      elseif WINDOWS() && has("gui_running")
          set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
      endif
  else
      if &term == 'xterm' || &term == 'screen'
          set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
      endif
  endif

" ==========
" Plugins
" ==========

  if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mattn/emmet-vim'
  Plug 'raimondi/delimitMate'
  Plug 'vim-airline/vim-airline'
  Plug 'easymotion/vim-easymotion'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  call plug#end()

" ==========
" General
" ==========
  set noswapfile                      " no swap files
  set noundofile                      " no undo files
  set nobackup                        " no backup files
  set nowritebackup                   " only in case you don't want a backup file while editing
  set mouse=a                         " Automatically enable mouse usage
  set mousehide                       " Hide the mouse cursor while typing
  set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore             " Allow for cursor beyond last character
  set history=1000                    " Store a ton of history (default is 20)
  set nospell                         " Spell checking on
  set hidden                          " Allow buffer switching without saving
  set clipboard^=unnamed,unnamedplus  " Cross-platform value for copy-paste

" ==========
" Formatting
" ==========
  set encoding=utf8
  set nowrap                          " Do not wrap long lines
  set autoindent                      " Indent at the same level of the previous line
  set shiftwidth=2                    " Use indents of 2 spaces
  set expandtab                       " Tabs are spaces, not tabs
  set tabstop=2                       " An indentation every four columns
  set softtabstop=2                   " Let backspace delete indent
  set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
  set splitright                      " Puts new vsplit windows to the right of the current
  set splitbelow                      " Puts new split windows to the bottom of the current
  set pastetoggle=<F12>               " pastetoggle (sane indentation on pastes)
  set comments=sl:/*,mb:*,elx:*/      " auto format comment blocks
  filetype plugin indent on           " Automatically detect file types.
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx syntax=typescript.tsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx syntax=javascript.jsx
	scriptencoding utf-8

" ==========
" Vim UI
" ==========
  syntax on
  " solarized gruvbox neodark onedark
  colorscheme neodark
  let g:neodark#background = '#202020'
  set background=dark
  set termguicolors
  highlight clear SignColumn
	highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
  set tabpagemax=15               " Only show 15 tabs
  set showmode                    " Display the current mode
  set cursorline                  " Highlight current line
  set backspace=indent,eol,start  " Backspace for dummies
  set linespace=0                 " No extra spaces between rows
  set nonumber                    " not show current line number
  set showmatch                   " Show matching brackets/parenthesis
  set incsearch                   " Find as you type search
  set hlsearch                    " Highlight search terms
  set winminheight=0              " Windows can be 0 line high
  set ignorecase                  " Case insensitive search
  set smartcase                   " Case sensitive when uc present
  set wildmenu                    " Show list instead of just completing
  set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
  set scrolljump=5                " Lines to scroll when cursor leaves screen
  set scrolloff=3                 " Minimum lines to keep above and below cursor
  set sidescrolloff=15
  set foldenable                  " Auto fold code
  set foldmethod=marker
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
  " set relativenumber            " Show relative line numbers
  if has('cmdline_info')
      set ruler                   " Show the ruler
      set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
      set showcmd                 " Show partial commands in status line and
  endif

" ==========
" Key(re) Mappings
" ==========
  let mapleader = ' '
  let maplocalleader = '_'
  let s:edit_config_mapping = '<leader>ev'
  let s:apply_config_mapping = '<leader>sv'
  noremap j gj
  noremap k gk
  nnoremap Y y$
  noremap <leader>bg :call ToggleBG()<CR>

  " window
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_
  map <leader>d <C-d>
  map <leader>u <C-u>
  map <leader>r <C-r>

  " buffer
  nnoremap <Leader>bl :ls<CR>
  nnoremap <Leader>bp :bp<CR>
  nnoremap <Leader>bn :bn<CR>
  for i in range(1, 30)
    execute "nnoremap <Leader>b" . i . " :" . i . "b<CR>"
  endfor
  execute "nnoremap <Leader>vs :vs<CR>"
  execute "nnoremap <Leader>bd :bd<CR>"

 " Adjust viewports to the same size
  map <Leader>= <C-w>=

  " Easier horizontal scrolling
  map zl zL
  map zh zH
  nmap <silent> <leader>/ :set invhlsearch<CR>

  " Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
  nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
  vnoremap < <gv
  vnoremap > >gv

  " repeat operator http://stackoverflow.com/a/8064607/127816
  vnoremap . :normal .<CR>

" ==========
" Plugin Settings
" ==========
  " ctrlp
  let g:ctrlp_map = '<leader>p'

  " whichkey
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

  " delimitMate
  let g:delimitMate_expand_cr = 1            " auto indent

  " NERDTree
  let g:NERDSpaceDelims=1
  let NERDTreeShowHidden=1                   " show hidden files
  let NERDTreeQuitOnOpen=0
  let NERDTreeMinimalUI = 1                  " disable that old “Press ? for help”
  let NERDTreeAutoDeleteBuffer = 1           " https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
  let NERDTreeDirArrowExpandable = "\u00a0"  " NERDTree remove arrow
  let NERDTreeDirArrowCollapsible = "\u00a0"
  let NERDTreeNodeDelimiter = "\x07"
  let g:DevIconsEnableFoldersOpenClose = 1
  map <leader>1 <C-h>
  map <leader>2 <C-l>
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>

  " Hide NERDTree folder trailing slashes
  augroup nerdtreehidetirslashes
    autocmd!
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
  augroup end

  " after a re-source, fix syntax matching issues
  if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
  endif

  " airline
  let g:airline#extensions#tabline#enabled = 1        " tabline enabled
  let g:airline#extensions#tabline#fnamemod = ':t'    " only show filename
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)

  " coc.vim use tab key for trigger completion
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ==========
" Functions
" ==========
  " trigger background
  function! ToggleBG()
      let s:tbg = &background
      if s:tbg == "dark"
          set background=light
      else
          set background=dark
      endif
  endfunction

  function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  function! s:ExpandFilenameAndExecute(command, file)
      execute a:command . " " . expand(a:file, ":p")
  endfunction

  function! s:EditVimrcConfig()
      call <SID>ExpandFilenameAndExecute("tabedit", "~/.vimrc")
  endfunction

  if !exists('*WindowNumber')
    function! WindowNumber(...)
      let builder = a:1
      let context = a:2
      call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
      return 0
    endfunction
    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')
  endif

  execute "noremap " . s:edit_config_mapping " :call <SID>EditVimrcConfig()<CR>"
  execute "noremap " . s:apply_config_mapping . " :source ~/.vimrc<CR>"
