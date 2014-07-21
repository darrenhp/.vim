set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','

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
Bundle 'taglist.vim'

"Bundle 'snipMate
Bundle 'sketch.vim'
"Bundle 'FuzzyFinder'

"https://github.com/vim-scripts/DrawIt
" \di to start DrawIt and
" \ds to stop  DrawIt.
Bundle 'DrawIt'
" 相较于Command-T等查找文件的插件，ctrlp.vim最大的好处在于没有依赖
"Bundle 'ctrlp.vim'

" Bundle 'zencoding.vim'
Bundle 'FencView.vim'






Bundle 'YankRing.vim'

Bundle 'scons.vim'

"":Dox, :DoxAuthor
Bundle 'DoxygenToolkit.vim'

"":DoxyDocAuthor, :DoxyDoc
"Bundle 'mopp/DoxyDoc.vim'

"Bundle 'mopp/openvimrc.vim'
"nmap <silent> <Leader>ev <Plug>(openvimrc-open)

"Bundle 'mopp/nyaruline.vim'
"function! g:nyaruline_after_init_hook(controler)
"let g:vimfiler_force_overwrite_statusline = 0
"call a:controler.default.n.add_atom(-1,
"'%{exists("g:loaded_vimfiler")?vimfiler#get_status_string():""}',
"'NYARU_VIMF_N', a:controler.get_highlight_param('164a84', 'c1d8ac',
"'NONE'), 'left')
"echo a:controler.default.n.get_statusline_expr()
"endfunction
""a color schemer
"Bundle 'mopp/mopkai.vim'


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

"use the F8 and Shift-F8 keys to switch to the next/previous color scheme and
"Control-F8 to switch to a random color scheme.
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-notes'
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
"map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"map <Leader>h <Plug>(easymotion-linebackward)

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Bundle "altercation/vim-colors-solarized"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "kien/ctrlp.vim"
Bundle "xuhdev/SingleCompile"
let g:compile_flag = "-std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra"
autocmd Filetype cpp nmap <buffer> <F5> :SCCompileRun -std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra<CR>

Bundle "wesleyche/SrcExpl"
" // The switch of the Source Explorer 
nmap <F8> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
      \ "__Tag_List__", 
      \ "_NERD_tree_" 
      \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 

Bundle "wesleyche/Trinity"
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 

" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 

" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 

" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR> 

Bundle 'SirVer/ultisnips'


Bundle 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10
Bundle 'scrooloose/syntastic'
Bundle "honza/vim-snippets"
Bundle 'Valloric/YouCompleteMe'

" Track the engine.
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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
