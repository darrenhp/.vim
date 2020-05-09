"set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'ludovicchabant/vim-gutentags'
"Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 1
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'vim-scripts/colorschemer'
Plug 'flazz/vim-colorschemes'
Plug 'rking/ag.vim'
Plug 'xuhdev/singleCompile'
"
"
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
"Plug 'neomake/neomake'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'w0rp/ale'
"Plug 'kien/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
Plug 'terryma/vim-expand-region'
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'inkarkat/vim-ingo-library' |Plug 'inkarkat/vim-mark'
"let g:ctrlp_map = '<c-p>'
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/YankRing.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } 

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tab_nr = 2
"let g:airline#extensions#tabline#left_sep = ' '
Plug 'bling/vim-bufferline'

" Any valid git URL is allowed
""Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'for': 'go' }





" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
""Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"Plug 'localvar/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Plugin outside ~/.vim/plugged with post-update hook
"Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

"Plug 'jistr/vim-nerdtree-tabs'
"快速注释，主要是[count]<leader>cc, cu, ci, cy, cs, cA, cm
Plug 'scrooloose/nerdcommenter'

" Initialize plugin system
call plug#end()
let g:gutentags_project_root = ['makefile', 'Makefile', '.git']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" When writing a buffer (no delay).
"call neomake#configure#automake('w')
"" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
"" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
"" Full config: when writing or reading a buffer, and on changes in insert and
"" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
"Advance
"function! MyOnBattery()
  "return readfile('/sys/class/power_supply/AC/online') == ['0']
"endfunction

"if MyOnBattery()
  "call neomake#configure#automake('w')
"else
  "call neomake#configure#automake('nw', 1000)
"endif


"map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeToggle<CR>
"nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeOpenOnNewTab=1
let g:nerdtree_tabs_open_on_new_tab=1
Plug 'Shougo/denite.nvim'




"nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
"nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
"nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
"nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
"nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
""nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>

""======


""let g:syntastic_cpp_compiler = 'clang++'
""let g:syntastic_cpp_compiler = 'cppcheck'
""Plugin 'scrooloose/syntastic'
""let g:syntastic_cpp_compiler_options = ' -std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra '

"Plug 'majutsushi/tagbar'
"nmap <F8> :TagbarToggle<CR>


""" 快速查找
""Plugin 'Lokaltog/vim-easymotion'
""let g:EasyMotion_do_mapping = 0 " Disable default mappings
""" Bi-directional find motion
""" Jump to anywhere you want with minimal keystrokes, with just one key binding.
""" `s{char}{label}`
""nmap s <Plug>(easymotion-s)
""" or
""" `s{char}{char}{label}`
""" Need one more keystroke, but on average, it may be more comfortable.
""nmap s <Plug>(easymotion-s2)
""nmap t <Plug>(easymotion-t2)
""" Turn on case sensitive feature
""let g:EasyMotion_smartcase = 1

""map / <Plug>(easymotion-sn)
""map  n <Plug>(easymotion-next)
""map  N <Plug>(easymotion-prev)
""" JK motions: Line motions
""" Gif config
"""map <Leader>l <Plug>(easymotion-lineforward)
""map <Leader>j <Plug>(easymotion-j)
""map <Leader>k <Plug>(easymotion-k)
"""map <Leader>h <Plug>(easymotion-linebackward)
""let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion


""Plugin 'Valloric/ListToggle'
""let g:lt_location_list_toggle_map = '<leader>l'
""let g:lt_quickfix_list_toggle_map = '<leader>q'
""let g:lt_height = 10

"""Plugin 'funorpain/vim-cpplint'


""let g:autoformat_verbosemode=1
""Plugin 'Chiel92/vim-autoformat'
augroup go
  let g:go_fmt_command = "goimports"
  let g:go_autodetect_gopath = 1
  let g:go_list_type = "quickfix"
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  let g:go_def_mapping_enabled = 0

  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_generate_tags = 1

  " Open :GoDeclsDir with ctrl-g
  nmap <C-g> :GoDeclsDir<cr>
  imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

  " build_go_files is a custom function that builds or compiles the test file.
  " It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
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
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#cmd#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction
augroup END
   
let g:formatdef_my_custom_cpp='"astyle --style=google --indent=spaces=2 --attach-namespaces --attach-classes --indent-modifiers --indent-switches --indent-cases --pad-oper --pad-header --align-pointer=type --align-reference=type --convert-tabs --max-code-length=80 --break-after-logical --lineend=linux"'
let g:formatters_cpp = ['my_custom_cpp']
noremap <F6> :Autoformat<CR><CR>
noremap <C-h> :bprev!<CR>
noremap <C-l> :bnext!<CR>


"call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 'g++-8', '-std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra -o $(FILE_TITLE)$', '$(FILE_EXEC)$')
call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 'g++-9', '-std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra -o a.out', './a.out ')
"call SingleCompile#ChooseCompiler('cpp', 'g++')
nmap <F5> :w! <CR> :SCCompileRun<CR>
"set macmeta
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU C++ Compiler', 'g++-8', '-std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra -o $(FILE_TITLE)$', '$(FILE_EXEC)$')
"k', 'GNU C++ Compiler', 'g++-8', '-std=c++11 -g -Weffc++ -Wshadow -Werror -Wall -Wextra -o $(FILE_TITLE)$', '$(FILE_EXEC)$')
"call SingleCompile#ChooseCompiler('cpp', 'g++')
"nmap <F5> :w! <CR> :SCCompileRun<CR>
source ~/.vim/darrenhp_vimrc
