set undofile
set undodir=~/.config/nvim/undo//
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//

set clipboard+=unnamedplus
set noshowcmd

set number
set showmatch

set smartcase
set ignorecase

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set nojoinspaces

set cursorline
set cc=79
set mouse=a

call plug#begin('~/.config/nvim/plugins')

Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1

augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=5 guifg=#5E81AC
augroup END
colorscheme nord

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ.;ABCDEFGHIJKLMNOPQRSTUVWXYZ:/,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Reload config on changes
if (!exists('*SourceConfig'))
  function SourceConfig() abort
    source $MYVIMRC
  endfunction
endif
autocmd! BufWritePost $MYVIMRC call SourceConfig()

