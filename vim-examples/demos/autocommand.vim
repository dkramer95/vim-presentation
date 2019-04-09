" Reduce visibility of window we leave
func! OnWinLeave()
	if exists("&colorcolumn")
		let width = winwidth(winnr())
		let cols = ""
		for j in range(1, width)
			let cols = cols .j . ","
			redraw
		endfor
		" remove trailing comma
		let cols = strpart(cols, 0, strlen(cols) - 1)
		let &colorcolumn="" . cols
	endif
	redraw
endfunc

" Increase visibility on window we enter
func! OnWinEnter()
	if !exists("b:syntax")
		let b:syntax = &syntax
	else
		let b:syntax = &filetype
	endif
	execute "setlocal syntax=" . b:syntax
	let &colorcolumn=0
endfunc

" Style we will use
highlight ColorColumn ctermbg=black ctermfg=darkgrey

augroup kramer
	autocmd!
	autocmd WinLeave * call OnWinLeave()
	autocmd BufEnter,WinEnter * call OnWinEnter()
augroup END
