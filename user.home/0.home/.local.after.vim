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

" unmap the <Tab> and <C-I> , get back original newer cursor position in jump list
unmap <Tab>

" unmap the <C-X> which spacevim mapped to switch buffer (<C-W> x)
if WINDOWS() 
	unmap <C-X>
endif

" unmap gQ disable for switch to Ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" ctrlp include ignored files, override user command"
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --hidden --no-ignore --files -g "" '
        \ . join(SpaceVim#util#Generate_ignore(get(g:, 'spacevim_wildignore', ''),'rg', SpaceVim#api#import('system').isWindows ? 0 : 1))
endif
