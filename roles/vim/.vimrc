"Setting/General
set encoding=utf8
set fileencoding=utf-8
set showcmd
set noswapfile
set nobackup
set clipboard=unnamed,autoselect
set hidden
set autoread
set confirm
set visualbell t_vb=
set noerrorbells
set switchbuf=useopen
set autowrite
set textwidth=0
set history=1000
set completeopt=menuone,noinsert
set ambiwidth=double
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.class,*~
set guioptions=
set wildmenu
set wildmode=longest:full,full

augroup General
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END


"Setting/Leader
let mapleader = "\<Space>"
let maplocalleader = ','


"Setting/Tab
set expandtab
set shiftwidth=2
set tabstop=2


"Setting/View
set number
set title
set ruler
set cursorline
set showmatch
set laststatus=2
set signcolumn=yes


"Setting/Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>


"Setting/Key
nnoremap j gj
nnoremap k gk
inoremap <silent> jj <ESC>
nnoremap <Tab><Tab> gt
nnoremap <S-Tab> gT
for i in range(1, 9)
  execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor
cnoremap <C-q> <C-r>=expand('%:p')<CR>
cnoremap <C-o> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <S-Left>
cnoremap <C-w> <S-Right>
cnoremap <C-x> <Del>
inoremap <S-Tab> <C-d>


"Setting/QuickFix
augroup QuickFix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd FileType qf call s:qickfix_keymap()
augroup END

function! s:qickfix_keymap() abort
  nnoremap <silent><buffer> <Leader><Leader> :<C-u>bd<CR>
endfunction


"Setting/Help
set helplang=ja
augroup Help
  autocmd!
  autocmd FileType help call s:help_keymap()
augroup END

function! s:help_keymap() abort
  nnoremap <silent><buffer> <Leader><Leader> :<C-u>bd<CR>
endfunction


"Setting/Plugin
call plug#begin('~/.vim/plugged')
""Color"
Plug 'arcticicestudio/nord-vim'
""Selector
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
""Window
Plug 'simeji/winresizer'
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'easymotion/vim-easymotion'
""Edit
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'
""Git
Plug 'iberianpig/tig-explorer.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
""Utility
Plug 'vim-jp/vimdoc-ja'
Plug 'previm/previm'
Plug 'glidenote/memolist.vim'
Plug 'tyru/open-browser.vim'
""Development
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/efm-langserver'
Plug 'liuchengxu/vista.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'thinca/vim-quickrun'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/vim-sonictemplate'
call plug#end()


"Setting/Tool/junegunn/vim-plug
augroup VimPlug
  autocmd!
  autocmd FileType vim-plug call s:vimplug_keymap()
augroup END

function! s:vimplug_keymap() abort
  nnoremap <silent><buffer> <Leader><Leader> :<C-u>bd<CR>
endfunction


"Setting/Tool/arcticicestudio/nord-vim
""Disable diff backgroud color
let g:nord_uniform_diff_background = 1
""Set bold vertical split line
let g:nord_bold_vertical_split_line = 1
""Set cursor line number backgroud
let g:nord_cursor_line_number_background = 1
""ref. https://github.com/arcticicestudio/nord-vim/issues/26
""ref. https://www.nordtheme.com/docs/ports/vim/customization
augroup ColorschemeNord
  autocmd!
  autocmd ColorScheme nord highlight Visual ctermfg=11
  autocmd ColorScheme nord highlight CursorLine ctermfg=14
augroup END
""Set colorscheme (NOTE: Set at the bottom of the color sheme)
colorscheme nord


"Setting/Tool/lambdalisue/fern.vim
let g:fern#default_hidden = 1
let g:fern#disable_default_mappings = 1
nnoremap <silent> <Leader>e :<C-u>Fern .<CR>

augroup Fern
  autocmd!
  autocmd FileType fern call s:fern_keymap()
augroup END

function! s:fern_keymap() abort
  nnoremap <silent><buffer> <Leader><Leader> :<C-u>bd<CR>
  nnoremap <silent><buffer> <LocalLeader>f :<C-u>FzfRg<CR>
  nmap <silent><buffer> <C-h> <Plug>(fern-action-leave)
  nmap <silent><buffer> h <Plug>(fern-action-collapse)
  nmap <silent><buffer> <C-r> <Plug>(fern-action-reload)
  nmap <silent><buffer> o <Plug>(fern-action-open)
  nmap <silent><buffer> <CR> <Plug>(fern-action-open)
  nmap <silent><buffer> <Space> <Plug>(fern-action-mark:toggle)
  nmap <silent><buffer> t <Plug>(fern-action-open:tabedit)
  nmap <silent><buffer> l <Plug>(fern-action-expand)
  nmap <silent><buffer> x <Plug>(fern-action-open:system)
  nmap <silent><buffer> N <Plug>(fern-action-new-file)
  nmap <silent><buffer> K <Plug>(fern-action-new-dir)
  nmap <silent><buffer> c <Plug>(fern-action-copy)
  nmap <silent><buffer> m <Plug>(fern-action-move)
  nmap <silent><buffer> r <Plug>(fern-action-rename)
  nmap <silent><buffer> D <Plug>(fern-action-trash)
  nmap <silent><buffer> C <Plug>(fern-action-clipboard-copy)
  nmap <silent><buffer> M <Plug>(fern-action-clipboard-move)
  nmap <silent><buffer> P <Plug>(fern-action-clipboard-paste)
  nmap <silent><buffer> yy <Plug>(fern-action-yank:path)
endfunction


"Setting/Tool/junegunn/fzf.vim
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'up': '~35%' }
nnoremap <silent> <LocalLeader><LocalLeader> :<C-u>FzfFiles<CR>
nnoremap <silent> <LocalLeader>l :<C-u>FzfBLines<CR>
nnoremap <silent> <LocalLeader>b :<C-u>FzfBuffers<CR>
nnoremap <silent> <LocalLeader>f :<C-u>cd %:p:h<CR> :<C-u>FzfRg<CR>
nnoremap <silent> <LocalLeader>h :<C-u>FzfHistory<CR>
nnoremap <silent> <LocalLeader>r :<C-u>FzfHistory:<CR>
cnoremap <silent> <C-r> :<C-u>FzfHistory:<CR>


"Setting/Tool/iberianpig/tig-explorer.vim
nnoremap <silent> <LocalLeader>gs :<C-u>TigStatus<CR>
nnoremap <silent> <LocalLeader>gl :<C-u>Tig<CR>
nnoremap <silent> <LocalLeader>gc :<C-u>TigOpenCurrentFile<CR>
nnoremap <silent> <LocalLeader>gb :<C-u>TigBlame<CR>


"Setting/Tool/easymotion/vim-easymotion
map  <silent> <Leader>l <Plug>(easymotion-bd-jk)
nmap <silent> <Leader>l <Plug>(easymotion-overwin-line)


"Setting/Tool/ghq
""cd like ghq
command! -nargs=0 Repo call fzf#run({
\   'source': 'ghq list --full-path',
\   'sink': 'cd'
\ })


"Setting/Tool/previm/previm
let g:previm_open_cmd = 'open -a Google\ Chrome'


"Setting/Tool/glidenote/memolist.vim
let g:memolist_path = "$HOME/memo"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = "$XDG_CONFIG_HOME/memo"
let g:memolist_fzf = 1


"Setting/Tool/tyru/open-browser.vim
nmap <silent> <LocalLeader>op <Plug>(openbrowser-smart-search)
vmap <silent> <LocalLeader>op <Plug>(openbrowser-smart-search)
nnoremap <silent> <LocalLeader>ot :<C-u>execute 'OpenBrowserSearch -deepl' expand('<cWORD>')<CR>
let g:openbrowser_search_engines = {
\    'deepl': 'https://www.deepl.com/translator#auto/auto/{query}',
\}


"Setting/Tool/mattn/vim-sonictemplate
let g:sonictemplate_vim_template_dir = '$XDG_CONFIG_HOME/sonictemplate'


"Setting/Tool/prabirshrestha/vim-lsp
"Setting/Tool/mattn/vim-lsp-settings
"Setting/Tool/prabirshrestha/asyncomplete.vim
"Setting/Tool/prabirshrestha/asyncomplete-lsp.vim
"Setting/Tool/hrsh7th/vim-vsnip
"Setting/Tool/hrsh7th/vim-vsnip-integ
"Setting/Tool/rafamadriz/friendly-snippets
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_settings = {
\   'efm-langserver': {
\     'disabled': v:false
\   },
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'plugins': {
\           'flake8': { 'enabled': v:false },
\           'pycodestyle': { 'enabled': v:false },
\           'pydocstyle': { 'enabled': v:false },
\           'autopep8': { 'enabled': v:false },
\           'pyflakes': { 'enabled': v:false },
\           'pylint': { 'enabled': v:false },
\           'mccabe': { 'enabled': v:false },
\           'yapf': { 'enabled': v:false },
\         }
\       }
\     }
\   }
\ }
let g:asyncomplete_auto_popup = 0
let g:vsnip_snippet_dir = expand($XDG_CONFIG_HOME . '/vsnip')

augroup LSP
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  autocmd BufWritePre <buffer> LspDocumentFormatSync
  autocmd BufWritePre *.py LspDocumentFormatSync --server=efm-langserver
augroup END

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <silent><buffer> <Leader>d <Plug>(lsp-definition)
  nmap <silent><buffer> <Leader>h <plug>(lsp-hover)
  nmap <silent><buffer> <Leader>f <plug>(lsp-document-diagnostics)
  nmap <silent><buffer> <Leader>i <plug>(lsp-implementation)
  nmap <silent><buffer> <Leader>r <plug>(lsp-references)
  nmap <silent><buffer> <C-j> <Plug>(lsp-next-error)
  nmap <silent><buffer> <C-k> <Plug>(lsp-previous-error)
  imap <silent><buffer> <C-f> <Plug>(asyncomplete_force_refresh)
  inoremap <expr> <Tab> pumvisible() ? asyncomplete#close_popup() : "\<Tab>"
  imap <expr> <C-k> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
  smap <expr> <C-k> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
endfunction

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')


"Setting/Tool/liuchengxu/vista.vim
let g:vista#renderer#enable_icon = 0
let g:vista_sidebar_position = 'vertical topleft'

augroup Vista
  autocmd!
  autocmd FileType * call s:vista_keymap_lsp()
  autocmd FileType markdown call s:vista_keymap_markdown()
  autocmd FileType vista_kind,vista_markdown call s:vista_keymap()
augroup END

function! s:vista_keymap_lsp() abort
  nnoremap <silent><buffer> <Leader>o :<C-u>Vista finder vim_lsp<CR>
  nnoremap <silent><buffer> <Leader>t :<C-u>Vista vim_lsp<CR>
endfunction

function! s:vista_keymap_markdown() abort
  nnoremap <silent><buffer> <Leader>o :<C-u>Vista toc<CR>
  nnoremap <silent><buffer> <Leader>t :<C-u>Vista toc<CR>
endfunction

function! s:vista_keymap() abort
  nnoremap <silent><buffer> <Leader><Leader> :<C-u>Vista!<CR>
endfunction


"Setting/Tool/thinca/vim-quickrun
nnoremap <silent> <Leader>q :QuickRun<CR>
let g:quickrun_config = {
\  '_': {
\    'outputter': 'quickfix',
\    'hook/time/enable':  1
\  },
\ 'poetry': {
\    'command': 'poetry',
\    'exec': '%c run python %s',
\ },
\ 'poetry/pytest': {
\    'command': 'poetry',
\    'exec': '%c run pytest %s',
\ },
\ 'python': {
\    'command': 'poetry',
\    'exec': '%c run pytest %s',
\ },
\ 'go/run': {
\    'command': 'go',
\    'exec': '%c run %s:p:t %a',
\    'tempfile': '%{tempname()}.go',
\    'hook/output_encode/encoding': 'utf-8',
\    'hook/cd/directory': '%S:p:h',
\ },
\ 'go/test': {
\    'command': 'go',
\    'exec': '%c test %s:p:t %a',
\    'tempfile': '%{tempname()}.go',
\    'hook/output_encode/encoding': 'utf-8',
\    'hook/cd/directory': '%S:p:h',
\ },
\ 'go': {
\    'command': 'go',
\    'exec': '%c test %s:p:t %a',
\    'tempfile': '%{tempname()}.go',
\    'hook/output_encode/encoding': 'utf-8',
\    'hook/cd/directory': '%S:p:h',
\ },
\}


"Setting/Tool/itchyny/lightline.vim
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'lsp_error', 'lsp_warn', 'lsp_info' ],
  \     [ 'readonly', 'gitbranch', 'filename', 'modified' ],
  \   ],
  \   'right': [
  \     [ 'fileformat', 'fileencoding', 'filetype', 'percent', 'lineinfo' ],
  \   ],
  \ },
  \ 'inactive': {
  \   'left': [
  \     [ 'inactive_filename' ],
  \   ],
  \   'right': [
  \     [ ],
  \   ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name',
  \   'filename': 'LightlineFilename',
  \ },
  \ 'component_expand': {
  \   'lsp_error': 'LightlineLSPError',
  \   'lsp_warn': 'LightlineLSPWarn',
  \   'lsp_info': 'LightlineLSPInfo',
  \   'inactive_filename': 'LightlineFilename',
  \ },
  \ 'component_type': {
  \   'lsp_error': 'error',
  \   'lsp_warn': 'warning',
  \   'lsp_info': 'tabsel',
  \   'inactive_filename': 'middle',
  \ },
\ }

""Custom Color Settings
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.right = s:palette.normal.middle

function! LightlineFilename() abort
  return expand('%:p:h:t') . '/' . expand('%:t')
endfunction

function! s:lightline_lsp_diagnostic(type, sign) abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts[a:type] == 0 ? '' : printf('%s %d', a:sign, l:counts[a:type])
endfunction

function! LightlineLSPError() abort
  return s:lightline_lsp_diagnostic('error', '✘')
endfunction

function! LightlineLSPWarn() abort
  return s:lightline_lsp_diagnostic('warning', '⚠')
endfunction

function! LightlineLSPInfo() abort
  return s:lightline_lsp_diagnostic('information', 'i')
endfunction

augroup Lightline
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END


"Setting/ExternalFile
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif


"Setting/Path
set runtimepath+=~/.vim/
runtime! userautoload/*.vim

