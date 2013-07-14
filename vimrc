 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 
 " original repos on github
 
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " 1. on vim-script account""""""""""""""""""""""""""""""""""""""""
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'colorschemer'
Bundle 'vimwiki'
Bundle 'visualMarks.vim'
Bundle 'The-NERD-Commenter'
Bundle 'vim-cpp-enhanced-highlight'
Bundle 'cppSyntaxCheck'

"Bundle 'snipMate'
"Bundle 'FuzzyFinder'

" 相较于Command-T等查找文件的插件，ctrlp.vim最大的好处在于没有依赖
Bundle 'ctrlp.vim'

" Bundle 'zencoding.vim'

" 在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'

Bundle 'EasyMotion'

"Bundle 'FencView'

Bundle 'The-NERD-tree'

Bundle 'mru.vim'

" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. on other account""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle "tpope/vim-markdown"
Bundle "Lokaltog/vim-powerline"
Bundle "Lokaltog/vim-easymotion"
Bundle "Lokaltog/TagHighlight"
Bundle "altercation/vim-colors-solarized"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"
 " vim-scripts repos

 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

source ~/.vim/darrenhp_vimrc
