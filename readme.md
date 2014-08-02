Vimux-interp
============

This is add-on for [Vimux](https://github.com/benmills/vimux) allowing you to 
send commands from buffer right into interpreter.

##Description
-----------

With vimux-interp you can send current line or linewise selection
to the interpreter of your choise.
To set interpreter, set variable `g:vimux_interp_exec` accordingly.
Default is `"pry"`.

List of functions:

* Launch interpreter
* Run Command


##Example mappings
-----------

I'm using pry, so `<leader>p` is my prefix.
    
    nnoremap <leader>pl :call VimuxInterpLaunch()<CR>
    nnoremap <leader>pe :call VimuxInterpRunCommand()<CR>
    vnoremap <leader>pe :call VimuxInterpRunVisual()<CR>
    noremap <leader>pi :call VimuxInterpJump()<CR>
    noremap  <leader>pc :call VimuxCloseRunner()<CR>
