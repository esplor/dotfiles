set nocompatible

" Auto install plug.vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" "Call" .vim/plugins .vim/sets.vim
runtime plugins.vim
runtime sets.vim

" Theme related
set background=dark
colorscheme gruvbox

let g:airline_left_sep='>'
let g:airline_right_sep='<'
