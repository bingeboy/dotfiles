"Delete trailing whitespace
func! DeleteTrailingWS()
      exe "normal mz"
        %s/\s\+$//ge
          exe "normal `z"
      endfunc
      autocmd BufWrite *.js :call DeleteTrailingWS()
      autocmd BufWrite *.scss :call DeleteTrailingWS()
      autocmd BufWrite *.css:call DeleteTrailingWS()



