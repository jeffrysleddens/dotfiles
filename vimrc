if filereadable("/etc/vim/vimrc")
  source /etc/vim/vimrc
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

:filetype on
:syntax on
:colorscheme manxome
set hlsearch
set modeline
set modelines=5
"set noautoindent
set mouse=r
