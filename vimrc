set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()



Bundle 'gmarik/vundle'



Bundle 'colorschemer'
"set t_Co=256
"colorschem xoria256
set t_Co=16
Bundle 'noahfrederick/vim-noctu'
colorscheme noctu
" 在行号列的左边，显示mark的位置
" mark相关的命令和快捷键:  :marks; m{mark}, '{mark}, `{mark}
" '       跳转前的位置 
" "       最后编辑的位置 
" [       最后修改的位置的开头 
" ]       最后修改的位置的结尾 
Bundle 'visualMarks.vim'


" 最近使用文件 
" 1. :MRU,  '<Enter>' or 'v' or 'o' or 't'.
" 2. :MRU filename, <Tab> or <Ctrl-D>
Bundle 'mru.vim'

" 目录树管理, 快捷键见?
Bundle 'The-NERD-tree'

" 快速注释，主要是[count]<leader>cc, cu, ci, cy, cs, cA, cm
Bundle 'The-NERD-Commenter'


Bundle 'TagHighlight'

" 让代码更加易于纵向排版，以=或,符号对齐,  :Tab /<字符或单词>
Bundle 'godlygeek/tabular'
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



Bundle 'vim-cpp-enhanced-highlight'
Bundle 'taglist.vim'

"Bundle 'snipMate
Bundle 'sketch.vim'
"Bundle 'FuzzyFinder'

"https://github.com/vim-scripts/DrawIt
" \di to start DrawIt and
" \ds to stop  DrawIt.
Bundle 'DrawIt'

" Bundle 'zencoding.vim'
Bundle 'FencView.vim'


Bundle 'YankRing.vim'

Bundle 'scons.vim'

"":Dox, :DoxAuthor
Bundle 'DoxygenToolkit.vim'

Bundle 'gitignore.vim'

"let g:compile_flag=" -std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra "
"对c++11支持不好，暂时放弃
"<Leader>s go to next signed error or warning line
"let g:cpp_compiler="g++ -std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra"
"Bundle 'phonzia/cppSyntaxCheck'
Bundle 'xuhdev/SingleCompile'
nmap <F5> :SCCompileRun<CR>

Bundle 'vimwiki/vimwiki'
Bundle 'vimwiki/utils'

Bundle 'jceb/vim-orgmode'
Bundle 'jceb/vim-shootingstar'

"Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-shell'
Bundle 'xolox/vim-colorscheme-switcher'
let g:colorscheme_switcher_define_mappings=0
"easy-tags is toSlow
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-notes'

" 快速查找
Bundle 'Lokaltog/vim-easymotion'
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

Bundle 'Lokaltog/vim-distinguished'
Bundle 'Lokaltog/vim-powerline'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-flatfoot'
Bundle 'tpope/vim-vividchalk'
"Bundle 'tpope/vim-fireplace' " Clojure REPL
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-sensible'

Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
noremap <F1> :bprev!<CR> 
noremap <F2> :bnext!<CR> 
noremap <C-left> :bprev!<CR> 
noremap <C-right> :bnext!<CR> 
noremap <C-h> :bprev!<CR> 
noremap <C-l> :bnext!<CR> 

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'

Bundle 'wesleyche/SrcExpl'
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

Bundle 'wesleyche/Trinity'
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 
" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 
" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 
" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR> 



Bundle 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler = 'cppcheck'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra '
Bundle 'scrooloose/syntastic'
Bundle 'honza/vim-snippets'
Bundle 'SirVer/ultisnips'
"Bundle 'Valloric/YouCompleteMe'
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"F7
Bundle 'funorpain/vim-cpplint'

Bundle 'Chiel92/vim-autoformat'
let g:formatprg_cpp='astyle'                                                    
"let g:formatprg_args_cpp='--style=google --indent=spaces=2 --attach-namespaces --attach-classes --indent-modifiers --indent-switches --indent-cases --pad-oper --pad-header --align-pointer=type --align-reference=type --convert-tabs --max-code-length=80 --break-after-logical --lineend=linux'
let g:formatprg_args_cpp = ''
let g:formatprg_args_cpp.= ' '. '--style=google'
let g:formatprg_args_cpp.= ' '. '--indent=spaces=2'
let g:formatprg_args_cpp.= ' '. '--attach-namespaces'
let g:formatprg_args_cpp.= ' '. '--attach-classes'
let g:formatprg_args_cpp.= ' '. '--indent-modifiers'
let g:formatprg_args_cpp.= ' '. '--indent-switches'
let g:formatprg_args_cpp.= ' '. '--indent-cases'
let g:formatprg_args_cpp.= ' '. '--pad-oper'
let g:formatprg_args_cpp.= ' '. '--pad-header'
let g:formatprg_args_cpp.= ' '. '--align-pointer=type'
let g:formatprg_args_cpp.= ' '. '--align-reference=type'
let g:formatprg_args_cpp.= ' '. '--convert-tabs'
let g:formatprg_args_cpp.= ' '. '--max-code-length=80'
let g:formatprg_args_cpp.= ' '. '--break-after-logical'
let g:formatprg_args_cpp.= ' '. '--lineend=linux'
noremap <F6> :Autoformat<CR><CR>

filetype plugin indent on

source ~/.vim/darrenhp_vimrc
"Candidate
"Bundle 'aperezdc/vim-template'

