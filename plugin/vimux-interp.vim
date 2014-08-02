let g:vimux_interp_exec = "pry"

function! _VimuxFindOutCommand()
  let pane_id = _VimuxNearestPaneIndex()
  if pane_id > 0
    return system('tmux display-message -t '.pane_id.' -p "#{=4:pane_current_command}"')
  else
    return "nothing"
  endif
endfunction

function! _VimuxInterpHasRunning()
  return 0 == match(_VimuxFindOutCommand(),g:vimux_interp_exec)
endfunction

function! _VimuxInterpEnsureRunning()
  if _VimuxInterpHasRunning() == 0
    if 0 == match(_VimuxFindOutCommand(),'sh\|bash\|zsh\|fish')
      call sleep 1
      echom "running pry"
    else 
      call _VimuxOpenPane()
    endif
    call VimuxInterpLaunch()
  endif
endfunction

function! VimuxInterpRunVisual() range
  call _VimuxInterpEnsureRunning()
  let cmds = escape(join(getline("'<","'>"),";"),'`')
  call VimuxRunCommand(cmds)
endfunction

function! VimuxInterpRunCommand()
  call _VimuxInterpEnsureRunning()
  call VimuxRunCommand(getline("."))
endfunction

function! VimuxInterpLaunch()
    call VimuxRunCommand("clear; ".g:vimux_interp_exec)
endfunction

function!  VimuxInterpJump()
  call system("tmux last-pane")
endfunction
