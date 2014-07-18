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
"一堆ColorScheme的合集
Bundle 'colorschemer'



" 在行号列的左边，显示mark的位置
" mark相关的命令和快捷键:  :marks; m{mark}, '{mark}, `{mark}
" '       跳转前的位置 
" "       最后编辑的位置 
" [       最后修改的位置的开头 
" ]       最后修改的位置的结尾 
Bundle 'visualMarks.vim'

" <Leader>s      go to next signed error or warning line
Bundle 'cppSyntaxCheck'

" 最近使用文件 
" 1. :MRU,  '<Enter>' or 'v' or 'o' or 't'.
" 2. :MRU filename, <Tab> or <Ctrl-D>
Bundle 'mru.vim'

" 目录树管理, 快捷键见?
Bundle 'The-NERD-tree'

" 快速注释，主要是[count]<leader>cc, cu, ci, cy, cs, cA, cm
Bundle 'The-NERD-Commenter'

" 让代码更加易于纵向排版，以=或,符号对齐,  :Tab /<字符或单词>
Bundle 'Tabular'
"貌似没有效果。。
let mapleader=','
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction



" Todo------
Bundle 'vim-cpp-enhanced-highlight'


"Bundle 'snipMate
Bundle 'sketch.vim'
"Bundle 'FuzzyFinder'

" 相较于Command-T等查找文件的插件，ctrlp.vim最大的好处在于没有依赖
"Bundle 'ctrlp.vim'

" Bundle 'zencoding.vim'
Bundle 'FencView.vim'






Bundle 'YankRing.vim'









Bundle 'gitignore.vim'

Bundle 'neocomplcache'




Bundle 'vimwiki'

"Other IDE
" 在()、""、甚至HTML标签之间快速跳转；
"Bundle 'matchit.zip'
"Bundle 'VimClojure'
"Bundle 'Superior-Haskell-Interaction-Mode-SHIM'
"Bundle 'Superior-Haskell-Interaction-Mode-SHIM'
"Bundle 'vimside'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. on other account""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快速查找
Bundle "Lokaltog/vim-easymotion"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

map / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" JK motions: Line motions
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"Bundle "Lokaltog/TagHighlight"
Bundle "Lokaltog/vim-powerline"
Bundle "Lokaltog/vim-distinguished"

Bundle "tpope/vim-repeat"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-flatfoot"
Bundle "tpope/vim-vividchalk"
"Bundle "tpope/vim-fireplace" " Clojure REPL
Bundle "tpope/vim-sleuth"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-speeddating"
Bundle "tpope/vim-rsi"
Bundle "tpope/vim-sensible"

Bundle "bling/vim-airline"


Bundle "altercation/vim-colors-solarized"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"
Bundle "kien/ctrlp.vim"
Bundle "xuhdev/SingleCompile"


 " vim-scripts repos

 " non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'https://bitbucket.org/ns9tks/vim-l9/'
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
