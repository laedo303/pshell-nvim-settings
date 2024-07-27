" Кодировка UTF-8
set encoding=utf8
" Отключение совместимости с vi. Нужно для правильной работы некоторых опций
set nocompatible
" Игнорировать регистр при поиске
set ignorecase
" Не игнорировать регистр, если в паттерне есть большие буквы
set smartcase
" Подсвечивать найденный паттерн
set hlsearch
" Интерактивный поиск
set incsearch
" Размер табов - 2
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Превратить табы в пробелы
set expandtab
" Таб перед строкой будет вставлять количество пробелов определённое в shiftwidth
set smarttab
" Копировать отступ на новой строке
set autoindent
set smartindent
" Показывать номера строк
set number
" Относительные номера строк
set relativenumber
" Автокомплиты в командной строке
set wildmode=longest,list
" Разрешить использование мыши
set mouse=a
" Использовать системный буфер обмена
set clipboard=unnamedplus
" Быстрый скроллинг
set ttyfast
" Курсор во время скроллинга будет всегда в середине экрана
set so=30
" Встроенный плагин для распознавания отступов
filetype plugin indent on
" Подсветка синтаксиса
syntax on

" Автоматическое открытие NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p

" Включить/выключить NERDTree при нажатии \n
nnoremap <leader>n :NERDTreeToggle<CR>
" Юникодные иконки папок (Работает только с плагином vim-devicons)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" Показывает количество строк в файлах
let g:NERDTreeFileLines = 1
" Игнорировать указанные папки
let g:NERDTreeIgnore = ['^node_modules$', '^__pycache__$']
" Закрыть vim, если единственная вкладка - это NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter = 'default'

"call plug#begin("C:\Users\laedo\AppData\Local\nvim\vimfiles\plugged")
call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/rstacruz/vim-closer' " For brackets autocompletion
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
" Auto-completion  For Javascript
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed
call plug#end()

:set completeopt-=preview " For No Previews

":colorscheme jellybeans
:colorscheme deus

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

au BufRead,BufNewFile *.es6 set filetype=Javascript
au BufRead,BufNewFile *.vue set filetype=Javascript
au BufRead,BufNewFile *.vue set syntax=Javascript
au BufRead,BufNewFile Dockerfile* set syntax=dockerfile
au BufRead,BufNewFile *.eslintrc set syntax=json
au BufRead,BufNewFile *.tsx set syntax=typescript

nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
" nmap <F8> :TagbarToggle<CR>

" переходы между активными окнами
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>

" Включение/выключение подсветки колонки курсора
map <F8> <ESC>:set cursorcolumn!<CR>

" Сохранение/выход из редактора
map <F2> <ESC>:q!<CR>
map <F3> <ESC>:w<CR>
map <F4> <ESC>:wq<CR>

" Развертывание подсказок по Tab
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


