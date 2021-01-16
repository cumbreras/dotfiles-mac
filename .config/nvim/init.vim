" ======================================================================================================================
" 1.0 Colors Term
" ======================================================================================================================
"{{{

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ======================================================================================================================
" 1.1 Plugin manager (Plug) settings
" ======================================================================================================================
"{{{

" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
"
call plug#begin('~/.config/nvim/plugged')
imap jj <ESC>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Ruby autocomplete
Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby'] }
" Vim test
Plug 'janko-m/vim-test'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Async loader
Plug 'xolox/vim-misc'
" Tmux command Runner
Plug 'christoomey/vim-tmux-runner'
" Vscode extensions
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
" Firenvim
Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Ruby/Rails {{{
" ---------------------------------------------------------------------------------------------------------------------

" Ruby support (plays nicely with tpope/rbenv-ctags)
Plug 'vim-ruby/vim-ruby'
" Haml syntax
Plug 'tpope/vim-haml'
" Minitest syntax
Plug 'sunaku/vim-ruby-minitest'
" Rails support (:A, :R, :Rmigration, :Rextract)
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Bundler support (plays nicely with tpope/gem-ctags)
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Solargraph support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Spec runner
Plug 'janko-m/vim-test'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" JS (ES6, React) {{{
" ---------------------------------------------------------------------------------------------------------------------

" JS syntax
Plug 'jelera/vim-javascript-syntax'
" JS libs syntax (React, Angular)
Plug 'othree/javascript-libraries-syntax.vim'
" JSX syntax (needs vim-javascript for indentation)
Plug 'mxw/vim-jsx' | Plug 'pangloss/vim-javascript'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
" JS syntax, supports ES6
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
" Better indentation
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript'] }
" JS syntax for common libraries
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
" Makes gf work on node require statements
Plug 'moll/vim-node', { 'for': ['javascript'] }
" JavaScript
Plug 'flowtype/vim-flow'
" GraphQL
Plug 'jparise/vim-graphql'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS {{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xhtml', 'javascript', 'javascript.jsx'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
Plug 'elixir-editors/vim-elixir'
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Split
Plug 'AndrewRadev/splitjoin.vim'
" Vim ref
Plug 'thinca/vim-ref'
" Elixir completion
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Elixir Alchemist
Plug 'slashmili/alchemist.vim'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Dockerfile
Plug 'honza/dockerfile.vim'
" Helm template
Plug 'towolf/vim-helm'
" ToML
Plug 'cespare/vim-toml'
" Rust
Plug 'rust-lang/rust.vim'
" Rust racer
Plug 'racer-rust/vim-racer'

"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------
" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Buffers manager
Plug 'moll/vim-bbye'
" Vim tmux
Plug 'christoomey/vim-tmux-navigator'
" YCM
Plug 'ycm-core/YouCompleteMe'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Fugitive
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
" Git log viewer (Gitv! for file mode)
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

" Highlight jump characters on f, F, t, T
Plug 'unblevable/quick-scope'
" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Safely editing in isolation
Plug 'ferranpm/vim-isolate', { 'on':  ['Isolate', 'UnIsolate'] }
" Cycling related words via C-a C-x (i.e. true/false)
Plug 'zef/vim-cycle'
" Titlecase motion (gt)
Plug 'christoomey/vim-titlecase'
" Move lines around
Plug 'matze/vim-move'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes {{{
" ---------------------------------------------------------------------------------------------------------------------

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'edkolev/tmuxline.vim'
" Airline
Plug 'ryanoasis/vim-devicons'
" One Dark
Plug 'joshdick/onedark.vim'
" One
Plug 'rakr/vim-one'
" One-half
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Semantic coloring
Plug 'jaxbot/semantic-highlight.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other {{{
" ---------------------------------------------------------------------------------------------------------------------

" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Search for highlighted word with *
Plug 'thinca/vim-visualstar'
" Improve star by not jumping immediately
Plug 'ironhouzi/vim-stim'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Iabbrev auto-correction library
Plug 'chip/vim-fat-finger'
" More . repeat functionality
Plug 'tpope/vim-repeat'
" Delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
" Populate arglist with buffers in quickfix list
Plug 'nelstrom/vim-qargs', { 'on': 'Qargs' }
" Identguides
Plug 'Yggdroot/indentLine'
" TagBar
Plug 'majutsushi/tagbar'
"}}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.3 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" ======================================================================================================================
" 2.0 Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================
"{{{

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line number
set relativenumber                          " Relative numbers
set showmode                                " Always show mode
set cursorline                              " Highlight cursor line
set showcmd                                 " Show commands as you type them
set textwidth=120                           " Text width is 120 characters
set cmdheight=2                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamedplus                  " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set encoding=utf8                           " Encoding
set synmaxcol=128                           " Syntax highlighting max colums
syntax sync minlines=256                    " Syntax highlighting max lines
setlocal sw=2 sts=2 et
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.1 Split settings (more natural) {{{
" ---------------------------------------------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.2 Timeout settings {{{
" ---------------------------------------------------------------------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.3 Spelling settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.4 Search settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.5 Persistent undo settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.6 White chaacters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:\ \ ,extends:❯,precedes:❮,trail:·,nbsp:·
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 240
set showbreak=↪
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.7 Filetype settings {{{
" ---------------------------------------------------------------------------------------------------------------------
filetype plugin on
filetype indent on
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.8 Folding settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set foldmethod=manual                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.9 Omni completion settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Neovim specific settings {{{
" ---------------------------------------------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1       " Set an environment variable to use the t_SI/t_EI hack
let $NVIM_TUI_ENABLE_TRUE_COLOR=1       " Turn on true colors support (does not work inside tmux yet)
"}}}

" ======================================================================================================================
" 3.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 3.1 Setting leader {{{
" -----------------------------------------------------
let g:mapleader=","
"}}}

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter {{{
" with Q key, help with F1, etc.
" -----------------------------------------------------
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>
"}}}

" -----------------------------------------------------
" 3.3 Vim defaults overriding {{{
" -----------------------------------------------------

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Quick replay 'q' macro
nnoremap Q @q

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Terminal mode mappings
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz
"}}}

" -----------------------------------------------------
" 3.4 Common tasks {{{
" -----------------------------------------------------

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" Quick save and close buffer
nnoremap ,w :w<CR>
nnoremap <silent> ,c :Sayonara!<CR>
nnoremap <silent> ,q :Sayonara<CR>

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap ,z za

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>
"}}}

" ======================================================================================================================
" 4.0 Plugins settings
" ======================================================================================================================
" -----------------------------------------------------
" 4.3 NERDTree {{{
" -----------------------------------------------------
let loaded_netrwPlugin = 1

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=70
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

set guioptions-=L
let g:NERDTreeWinSize=20
let g:NERDTreeWinPos='left'
let NERDTreeMapActivateNode='<space>'
let g:NERDTreeWinSize=30
let NERDTreeQuitOnOpen = 1
nmap tn :NERDTreeToggle<CR>
nmap tf :NERDTreeFind<CR>
autocmd VimEnter * set winfixwidth
"}}}

" -----------------------------------------------------
" 4.5 Gitgutter settings {{{
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'
"}}}

" -----------------------------------------------------
" 4.6 Vim JSX highlighting settings {{{
" -----------------------------------------------------
let g:jsx_ext_required=0
"}}}
"

" -----------------------------------------------------
" 4.7 Neoclide
" -----------------------------------------------------
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
inoremap <silent><expr> <c-space> coc#refresh()
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

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
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
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

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

" -----------------------------------------------------
" 4.9 Ruby settings {{{
" -----------------------------------------------------
let g:ruby_refactoring_map_keys=0
nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rT :TestFile<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
"}}}

" -----------------------------------------------------
" 4.10 Golang settings thanks to @faith for them! {{{
" -----------------------------------------------------

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

augroup go
  autocmd!

  map <C-n> :cnext<CR>
  map <C-m> :cprevious<CR>
  nnoremap <leader>a :cclose<CR>

  autocmd FileType go nmap <silent> <leader>ga <Plug>(go-alternate-edit)

  autocmd FileType go nmap <silent> <Leader>gv <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>gs <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>gd <Plug>(go-def-tab)

  autocmd FileType go nmap <silent> <Leader>gx <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>gi <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>gl <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>gt  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>gr  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>ge  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>gc <Plug>(go-coverage-toggle)
augroup END

" Colors
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"}}}

" -----------------------------------------------------
" 4.11 Vim Markdown settings {{{
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
"}}}

" -----------------------------------------------------
" 4.13 Quick scope settings {{{
" -----------------------------------------------------
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
"}}}

" -----------------------------------------------------
" 4.16 Javascript libraries syntax settings {{{
" -----------------------------------------------------
let g:used_javascript_libs = 'chai,flux,react,underscore'
let g:flow#enable = 0
"}}}
"
" -----------------------------------------------------
" 4.17 Rust
" -----------------------------------------------------
let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "/Users/cumbreras/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]
"}}}

" -----------------------------------------------------
" 4.18 Plug settings {{{
" -----------------------------------------------------
let g:plug_timeout=20
"}}}

" -----------------------------------------------------
" 4.19 Coding Helpers {{{
" -----------------------------------------------------
nnoremap <Leader>b :SemanticHighlightToggle<cr>
"}}}

" -----------------------------------------------------
" 4.19 Vim-markdown settings {{{
" -----------------------------------------------------
let g:markdown_fenced_languages=[
      \'bash=sh',
      \'git=gitconfig',
      \'javascript',
      \'lua',
      \'ruby',
      \'tmux',
      \'viml=vim',
      \'xdefaults',
      \'zsh']
"}}}

" -----------------------------------------------------
" 4.20 Colorizer settings {{{
" -----------------------------------------------------
let g:colorizer_nomap=1
"}}}

noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" ======================================================================================================================
" 5.0 Plugin mappings
" ======================================================================================================================
"{{{
" -----------------------------------------------------
" 5.1 Isolate {{{
" -----------------------------------------------------
vnoremap ,i :Isolate<CR>
nnoremap ,u :UnIsolate<CR>
"}}}

" -----------------------------------------------------
" 5.2 Gitgutter {{{
" -----------------------------------------------------
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>
"}}}

" -----------------------------------------------------
" 5.3 Expand region {{{
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" -----------------------------------------------------
" 5.4 Vim Markdown {{{
" -----------------------------------------------------
nmap [[ <Plug>Markdown_MoveToPreviousHeader
nmap ]] <Plug>Markdown_MoveToNextHeader
"}}}

" -----------------------------------------------------
" 5.13 BufOnly {{{
" -----------------------------------------------------
nnoremap ,C :Bonly<CR>
"}}}

" -----------------------------------------------------
" 5.14 Gitv {{{
" -----------------------------------------------------
nnoremap <leader>gh :Gitv!<CR>
"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" Theme
set t_Co=256
syntax enable
syntax on
set background=dark
colorscheme onehalfdark
highlight Normal guibg=none

highlight LineNr guibg=#213047
highlight SignColumn guibg=#213047
highlight Pmenu guibg=#213047 guifg=#FFFFFF
highlight CursorLine guibg=#1B3D5A ctermbg=234
highlight CursorLineNr guibg=#1B3D5A ctermbg=234
highlight GitGutterAdd ctermfg=green guibg=#213047
highlight GitGutterChange ctermfg=yellow guibg=#213047
highlight GitGutterDelete ctermfg=red guibg=#213047
highlight GitGutterChangeDelete ctermfg=yellow guibg=#213047

highlight colorcolumn guibg=#1B3D5A
if exists('+colorcolumn')
  set colorcolumn=120
endif

" Lightline + Bufline
set showtabline=2

let g:lightline = {
            \ 'colorscheme' : 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'filename', 'percentage' ] ]
            \ },
            \ 'component_function': {
            \   'readonly': 'MyReadOnly',
            \   'modified': 'MyModified',
            \   'filename' : 'MyFilename',
            \   'fugitive': 'MyFugitive',
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#filename_modifier = ':t'

function! MyModified()
  return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' !=# MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype ==# 'unite' ? unite#get_status_string() :
        \  &filetype ==# 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' !=# MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
   try
    if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let l:_ = fugitive#head()
      return strlen(l:_) ? '⭠ '.l:_ : ''
    endif
  catch
  endtry
  return ''
endfunction
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Highlight term cursor differently {{{
highlight TermCursor ctermfg=green guifg=green
"}}}

" Listchars highlighting {{{
highlight NonText ctermfg=235 guifg=gray
highlight SpecialKey ctermfg=235 guifg=gray
"}}}

" Remove underline in folded lines {{{
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" ======================================================================================================================
" 7.0 Autocommands
" ======================================================================================================================
"{{{

" Keywordprg settings {{{
autocmd FileType vim setlocal keywordprg=:help
"}}}

" Turn spellcheck on for markdown files {{{
autocmd BufNewFile,BufRead *.md setlocal spell
"}}}

" Resize splits when the window is resized {{{
autocmd VimResized * :wincmd =
"}}}

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh. {{{
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

"
"###########################
" PERSONAL BINDS
"###########################
let mapleader = ','
imap jj  <Esc>
nnoremap <Leader>w :Bdelete<CR>
nnoremap <Leader>q :bufdo :Bdelete<CR>
nnoremap <Leader>e :bw<CR>
noremap  <Leader>sl :sort<CR>
nnoremap <Leader>rv :source $MYVIMRC<CR>
let g:move_key_modifier = 'D'
nmap ;w :w<CR>
nmap fs :w<CR>
nmap <leader>cs :VtrAttachToPane<CR>
nmap <leader>cr :VtrSendCommandToRunner<Space>
nmap <leader>cl :VtrSendLinesToRunner<CR>
nmap <leader>tb :TagbarToggle<CR>

" Hash syntax
nnoremap <leader>z :%s/:\([^=,'"]*\) =>/\1:/g<CR>
" Remove Highlight
nnoremap <esc> :noh<return><esc>
" Use space to toggle folds
nnoremap <silent> <Space> za
" Create a fold using space
vnoremap <silent> <Space> zf"
" Save on lost focus
autocmd BufLeave,FocusLost * silent! wall
" Search
map <leader>f :Rg<CR>
map <leader>fw :Rg! <cword> <CR>


"############################
" TABS BUFFERS AND NAV
"###########################
nmap fp :Files<CR>
nmap fb :Buffers<CR>
map <leader>s :vs<CR>
map <Tab>   :bnext<CR>
map <S-Tab> :bprevious<CR>
map gn :tabNext<cr>
map gb :tabprevious<cr>
map gd :bd<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"############################
" WHITESPACE TRIMMER
"###########################
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

"############################
" SEARCH IGNORES
"###########################
set wildignore+=/.tags
set wildignore+=*/tmp/*
set wildignore+=*/node_modules/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/chef/*
set wildignore+=*/coverage/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig
set wildignore+=*/vendor/*
set wildignore+=*/bower_components/*

"############################
" ¯\_(ツ)_/¯
"###########################
cmap WQ wq
cmap W w
cmap wQ wq
cmap Tabe tabe
cmap Q q
