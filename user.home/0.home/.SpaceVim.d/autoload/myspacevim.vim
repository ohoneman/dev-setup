function! myspacevim#before() abort
  if filereadable(expand("~/.local.vim"))
    source ~/.local.vim
  endif
endfunction

function! myspacevim#after() abort
  if filereadable(expand("~/.local.after.vim"))
    source ~/.local.after.vim
  endif
endfunction