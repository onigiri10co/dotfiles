# roles/vim



## Settings
### General
#### エディタ内部文字コードを設定する（ファイルを開く時の文字コード）
```
set encoding=utf8
```

#### ファイルを保存する時の文字コードを設定する
```
set fileencoding=utf-8
```

#### 入力中コマンドをステータスライン（ウィンドウ右下）に表示する
```
set showcmd
```

#### スワップファイルを作成しない
```
set noswapfile
```

#### バックアップファイルを作成しない
```
set nobackup
```

#### ヤンク内容をクリップボードと共有する
```
set clipboard=unnamed,autoselect
```

#### 編集したファイルを保存しなくてもバッファ切り替えできる
```
set hidden
```

#### 外部でファイル変更された内容を自動で再読み込みする
```
set autoread
```

#### 保存されていない時は、終了前に確認する
```
set confirm
```

#### ビープ音を全て無効にする
```
set visualbell t_vb=
```

#### エラーメッセージを表示する際にビープ音を鳴らさない
```
set noerrorbells
```

#### 既にバッファに存在する場合、そのファイルを開く
```
set switchbuf=useopen
```

#### ファイル変更がある状態で、別のファイルに移動した場合は自動で保存する
```
set autowrite
```

#### 文章の自動折返しを無効にする
```
set textwidth=0
```

#### 保存するコマンド履歴数を設定する
```
set history=1000
```

#### （1件でも）常に補完ウィンドウを表示,補完ウィンドウを表示時に挿入しない
```
set completeopt=menuone,noinsert
```

#### 2バイト文字を正常に表示する（★、※など）
```
set ambiwidth=double
```

#### vimgrep 時に無視するファイルパターンを設定する
```
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.class,*~
```

#### GUI オプションは全て無効にする（MacVim 起動時に、スクロールバーやタブなどを表示しない）
```
set guioptions=
```

#### コマンドラインモード時に Tab で補完が効くようにする
```
set wildmenu
```

#### wildemenu 補完時挙動設定 | 最初の Tab で共通部分の補完をしつつ補完候補を出し、次回以降はこの補完候補を順に選択する動作
```
set wildmode=longest:full,full
```

#### インサートモード時で補完ウィンドウ表示時に、Enter キーを押しても改行しない
```
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
```

補完ウィンドウ表示時に、Enter 押下すると改行も入る。
しかし、改行はさせたくないので、それを判定して、"Ctrl + y"（改行しない選択決定）に置き換えている。
ただし、補完ウィンドウ非表示時は通常動作で良いため、そのまま "<CR>(Enter)" としている。

- inoremap: 再マップさせないインサートモードのマッピングを指定する。
- `<expr>`: 引数を式(スクリプト)として扱い、式を評価する。
- `<CR>`: "Eenter"
- `pumvisible()`: 補完ウィンドウ表示の有無を返す関数。
- `<C-y>`: "Ctrl + y"

#### ファイル編集のタイミングで、そのファイルのディレクトリにカレントディレクトリを自動的に変更する
```
autocmd BufEnter * silent! lcd %:p:h
```


### Leader
以下の通り、使い分けることにする（マイルール）。

- リーダー: 直接的な開発で使う（LSP 操作: 定義ジャンプ、エラー表示など）
- ローカルリーダー: 上記以外（例: git 操作、セレクター操作、ファイラー操作）

#### リーダーを "Space" キーに割り当てる
```
let mapleader = "\<Space>"
```

#### ローカルリーダーを "," キーに割り当てる
```
let maplocalleader = ','
```


### Tab
#### タブの代わりにスペースを使う
```
set expandtab
```

#### タブ幅を設定する
```
set tabstop=2
```

#### 自動インデントのタブ幅を設定する
```
set shiftwidth=2
```


### View
#### 行番号を表示する
```
set number
```

#### ファイル名をタイトルに表示する
```
set title
```

#### ルーラーを表示する
```
set ruler
```

#### カレント行をハイライトする
```
set cursorline
```

#### カッコ入力時に対応するカッコを強調表示する
```
set showmatch
```

#### ステータスラインを常に表示する
```
set laststatus=2
```

- 0: 非表示
- 1: ウィンドウが分割の場合のみ表示
- 2: 常に表示

※itchyny/lightline.vim プラグインのために設定している。

#### サインカラムを常に表示する
```
set signcolumn=yes
```

※airblade/vim-gitgutter プラグインのために設定している。


### Search
#### 大文字小文字を区別せずに検索する
```
set ignorecase
```

#### 大文字で検索した場合は、大文字小文字をっ区別する
```
set smartcase
```

#### インクリメンタルサーチを有効にする
```
set incsearch
```

#### 検索結果が最後まで行ったら最初に戻る
```
set wrapscan
```

#### 検索結果をハイライトする
```
set hlsearch
```

#### 検索結果のハイライトを ESC 2回押しで解除する
```
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
```


### キー操作
#### 表示行単位で上下移動する
```
nnoremap j gj
nnoremap k gk
```

#### jj キーを ESC キーと同じ動作にする
```
inoremap <silent> jj <ESC>
```

#### コマンドラインで Ctrl + q キーを押すと、カレントバッファのパスを表示する
```
cnoremap <C-q> <C-r>=expand('%:p')<CR>
```

#### タブ移動
```
nnoremap <Tab><Tab> gt
nnoremap <S-Tab> gT
for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor
```

- Tab 2回で、右タブへ
- Shift + Tab で、左タブへ
- Tab1 で、1番目のタブへ（9番目まで対応）

#### コマンドラインモードのキーマップを vim 風にする
```
cnoremap <C-o> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <S-Left>
cnoremap <C-w> <S-Right>
cnoremap <C-x> <Del>
```

- C-o は C-0、C-e は C-$ 代わりに定義している（テンキー以外の数値はマッピング出来ないため）。


#### インサートモード時に、Shift - Tab でインデントを解除する
```
inoremap <S-Tab> <C-d>
```


### QuickFix
#### grep 系コマンドを実行すると、QuickFix ウィンドウを自動で表示する
```
autocmd QuickFixCmdPost *grep* cwindow
```

#### QuickFix ウィンドウを Leader 2回押しで閉じる
```
autocmd FileType qf call s:qickfix_keymap()
function! s:qickfix_keymap()
  nnoremap <silent><buffer> <Leader><Leader> :<C-u>bd<CR>
endfunction
```


### その他
#### ghq で絞り込んで cd する
```
command! -nargs=0 Repo call fzf#run({
\   'source': 'ghq list --full-path',
\   'sink': 'cd'
\ })
```

#### ~/.vimrc.local ファイルが存在すれば source する
```
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
```

※vimrc の設定を読み込んでから最後に定義する

#### runtimepath を設定する
```
set runtimepath+=~/.vim/
```

#### vimrc を分割する（runtimepath+=~/.vim/userautoload 配下に、.vimrc を分割したファイルを格納する。
```
runtime! userautoload/*.vim
```

※vimrc の設定を読み込んでから最後に定義する



## Plugin



### junegunn/vim-plug
- [junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)

#### vim-plug ウィンドウを ESC 2回押しで閉じる
```
autocmd FileType vim-plug call s:vimplug_keymap()
function! s:vimplug_keymap()
  ""Press esc twice to close
  nmap <silent><buffer> <ESC><ESC> :<C-u>bd<CR>
  imap <silent><buffer> <ESC><ESC> <ESC>:<C-u>bd<CR>
endfunction
```


### arcticicestudio/nord-vim
- [arcticicestudio/nord-vim: An arctic, north-bluish clean and elegant Vim theme.](https://github.com/arcticicestudio/nord-vim)

#### diff 時のバックグラウンドカラーは無効化する
```
let g:nord_uniform_diff_background = 1
```

#### 垂直分割ラインは、bold にする
```
let g:nord_bold_vertical_split_line = 1
```

#### カーソル行番号のバックグラウンドカラーをアクティブにする
```
let g:nord_cursor_line_number_background = 1
```

#### Visual, CursorLine のカラーを好みに変更する（デフォルトだと見えづらい部分）
```
augroup ColorschemeNord
  autocmd!
  autocmd ColorScheme nord highlight Visual ctermfg=11
  autocmd ColorScheme nord highlight CursorLine ctermfg=14
augroup END
```

- [Comment contrast · Issue #26 · arcticicestudio/nord-vim](https://github.com/arcticicestudio/nord-vim/issues/26)
- [Nord](https://www.nordtheme.com/docs/ports/vim/customization)

#### カラースキーマを設定する
```
colorscheme nord
```

※カラースキーマの中身を設定した後に定義する


### junegunn/fzf.vim
- [junegunn/fzf: A command-line fuzzy finder](https://github.com/junegunn/fzf)
- [junegunn/fzf.vim: fzf vim](https://github.com/junegunn/fzf.vim)

#### FZF コマンドの Prefix を設定する
```
let g:fzf_command_prefix = 'Fzf'
```

#### FZF ウィンドウサイズを設定する
```
let g:fzf_layout = { 'up': '~35%' }
```

#### よく使うコマンドにキーをマップする
```
nmap <silent> <Leader><Leader> :<C-u>FzfFiles<CR>
nnoremap <silent><nowait> <LocalLeader>l :<C-u>FzfBLines<CR>
nnoremap <silent><nowait> <LocalLeader>b :<C-u>FzfBuffers<CR>
nnoremap <silent><nowait> <LocalLeader>a :<C-u>cd %:p:h<CR> :<C-u>FzfAg<CR>
nnoremap <silent><nowait> <LocalLeader>h :<C-u>FzfHistory<CR>
```


### 'simeji/winresizer'
- [simeji/winresizer: very simple vim plugin for easy resizing of your vim windows](https://github.com/simeji/winresizer)

※ デフォルト使用


### 'itchyny/lightline.vim'
- [itchyny/lightline.vim: A light and configurable statusline/tabline plugin for Vim](https://github.com/itchyny/lightline.vim)

#### lightline 設定
```
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [
    \     [ 'mode', 'paste' ],
    \     [ 'coc_error', 'coc_warn', 'coc_info' ],
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
    \   'coc_error': 'LightlineCocError',
    \   'coc_warn': 'LightlineCocWarn',
    \   'coc_info': 'LightlineCocInfo',
    \   'inactive_filename': 'LightlineFilename',
    \ },
    \ 'component_type': {
    \   'coc_error': 'error',
    \   'coc_warn': 'warning',
    \   'coc_info': 'tabsel',
    \   'inactive_filename': 'middle',
    \ },
\ }

""Custom Color Settings
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.right = s:palette.normal.middle

function! LightlineFilename() abort
    return expand('%:p:h:t') . '/' . expand('%:t')
endfunction

function! s:lightline_coc_diagnostic(type, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:type, 0) == 0
        return ''
    endif
    return printf('%s %d', a:sign, info[a:type])
endfunction

function! LightlineCocError() abort
    return s:lightline_coc_diagnostic('error', '✘')
endfunction

function! LightlineCocWarn() abort
    return s:lightline_coc_diagnostic('warning', '⚠')
endfunction

function! LightlineCocInfo() abort
    return s:lightline_coc_diagnostic('information', 'i')
endfunction

augroup CocStatusSettings
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
augroup END
```

- アクティブ時
  - 左
    - カラースキーマ: nord
    - vim モード、ペーストモード（set paste, set nopaste）
    - coc.nvim のステータス情報（error、warning、infomation） ※カスタム定義
    - 読み取り専用、Git ブランチ、ファイル名、変更マーク（+ = 変更されている）
  - 右
    - ファイルフォーマット、ファイルエンコーディング、ファイルタイプ、ファイル位置、ファイル行情報
- 非アクティブ時
  - 左
    - ファイル名 ※カスタム定義
  - 右
    - なし

refs. [作者が教える！ lightline.vimの設定方法！ 〜 中級編 - 展開コンポーネントを理解しよう - プログラムモグモグ](https://itchyny.hatenablog.com/entry/20130918/1379461406)


### lambdalisue/fern.vim
- [lambdalisue/fern.vim: 🌿 General purpose asynchronous tree viewer written in Pure Vim script](https://github.com/lambdalisue/fern.vim)

#### fern 設定
```
let g:fern#default_hidden = 1
let g:fern#disable_default_mappings = 1

nnoremap <silent> <Leader>e :<C-u>Fern .<CR>
autocmd FileType fern call s:fern_keymap()

function! s:fern_keymap()

  ""Press esc twice to close
  nmap <silent><buffer> <ESC><ESC> :<C-u>bd<CR>
  imap <silent><buffer> <ESC><ESC> <ESC>:<C-u>bd<CR>

  ""Fern Keymaps
  nmap <silent><buffer><nowait> <C-h> <Plug>(fern-action-leave)
  nmap <silent><buffer><nowait> h <Plug>(fern-action-collapse)
  nmap <silent><buffer><nowait> <C-r> <Plug>(fern-action-reload)
  nmap <silent><buffer><nowait> o <Plug>(fern-action-open)
  nmap <silent><buffer><nowait> <Return> o
  nmap <silent><buffer><nowait> <Space> <Plug>(fern-action-mark:toggle)
  nmap <silent><buffer><nowait> t <Plug>(fern-action-open:tabedit)
  nmap <silent><buffer><nowait> l <Plug>(fern-action-expand)
  nmap <silent><buffer><nowait> x <Plug>(fern-action-open:system)
  nmap <silent><buffer><nowait> N <Plug>(fern-action-new-file)
  nmap <silent><buffer><nowait> K <Plug>(fern-action-new-dir)
  nmap <silent><buffer><nowait> c <Plug>(fern-action-copy)
  nmap <silent><buffer><nowait> m <Plug>(fern-action-move)
  nmap <silent><buffer><nowait> r <Plug>(fern-action-rename)
  nmap <silent><buffer><nowait> D <Plug>(fern-action-trash)
  nmap <silent><buffer><nowait> C <Plug>(fern-action-clipboard-copy)
  nmap <silent><buffer><nowait> M <Plug>(fern-action-clipboard-move)
  nmap <silent><buffer><nowait> P <Plug>(fern-action-clipboard-paste)
  nmap <silent><buffer> yy <Plug>(fern-action-yank:path)

  ""FZF Keymaps
  nmap <silent><buffer><nowait> <LocalLeader>a :<C-u>FzfAg<CR>
  nmap <silent><buffer><nowait> <LocalLeader>b :<C-u>FzfBuffers<CR>
  nmap <silent><buffer><nowait> <LocalLeader>h :<C-u>FzfHistory<CR>

endfunction
```


### tomtom/tcomment_vim
- [tomtom/tcomment_vim: An extensible & universal comment vim-plugin that also handles embedded filetypes](https://github.com/tomtom/tcomment_vim)

※ デフォルト使用


### tpope/vim-surround
- [tpope/vim-surround: surround.vim: Delete/change/add parentheses/quotes/XML-tags/much more with ease](https://github.com/tpope/vim-surround)

※ デフォルト使用


### Yggdroot/indentLine
- [Yggdroot/indentLine: A vim plugin to display the indention levels with thin vertical lines](https://github.com/Yggdroot/indentLine)

※ デフォルト使用


### ConradIrwin/vim-bracketed-paste
- [ConradIrwin/vim-bracketed-paste: Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)](https://github.com/ConradIrwin/vim-bracketed-paste)

※ デフォルト使用


### godlygeek/tabular
- [godlygeek/tabular: Vim script for text filtering and alignment](https://github.com/godlygeek/tabular)

※ デフォルト使用


### iberianpig/tig-explorer.vim
- [iberianpig/tig-explorer.vim: Vim plugin to use Tig as a git client. Seamless switching between vim and Tig with opening in the same buffer.](https://github.com/iberianpig/tig-explorer.vim)
- [jonas/tig: Text-mode interface for git](https://github.com/jonas/tig)

#### よく使うコマンドにキーをマップする: git status
```
nnoremap <silent> <LocalLeader>gs :<C-u>TigStatus<CR>
```

#### よく使うコマンドにキーをマップする: git log
```
nnoremap <silent> <LocalLeader>gl :<C-u>Tig<CR>
```

#### よく使うコマンドにキーをマップする: git log of current file
```
nnoremap <silent> <LocalLeader>gc :<C-u>TigOpenCurrentFile<CR>
```

#### よく使うコマンドにキーをマップする: git blame
```
nnoremap <silent> <LocalLeader>gb :<C-u>TigBlame<CR>
```


### airblade/vim-gitgutter
- [airblade/vim-gitgutter: A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.](https://github.com/airblade/vim-gitgutter)

※ デフォルト使用


### itchyny/vim-gitbranch
- [itchyny/vim-gitbranch: Provides the branch name of the current git repository](https://github.com/itchyny/vim-gitbranch)

※ デフォルト使用


### previm/previm
- [previm/previm: Realtime preview by Vim. (Markdown, reStructuredText, textile)](https://github.com/previm/previm)

#### プレビューするブラウザを指定する
```
let g:previm_open_cmd = 'open -a Google\ Chrome'
```


### glidenote/memolist.vim
- [glidenote/memolist.vim: simple memo plugin for Vim.](https://github.com/glidenote/memolist.vim)

#### memolist 設定
```
let g:memolist_path = "$HOME/memo"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = "~/.config/memo"
```


### tyru/open-browser.vim
- [tyru/open-browser.vim: Open URI with your favorite browser from your most favorite editor](https://github.com/tyru/open-browser.vim)

#### よく使うコマンドにキーをマップする: ブラウザを開いて、カーソル行の単語を検索する
```
nmap <silent> <LocalLeader>op <Plug>(openbrowser-smart-search)
vmap <silent> <LocalLeader>op <Plug>(openbrowser-smart-search)
```

#### よく使うコマンドにキーをマップする: ブラウザを開いて、カーソル行の単語を DeepL で翻訳する
```
nnoremap <silent> <LocalLeader>tl :<C-u>execute 'OpenBrowserSearch -deepl' expand('<cWORD>')<CR>
let g:openbrowser_search_engines = {
\    'deepl': 'https://www.deepl.com/translator#auto/auto/{query}',
\}
```


### neoclide/coc.nvim
- [neoclide/coc.nvim: Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.](https://github.com/neoclide/coc.nvim)

#### 事前に依存している nord, yarn をインストールする
```
% brew install node && npm i -g yarn
```

#### 使用する extentions
```
let g:coc_global_extensions = [
    \ 'coc-lists',
    \ 'coc-marketplace',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-python',
    \ 'coc-go',
\ ]
```

#### よく使うコマンドにキーをマップする
```
""Show all diagnostics (OR CocList diagnostics)
nnoremap <silent> <Leader>di :<C-u>CocDiagnostics<CR>
""Navigate diagnostics
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
""Hover
nmap <silent> <Leader>hv :<C-u>call CocAction('doHover')<CR>>
""Definition
nmap <silent> <Leader>gd <Plug>(coc-definition)
""References
nmap <silent> <Leader>rf <Plug>(coc-references)
""Rename
nmap <silent> <Leader>rn <Plug>(coc-rename)
""Show CocList
nnoremap <silent><nowait> <Leader>l  :<C-u>CocList<CR>
""Show commands
nnoremap <silent><nowait> <Leader>c  :<C-u>CocList commands<CR>
""Search workspace symbols
nnoremap <silent><nowait> <Leader>s  :<C-u>CocList -I symbols<CR>
```


### liuchengxu/vista.vim
- [liuchengxu/vista.vim: Viewer & Finder for LSP symbols and tags](https://github.com/liuchengxu/vista.vim)

#### vista 設定
``` 
let g:vista#renderer#enable_icon = 0
let g:vista_sidebar_position = 'vertical topleft'

autocmd FileType markdown call s:vista_keymap_markdown()
function! s:vista_keymap_markdown()
  ""TODO: <Leader>o で、Vista finder fzf:toc がやりたいが、現状できないので操作ミスを考慮して、解決するまで t と同じにしておく。
  nmap <silent><buffer><nowait> <Leader>o :<C-u>Vista toc<CR>
  nmap <silent><buffer><nowait> <Leader>t :<C-u>Vista toc<CR>
endfunction

autocmd FileType vista_markdown call s:vista_keymap_vista_markdown()
function! s:vista_keymap_vista_markdown()
  ""Press esc twice to close
  nmap <silent><buffer> <ESC><ESC> :<C-u>Vista!<CR>
  imap <silent><buffer> <ESC><ESC> <ESC>:<C-u>Vista!<CR>
endfunction

autocmd FileType typescript call s:vista_keymap_development()
autocmd FileType javascript call s:vista_keymap_development()
autocmd FileType go call s:vista_keymap_development()
autocmd FileType python call s:vista_keymap_development()
function! s:vista_keymap_development()
  nmap <silent><buffer><nowait> <Leader>o :<C-u>Vista finder coc<CR>
  nmap <silent><buffer><nowait> <Leader>t :<C-u>Vista coc<CR>
endfunction

autocmd FileType vista call s:vista_keymap()
function! s:vista_keymap()
  ""Press esc twice to close
  nmap <silent><buffer> <ESC><ESC> :<C-u>Vista!<CR>
  imap <silent><buffer> <ESC><ESC> <ESC>:<C-u>Vista!<CR>
endfunction
```

