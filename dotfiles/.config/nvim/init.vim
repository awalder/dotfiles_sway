call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Semantic highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

" Colorthemes
Plug 'tomasiser/vim-code-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'blasco/vim-corvine'
Plug 'dracula/vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'sjl/badwolf'

Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'

Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'totu/vim-log-highlighting'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'

Plug 'mfukar/robotframework-vim'
Plug 'vim-scripts/scons.vim'

" Easymotion
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" GLSL
Plug 'tikhomirov/vim-glsl'

" NEW
Plug 'danilamihailov/beacon.nvim'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/linediff.vim'
" Plug 'blueyed/vim-diminactive'

call plug#end()

syntax on

set termguicolors
colorscheme monokai_pro
colorscheme gruvbox
colorscheme nord
colorscheme codedark

let mapleader=" "

syntax on
set t_Co=256
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab
set hidden
set nowrap
set showmatch
set incsearch
set smartcase
set ignorecase
set splitbelow splitright
set relativenumber number
set cursorline
set scrolloff=8
set list

set path+=**
set wildmenu
set wildmode=longest,list
set wildignore+=*.pyc,*.pcapng,.ccls-cache
set rtp+=~/dev/git/fzf

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=100
set shortmess+=c
set signcolumn=yes
set textwidth=80
set colorcolumn=+1
set mouse=a
hi ColorColumn guibg=#4f3f3f ctermbg=246


" set clipboard+=unnamedplus
" Copy to clipboard in visualmode
vnoremap <C-C> :w !wl-copy <CR><CR>
" vnoremap <leader>y "*y
vnoremap <C-y> "*y
nnoremap <C-p> "*p
" nnoremap <leader>p "*p

nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,space:·,nbsp:␣,trail:~

" AutoCmds
" Remove trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" autocmd BufWritePre * %s/\s\+$//e

autocmd FileType meson setlocal textwidth=0 wrapmargin=0
autocmd FileType robot setlocal textwidth=0 wrapmargin=0
autocmd FileType vim setlocal textwidth=0 wrapmargin=0

let g:lsp_cxx_hl_use_text_props = 1
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-l> <C-w>l
nnoremap <silent> <M-h> <C-w>h
nnoremap <silent> <M-k> <C-w>k
nnoremap <silent> <M-j> <C-w>j

nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>

" search highlighted text
vnoremap -- y/\V<C-R>=escape(@",'/\')<CR><CR>

autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag,*.geom,*.comp set ft=glsl

"""""""""""""""""""""""""""""
"" cursor beacon
highlight Beacon guibg=yellow ctermbg=15
nmap n n:Beacon<cr>
nmap N N:Beacon<cr>
nmap * *:Beacon<cr>
nmap # #:Beacon<cr>

"""""""""""""""""""""""""""""
"" Undotree
nnoremap <leader>uo :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1

"""""""""""""""""""""""""""""
"" coc.nvim extensions
let g:coc_global_extensions = [
            \ 'coc-pairs',
            \ 'coc-fzf-preview',
            \ 'coc-snippets',
            \ 'coc-json',
            \ 'coc-python',
            \ 'coc-cmake',
            \ 'coc-yaml'
            \ ]
" Load COC.nvim settings
"
nmap <silent> <M-j> <Plug>(coc-definition)
nmap <silent> <C-,> <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>
nmap <silent> + <Plug>(coc-diagnostic-prev)
nmap <silent> = <Plug>(coc-diagnostic-next)

source ~/.config/nvim/cocconfig.vim

"""""""""""""""""""""""""""""
"" ericcurtin/CurtineIncSw.vim
nnoremap <silent> gp :call CurtineIncSw()<CR>
nnoremap <silent> g- :vs % <bar> :call CurtineIncSw()<CR>

" CTRL + S - Save
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>


"""""""""""""""""""""""""""""
"" FZF

" :CocCommand fzf-preview.ProjectFiles

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]b     :CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]-     :CocCommand fzf-preview.Lines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :CocCommand fzf-preview.Lines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :CocCommand fzf-preview.LocationList<CR>
" nnoremap <C-e> :FzfPreviewDirectoryFiles<CR>
nnoremap <silent> <C-e> :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent> <C-f> :CocCommand fzf-preview.Buffers<CR>

" let g:fzf_preview_filelist_command = 'rg --files --follow --no-messages -g \!"* *"' " Installed ripgrep
let g:fzf_preview_directory_files_command = 'rg --files --follow --no-messages -g \!"* *"'

" nnoremap <C-f> :FzfPreviewLines<CR>
" nnoremap <silent> <C-f> :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>

"""""""""""""""""""""""""""""
"" scrooloose/nerdtree

" Navigation bar
" x := explorer
" Toggle file explorer
" xo : = explorer open/close
let g:NERDTreeWinSize=50
nnoremap <C-t> :NERDTreeToggle<CR>:set relativenumber<CR>:set number<CR>
" silent Arpeggio nnoremap xo :NERDTreeToggle<CR>:set relativenumber<CR>:set number<CR>
nnoremap <Leader>xo :NERDTreeToggle<CR>:set relativenumber<CR>:set number<CR>
" xl := explorer locate file := find current opened file in explorer
nnoremap <Leader>xl :NERDTreeFind<CR>:set relativenumber<CR>:set number<CR>
" xp := explorer project := Change directory to root of the repository
nnoremap <Leader>xp :NERDTreeVCS<CR>:set relativenumber<CR>:set number<CR>

let g:NERDTreeShowBookmarks=1
" Change the NERDTree directory to the root node
let g:NERDTreeChDirMode=2
" Mappings
let NERDTreeMapOpenSplit='<C-s>'
let NERDTreeMapOpenVSplit='<C-v>'

let NERDTreeIgnore = ['\.pyc$', '\.os$']
set fillchars+=vert:\

"""""""""""""""""""""""""""""
"" Nerdcommenter
let g:NERDSpaceDelims = 1

"""""""""""""""""""""""""""""
"" vim-clang-format
let g:clang_format#code_style="llvm"
let g:clang_format#detect_style_file=1
autocmd FileType c,cpp nnoremap <buffer><Leader>kf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>kf :ClangFormat<CR>

"""""""""""""""""""""""""""""
"" Misc
"let c_no_curly_error = 1
set diffopt+=vertical " Force vertical splits on diffs
nnoremap <silent> <Leader>- :nohlsearch<CR>
au BufNewFile,BufRead SConscript set filetype=scons

"""""""""""""""""""""""""""""
"" vim-fugitive
" Git integration

nmap <silent> <leader>mc :Gcommit<CR>
nmap <silent> <leader>mm :Git checkout
nmap <silent> <leader>mb :Gblame<CR>
" Revert local changes
nmap <silent> <leader>mr :Git checkout .<CR>
nmap <silent> <leader>mw :Gwrite<CR> :Gstatus<CR>
nmap <silent> <leader>ms :Gstatus<CR>
nmap <silent> <leader>mp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <silent> <leader>mu :Git pull<CR>
nmap <silent> <leader>md :Gdiff<CR>
set diffopt+=vertical
let g:fugitive_summary_format = "%h %cd %an %s"

"""""""""""""""""""""""""""""
"" vim-EasyMotion

" function! s:config_easyfuzzymotion(...) abort
  " return extend(copy({
  " \   'converters': [incsearch#config#fuzzyword#converter()],
  " \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  " \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  " \   'is_expr': 0,
  " \   'is_stay': 1
  " \ }), get(a:, 1, {}))
" endfunction

" " noremap <silent><expr> <leader>- incsearch#go(<SID>config_easyfuzzymotion())
" noremap <silent><expr> z- incsearch#go(<SID>config_easyfuzzymotion())

map - <Plug>(incsearch-easymotion-/)
map z. <Plug>(incsearch-easymotion-?)
map zg- <Plug>(incsearch-easymotion-stay)
nmap s <Plug>(easymotion-overwin-f2)














