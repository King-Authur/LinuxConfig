""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This init.vim file is based on default configuration of spf13/spf13-vim, and
" highly optimized for my daily development requirements.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"_______________________________________________________________________________
" Configurations for Vundle, BEGIN.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pre-requests.
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.config/nvim/bundle/Vundle.vim

" Plugins list begins.
call vundle#begin('~/.config/nvim/bundle')

Plugin 'altercation/vim-colors-solarized'

" Let Vundle manages Vundle and other dependencies, required.
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Visual optimization.
Plugin 'morhetz/gruvbox'                  " GruvBox scheme.
Plugin 'bling/vim-bufferline'             " Add buffer info to status bar.
Plugin 'vim-airline/vim-airline'          " Vim Airline status bar.
Plugin 'vim-airline/vim-airline-themes'   " Themes for Airline.
Plugin 'osyo-manga/vim-over'              " Real-time high-light match when
                                          " typing substitution command.
Plugin 'mhinz/vim-signify'                " Version control info high-light.
Plugin 'rhysd/conflict-marker.vim'        " High-light git conflict markers.
Plugin 'luochen1990/rainbow'              " Colorize brackets.
Plugin 'iamcco/markdown-preview.nvim'     " Preview of Markdown etc.
Plugin 'vim-scripts/DoxyGen-Syntax'       " Doxygen comment enhancement.

Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Functionality enhancement.
Plugin 'jiangmiao/auto-pairs'         " Brackets and quotes auto complete.
Plugin 'ctrlpvim/ctrlp.vim'           " Ctrl+P to find files etc.
Plugin 'tacahiroy/ctrlp-funky'        " Enhancement for ctrlp.
Plugin 'easymotion/vim-easymotion'    " Fast cursor movements.
Plugin 'vim-scripts/restore_view.vim' " Restoring cursor position after restart.
Plugin 'tpope/vim-fugitive'           " Git tool.
Plugin 'junegunn/vim-easy-align'      " Fast alignment.

" AutoComplete.
Plugin 'zxqfl/tabnine-vim'       " TabNine, based on YouCompleteMe, blur match.
Plugin 'honza/vim-snippets'      " Pre-defined snippets.
Plugin 'SirVer/ultisnips'        " Snippets.
Plugin 'rhysd/vim-clang-format'  " Clang-formatting.

" Syntax checker.
Plugin 'w0rp/ale'  " ALE linter framework.

" Git
Plugin 'rhysd/git-messenger.vim'

" Copy
Plugin 'mg979/vim-visual-multi'

" Language specific plugins.
" Text writing.
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-wordy'
Plugin 'godlygeek/tabular'           " Quick formatting tabular.
Plugin 'tpope/vim-markdown'          " Markdown support.

" Python
Plugin 'yssource/python.vim' " Basic config., incl. high-light etc.
Plugin 'pythoncomplete'      " Semantic enhancement.
Plugin 'nvie/vim-flake8'     " Static analytics.
Plugin 'python_match.vim'    " Enhance if-else's % motion in Python.

" Javascript
Plugin 'pangloss/vim-javascript' " Basic config. for JS.
Plugin 'briancollins/vim-jst'    " High-light and indenting for JST/EJS.
Plugin 'elzr/vim-json'           " JSON support.

" Golang
Plugin 'fatih/vim-go'  " Golang.

" Rustlang
Plugin 'rust-lang/rust.vim'  " Rustlang.

" Scala
Plugin 'derekwyatt/vim-scala'  " Scala.

" Plugins list ends.
call vundle#end()
filetype plugin indent on
"_______________________________________________________________________________
" Configurations for Vundle, END.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"_______________________________________________________________________________
" General non-plugin configurations, BEGIN.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual configurations.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                    " Enable syntax high-lighting.
set background=dark              " Assume dark background.

" Set color scheme.
if filereadable(expand("~/.config/nvim/colors/gruvbox.vim"))
     colorscheme gruvbox
endif

set colorcolumn=100        " Set visual ruler.
set cursorline             " High-light line where cursor locates.
set cursorcolumn           " High-light column where cursor locates.
highlight clear LineNr     " Clear background of line number column.
highlight clear SignColumn " Clear background of sign column.
set showmode               " Always display current mode.
set number                 " Enable line number.
set showmatch              " Show matched brackets.
set linespace=0            " No extra spaces between rows.
set hlsearch               " High-light search terms.
set winminheight=0         " Windows can be 0 line high.
set list                   " Make whitespace visible.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Show problematic whitespace.

" Formatting configurations.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start " Backspace for dummies.
set autoindent                 " Enable automatically indenting.
set shiftwidth=4               " Set tab's width to 4.
set tabstop=4                  " Indent size 4.
set softtabstop=4              " Backspace is able to delete indent.
set expandtab                  " Convert tab to space.
set nojoinspaces               " Prevent inserting 2 spaces when joining lines.
set textwidth=100              " Limit text width to 100 characters width.

" Language-oriented formatting configurations.
autocmd FileType go autocmd BufWritePre <buffer> GoFmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2

" Workaround vim-commentary for Haskell.
autocmd FileType haskell setlocal commentstring=--\ %s

" Workaround broken color highlighting in Haskell.
autocmd FileType haskell,rust setlocal nospell


" Interactive configurations.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                    " Automatically enable mouse usage.
set mousehide                  " Hide mouse cursor while typing.
set shortmess+=filmnrxoOtT     " Avoid 'hit enter'.
set virtualedit=onemore        " Allow for cursor beyond last character.
set hidden                     " Allow buffer switch without saving.
set splitright                 " Put new vsplit windows to the right of current.
set splitbelow                 " Put new split windows to the bottom of current.
set incsearch                  " Find as you type search.
set ignorecase                 " Case insensitive search.
set smartcase                  " Case sensitive when uc present.
set scrolljump=5               " Lines to scroll when cursor leaves screen.
set scrolloff=3                " Minimum lines to keep above and below cursor.
set foldenable                 " Auto fold code.
set foldmethod=manual          " fold by hand.
set pastetoggle=<F10>          " Use <F10> to enable paste mode.
set wildmenu                   " Show list instead of just completing.
set wildmode=list:longest,full " Command <Tab> completion, list matches, then
                               " longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too.
set encoding=utf-8


" Key mapping configurations.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch leader key to ,.
let mapleader = ','

" Windows switching.
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Stupid shift key fixess
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" File content configurations.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8      " Set encoding to UTF-8.
filetype plugin indent on " Automatically detect file types.
set spell                 " Enable spell checking.
set iskeyword-=.           " Treat '.' as the end of a word.
set iskeyword-=#           " Treat '#' as the end of a word.
set iskeyword-=-           " Treat '-' as the end of a word.


" Working environment configurations.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically change working directory to opened buffer.
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
set history=1000           " Enlarge history buffer.
set backup                 " Enable back up.
if has("persistent_undo")  " Check if persistent undo is available.
    set undofile           " Enable undo.
    set undolevels=1000    " Max. # of changes that can be undone.
    set undoreload=10000   " Max. # lines to save for undo on a buffer reload.
endif

"_______________________________________________________________________________
" General non-plugin configurations, END.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"_______________________________________________________________________________
" Configurations for all plugins, BEGIN.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nerdtree
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 20 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=1     "显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
nnoremap <F12> :GoDef<CR>
nnoremap <S-F12> :GoRef<CR>

" ALE
if isdirectory(expand("~/.config/nvim/bundle/ale/"))
    " Set linter.
    let g:ale_linters = {
        \ 'c': ['gcc', 'cppcheck', 'cpplint'],
        \ 'cpp': ['g\+\+', 'cppcheck', 'cpplint'],
        \ 'python': ['flake8'],
        \ 'proto': ['proto-gen-lint'],
        \ 'go': ['gofmt', 'golint', 'go vet'],
        \ 'sh': ['shellcheck', 'shfmt'],
        \ 'scala': ['fsc', 'scalac', 'scalafmt'],
        \ }
    " Set fixer.
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}
    " Only run linters named in ale_linters settings.
    let g:ale_linters_explicit = 1
    " Shutdown ALE's completion.
    let g:ale_completion_enabled = 0
    " Automatically fixing.
    let g:ale_fix_on_save = 1
    " Keep sign gutter on.
    let g:ale_sign_column_always = 1
endif


" Plain text
augroup textobj_sentence
    autocmd!
    autocmd FileType markdown call textobj#sentence#init()
    autocmd FileType textile call textobj#sentence#init()
    autocmd FileType text call textobj#sentence#init()
augroup END
augroup textobj_quote
    autocmd!
    autocmd FileType markdown call textobj#quote#init()
    autocmd FileType textile call textobj#quote#init()
    autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

" Vim-over
let g:over#command_line#substitute#replace_pattern_visually = 1

" Ctags
set tags=./tags;/,~/.config/nvim/cache/vimtags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" use F5 to regenerate tag file and update taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

" Git tools
if isdirectory(expand("~/.config/nvim/bundle/vim-fugitive/"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>ga :Gwrite<CR>
endif

" Git Messenger
nnoremap <leader>gm :GitMessenger<CR>

" Ctrlp
if isdirectory(expand("~/.config/nvim/bundle/ctrlp.vim/"))
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc\|\.a$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
        \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': s:ctrlp_fallback
        \ }

    if isdirectory(expand("~/.config/nvim/bundle/ctrlp-funky/"))
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        "funky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
    endif
endif

" Easy alignment.
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Doxygen highlight
let g:load_doxygen_syntax=1

" Rainbow
if isdirectory(expand("~/.config/nvim/bundle/rainbow/"))
    let g:rainbow_active = 1
endif

" Airline
if isdirectory(expand("~/.config/nvim/bundle/vim-airline-themes/"))
    if !exists('g:airline_theme')
        let g:airline_theme = 'gruvbox'
    endif
    if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
    else
        let g:airline_left_sep='>'  " Down-grade to ASCII sign.
        let g:airline_right_sep='<' " Down-grade to ASCII sign.
    endif
    " Show ALE linter messages.
    let g:airline#extensions#ale#enabled = 1
endif

" Snippets
" Rule directory.
"let g:UltiSnipsSnippetsDir = [$HOME . '/.config/V :PluginInstalli :PluginInstallmUltiSnips']
let g:UltiSnipsSnippetDirectories = [$HOME . '/.config/VimUltiSnips']
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

" Split window instead of directly open the configuration file.
let g:UltiSnipsEditSplit="vertical"

" Clang formatting.
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1

" Golang formatting.
let g:go_fmt_autosave=1

"_______________________________________________________________________________
" Configurations for all plugins, END.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"_______________________________________________________________________________
" Functions, BEGIN.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InitializeDirectories()
    let parent = $HOME
    let dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = parent . '/.config/nvim/cache/'

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

"_______________________________________________________________________________
" Functions, END.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
