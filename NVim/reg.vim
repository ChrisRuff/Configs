"Leader is comma"'
let mapleader=","   
let maplocalleader=","

"vim-plug
call plug#begin(stdpath('data') . 'plugged')
	" appearance 
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'flazz/vim-colorschemes'
	Plug 'connorholyday/vim-snazzy'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'rafi/awesome-vim-colorschemes'

	" dependent upon coc LSP client
	Plug 'jackguo380/vim-lsp-cxx-highlight'

	Plug 'airblade/vim-gitgutter'
	Plug 'simeji/winresizer'
	Plug 'majutsushi/tagbar'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'mbbill/undotree'
	Plug 'preservim/nerdtree'
	Plug 'preservim/nerdcommenter'
	Plug 'xuyuanp/nerdtree-git-plugin'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf.vim'
	Plug 'rhysd/vim-grammarous'
	Plug 'vim-scripts/DoxygenToolkit.vim'

	Plug 'rking/ag.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'zirrostig/vim-schlepp'
	Plug 'triglav/vim-visual-increment'
	Plug 'puremourning/vimspector'
call plug#end() 
" ================================== Native Settings ==================================
filetype plugin indent on

colorscheme OceanicNext
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=.*.dfp,*.hdb,*.dpi,*.cdb,*.kpt

"Remove octal so counting goes from 0-10 no 0-7
set nrformats-=octal
set clipboard=unnamedplus

set softtabstop=2
set tabstop=2
set shiftwidth=2
set noexpandtab
set conceallevel=1
set listchars=tab:\|\ 
set list

set incsearch
set hlsearch

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set cursorline
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
set lazyredraw
set wildmenu
set showmatch
set matchpairs+=<:>
set number
set exrc 
set secure
set scrolloff=15
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v',100)
set syntax
syntax enable

" move the navigation keys one to the right to line up with traditional touch
" typing
"MOVEMENT START"
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l

" move to beginning/end of line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
vnoremap $ <nop>
vnoremap ^ <nop>
"shifting move keys over one"
map h <nop>
vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l
nnoremap <C-k> jzz
nnoremap <C-l> kzz
noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j
noremap <C-w>l <C-w>k
noremap <C-w>; <C-w>l

nmap <S-k> 3k
nmap <S-l> 3l

"MOVEMENT END"

" Auto complete braces
inoremap <expr>( strpart(getline('.'), col('.')-1, 1) == "" ? "()\<left>" : "("
inoremap <expr>{ strpart(getline('.'), col('.')-1, 1) == "" ? "{}\<left>" : "{"
inoremap <expr>[ strpart(getline('.'), col('.')-1, 1) == "" ? "[]\<left>" : "["

inoremap {<CR> {<CR>}<ESC>O
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : strpart(getline('.'), col('.')-1, 1) == "" ? "\"\"<left>" : "\""
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : strpart(getline('.'), col('.')-1, 1) == "" ? "\'\'<left>" : "\'"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"

" turn off search highlight
map <leader>f :nohlsearch<CR>
nnoremap <space> za

" highlight last inserted text
nnoremap gV `[v`]

" Count number of words in latex documents
nmap <F3> :w !detex \| wc -w<CR>

" ======================================== TagBar ========================================
nmap <leader>t :TagbarToggle<CR>


" =================================vim-lsp-cxx-highlight================================
let g:lsp_cxx_hl_use_text_props = 1


" ======================================== Doxygen =====================================
let g:DoxygenToolkit_enhanced_color=1
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Chris Ruff"


" ===================================== Schelpp =======================================
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
vmap <unique> D <Plug>SchleppDup
let g:Schlepp#trimWS = 1

" ======================================= Crtl P =======================================
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("k")':   ['<c-l>', '<up>'],
	\ 'PrtCurRight()' : ['<c-;>', '<right>'],
	\ 'PrtCurLeft()' : ['<c-j>', '<left>'],
	\ 'PrtSelectMove("j")': ['<c-k>', '<down>'],
	\ }


" ====================================== NERDTree ======================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeIgnore=['CMakeFiles[[dir]]']
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "^",
    \ "Renamed"   : "-",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : 'X',
    \ "Unknown"   : "?"
    \ }
nnoremap <Leader>z :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" =================================== nerdcommenter ====================================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlight = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" ================================== vim-gitgutyter ====================================
" \hp will preview hunk changes
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

"========================================Airline=======================================
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" ===================================== winresizer ====================================
" enter winresizer with ctrl+e, resize with jkl; from there
let g:winresizer_keycode_left = 106
let g:winresizer_keycode_right = 59
let g:winresizer_keycode_down = 107
let g:winresizer_keycode_up = 108

" ====================================== undotree =================--==================
" use `,u` to enter undotree. ? for help in window
nnoremap <leader>u :UndotreeToggle<cr>

" ======================================== coc ========================================
" Use tab for trigger completion with characters ahead and navigate.
" Use  ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.  Coc only does snippet and additional edit on confirm.  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

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
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show s
"nnoremap <silent> <space>c  :<C-u>CocList s<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" use Ag
let g:ackprg = 'ag --vimgrep'

" coc-yank
" open yank list
nnoremap <silent><space>y :<C-u>CocList -A --normal yank<cr>
" coc-highlight
" clear all yanks with :Coc yank.clean
" enable highligh current symbol
autocmd CursorHold * silent call CocActionAsync('highlight')
