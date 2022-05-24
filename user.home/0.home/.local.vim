"--<custom borrowing from spf13vim .vimrc
" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        "if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
        "    inoremap <silent> <C-[>OC <RIGHT>
        "endif
    " }
" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
"    }

" General {

    " if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    " endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif
" }
"-->custom borrowing from spf13vim .vimrc

" copy&paste for windows {
    if WINDOWS()
        so $VIMRUNTIME/mswin.vim
    endif
" }

" mswin.vim guid mode unmap the promptfind <C-F>       * has("gui_running") ? ":promptfind\<CR>" : "/ {
    if WINDOWS()
        unmap <C-F>
    endif
" }

" Managing projects https://github.com/SpaceVim/SpaceVim/blob/master/autoload/SpaceVim/plugins/projectmanager.vim
call add(g:spacevim_project_rooter_patterns, 'build.gradle')
call add(g:spacevim_project_rooter_patterns, 'build.gradle.kts')
call add(g:spacevim_project_rooter_patterns, 'go.mod')
call add(g:spacevim_project_rooter_patterns, 'main.go')
call add(g:spacevim_project_rooter_patterns, 'Dockerfile')
call add(g:spacevim_project_rooter_patterns, 'docker-compose.yaml')
call add(g:spacevim_project_rooter_patterns, 'docker-compose.yml')
call add(g:spacevim_project_rooter_patterns, 'README.md')



"tagbar {
    "path problems. it's not work.
    if WINDOWS()
    "    let g:tagbar_ctags_bin = "C:/ProgramData/chocolatey/bin/ctags.exe"
    endif
" }

"ctrlp max file {
    let g:ctrlp_max_files=0
    let g:ctrlp_max_depth=40
    "if you have install ag, the g:ctrlp_custom_ignore will not work
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|idea|settings|bin|tmp|gradle)$|target|node_modules|te?mp$|logs?$|public$|dist$',
      \ 'file': '\v\.(exe|so|dll|ttf|png|gif|jpe?g|bpm|iml|patch|DS_Store|Trashes|Spotlight-V100|project|metadata|dat|gz|db|classpath|sublime-workspace|class|jar)$|\-rplugin\~',
      \ 'link': 'some_bad_symbolic_links',
      \ }
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_lazy_update = 1
" }

" auto change dir {
    "vimfiler doesn't support vim autochdir"
    "set autochdir
    "some plugins may not work correctly set below
    "http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
" }

let g:spacevim_wildignore
      \ = '*/tmp/*,*.so,*.swp,*.zip,*.class,tags,*.jpg,
      \*.ttf,*.TTF,*.png,*/target/*,
      \.git,.svn,.hg,.DS_Store,*.svg,
      \*.pyc,*.jar'

" }}}


" support java class file when decompiled code { 
    " below code to remove .class(java class files) on ignore list
    " let g:spacevim_wildignore = substitute(g:spacevim_wildignore, ',\*.class', '', 'g')
    "let g:vimfiler_ignore_pattern = [
    "  \ '^\.git$',
    "  \ '^\.DS_Store$',
    "  \ '^\.init\.vim-rplugin\~$',
    "  \ '^\.netrwhist$',
    "  \ '\.class$'
    "  \]
" }


" include spacevim plugin {
    "['fatih/vim-go',               { 'on_ft' : 'go'}]
    let g:spacevim_custom_plugins = [
    \ ['vim-scripts/DrawIt.git'],
    \ ['adelarsq/vim-matchit'],
	\ ['vim-scripts/CmdlineComplete.git'],
	\ ['claco/jasmine.vim.git'],
	\ ['othree/javascript-libraries-syntax.vim.git'],
	\ ['jeroenbourgois/vim-actionscript.git'],
	\ ['cespare/mxml.vim.git'],
	\ ['moll/vim-node'],
	\ ['vim-scripts/closetag.vim.git'],
	\ ['ap/vim-css-color.git'],
	\ ['Quramy/tsuquyomi.git'],
	\ ['leafgarland/typescript-vim'],
	\ ['Quramy/vim-js-pretty-template'],
	\ ['jason0x43/vim-js-indent'],
	\ ['Quramy/vim-dtsm'],
	\ ['mhartington/vim-typings'],
	\ ['salsifis/vim-transpose']
    \ ]
" }

" exclude spacevim plugin {
    let g:dotspacevim_excluded_plugins  = []
" }

" java decompiler {
    "download jad http://www.javadecompilers.com/jad
    au BufReadCmd .class setl readonly nomodified | %!jad -p <afile>
    au BufReadCmd .class setl ft=java
"}

" ctags Settings {
    set tags=./tags;,tags; "tags file in the directory of the current file as well as in the working directory, and up, and up, and
" }

" disable error on xml: MatchTagAlways
" Error detected while processing function <SNR>246_HighlightEnclosingTagsIfPossible[12]..<SNR>246_HighlightEnclosingTags[1]..<SNR>246_GetEnclosingTagLocations:
" disable spacevim {
let g:spacevim_disabled_plugins=[
    \ ['MatchTagAlways'],
    \ ]
" }

" set the guifont {
if WINDOWS()
    let g:spacevim_guifont = 'Consolas:h12'
endif 

if !empty(g:spacevim_guifont)
    exe 'set guifont=' . g:spacevim_guifont
endif
"} 

" set tabsize by file type{
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
"}


" set default vim path {
"if isdirectory(expand("~/Documents"))
"    lcd ~/Documents
"endif
"}

" override mapping F3 key for OpenVimfilerBufferDir {"
silent function! OpenVimfilerBufferDir() abort
    if bufnr('vimfiler') == -1
        VimFilerBufferDir
        " AirlineRefresh
        wincmd p
        if &filetype !=# 'startify'
            IndentLinesToggle
            IndentLinesToggle
        endif
        wincmd p
    else
        VimFilerBufferDir
        " AirlineRefresh
    endif
endfunction

"VimEnter: After doing all the startup stuff, including loading .vimrc files, executing the "-c cmd" arguments, creating all windows and loading the buffers in them.
autocmd VimEnter * noremap <silent> <F3> :call OpenVimfilerBufferDir()<CR>
"}

" Use local custom vimrc if available {
    "this should go end of line"
    if filereadable(expand("~/.local.custom.vim"))
        source ~/.local.custom.vim
    endif
"}


"prevent shada files from being generated or read in Neovim {
"alias nvim='nvim -i NONE'
"}

" virtualenv for python2 and python3 {
"    if WINDOWS()
"        let g:python_host_prog="C:/Python27/python.exe"
"        let g:python3_host_prog="C:/Python38/python.exe"
"        let g:ycm_path_to_python_interpreter="C:/Python38/python.exe"
"    endif
"    if OSX()
"        let g:python_host_prog=$HOME . "/virtualenvs/neovim2/bin/python"
"        let g:python3_host_prog=$HOME . "/virtualenvs/neovim3/bin/python"
"        let g:ycm_path_to_python_interpreter=$HOME . "/virtualenvs/neovim3/bin/python"
"    endif
"}

" fix gP 
" { fix gP paste problem with Commands starting with g
" C:\Users\user\AppData\Local\nvim\autoload\SpaceVim\mapping\g.vim
    "let g:_spacevim_mappings_g['P'] = ['call feedkeys("gP", "n")', 'paste the text [from register x]']
    nnoremap gP gP
"}

" { disable annoying autocompletion when press enter or tab keys, use <C-n>, <C-p>
"http://spacevim.org/layers/autocomplete/
call SpaceVim#layers#load('autocomplete', {
        \ 'auto-completion-return-key-behavior' : 'nil',
        \ 'auto-completion-tab-key-behavior' : 'nil',
        \ 'auto-completion-complete-with-key-sequence' : 'nil',
        \ 'auto-completion-complete-with-key-sequence-delay' : 0.1,
        \ })
"}

" { disable vimfiler(file manger) open panel right side when start vim
    let g:spacevim_enable_vimfiler_welcome = 0
"}

" { limit history for neoyank
    let g:neoyank#limit = 30
"}

" { denite setup
" reference from $HOME/.SpaceVim/config/plugins/denite.vim and added --no-ignore for search all
" denite command
" added directedly on $HOME/.SpaceVim/config/plugins/denite.vim
" ex: ['rg', '--hidden', '--no-ignore', '--files', '--glob', '!.git', '--glob', '']
"}

