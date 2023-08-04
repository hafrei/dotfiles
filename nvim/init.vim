if !isdirectory(getenv('HOME') . '/.local/share/nvim/backup')
	execute '!mkdir -p ' . getenv('HOME') . '/.local/share/nvim/backup'
endif

set backup
set backupdir=~/.local/share/nvim/backup
set colorcolumn=160
set cursorline  " highlights current line
set expandtab   " spaces > tabs
set exrc    " in ./.vimrc?
set fileformats=unix,dos,mac
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0
set grepprg=ag\ --nogroup\ --nocolor
set hidden        " hide buffers not in view
set ignorecase    " case fold while searching
set lazyredraw    " don't draw while executing macros "and similar"
set list          " show whitespace
set matchtime=2   " briefly highlight matching bracket
set mouse=a       "enable mouse mode
set nowrap
set nowritebackup "already have backups
set number
set relativenumber
set scrolloff=7
set secure
set shiftwidth=2
set showmatch
set showtabline=2
set smartcase
set splitbelow    "default splits bottom
set splitright    "default vsplits right
set tabstop=2
set termguicolors
set textwidth=0
set timeoutlen=2000
set undofile      "persist undo information between file closes
set wildmode=list:longest,full
set clipboard=unnamedplus
"set runtimepath+=/.cache/dein/repos/github.com/Shougo/dein.vim
