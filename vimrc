"set nocompatible               " be iMproved
"filetype off                   " required!
let mapleader=','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Bundle 'VundleVim/Vundle.vim'

"===GO
Plugin 'fatih/vim-go'
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"=====
Bundle 'rking/ag.vim'
Bundle 'mileszs/ack.vim'
"Bundle 'dyng/ctrlsf.vim'
"nmap     <C-F>f <Plug>CtrlSFPrompt
"vmap     <C-F>f <Plug>CtrlSFVwordPath
"vmap     <C-F>F <Plug>CtrlSFVwordExec
"nmap     <C-F>n <Plug>CtrlSFCwordPath
"nmap     <C-F>p <Plug>CtrlSFPwordPath
"nnoremap <C-F>o :CtrlSFOpen<CR>
"let g:ctrlsf_ackprg = 'ag'
""let g:ctrlsf_position = 'bottom'
""let g:ctrlsf_position = 'top'
"let g:ctrlsf_position = 'right'
""let g:ctrlsf_winsize = '30%'
"" or
""let g:ctrlsf_winsize = '100'
"let g:ctrlsf_auto_close = 0
"let g:ctrlsf_context = '-B 5 -A 3'

Plugin 'Shougo/denite.nvim'


"======
"Bundle 'colorschemer'
Bundle 'flazz/vim-colorschemes'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'scrooloose/nerdtree'
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDShutUp=1
Bundle 'jistr/vim-nerdtree-tabs'
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeOpenOnNewTab=1
"let g:nerdtree_tabs_open_on_new_tab
" 快速注释，主要是[count]<leader>cc, cu, ci, cy, cs, cA, cm
Bundle 'scrooloose/nerdcommenter'

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler = 'cppcheck'
Bundle 'scrooloose/syntastic'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra '

Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Bundle 'xuhdev/SingleCompile'
"call SingleCompile#ChooseCompiler('cpp', 'g++')
"call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 'g++', '-std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra -o $(FILE_TITLE)$', '$(FILE_EXEC)$')
nmap <F5> :w! <CR> :SCCompileRun<CR>

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


Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '>'
Bundle 'bling/vim-bufferline'
noremap <F1> :bprev!<CR>
noremap <F2> :bnext!<CR>
noremap <C-left> :bprev!<CR>
noremap <C-right> :bnext!<CR>
noremap <C-h> :bprev!<CR>
noremap <C-l> :bnext!<CR>

Bundle 'kien/ctrlp.vim'

Bundle 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

"Bundle 'funorpain/vim-cpplint'


let g:autoformat_verbosemode=1
Bundle 'Chiel92/vim-autoformat'
let g:formatdef_astyle_cpp='"astyle --style=google --indent=spaces=2 --attach-namespaces --attach-classes --indent-modifiers --indent-switches --indent-cases --pad-oper --pad-header --align-pointer=type --align-reference=type --convert-tabs --max-code-length=80 --break-after-logical --lineend=linux"'
noremap <F6> :Autoformat<CR><CR>

filetype plugin indent on
call vundle#end()

source ~/.vim/darrenhp_vimrc

