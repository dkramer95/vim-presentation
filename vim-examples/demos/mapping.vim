func! TerminalTab()
	tabnew
	terminal
	only
endfunc

func! ResizeHoriz(amt)
	let width = winwidth(winnr())
	let newWidth = width + a:amt
	call feedkeys("\<C-w>". newWidth . "|")
endfunc

func! ResizeVert(amt)
	let height = winheight(winnr())
	let newHeight = height + a:amt
	call feedkeys("\<C-w>". newHeight . "_")
endfunc

" Escape to normal mode easier
inoremap kj <esc>

" Pneumonic tt - terminal-tab
nnoremap tt :call TerminalTab()<CR>

" Pneumonic tn - tab new
nnoremap tn :tabnew<CR>

" Pneumonic tn - tab new
nnoremap tc :tabclose<CR>

" Split window easier
nnoremap \ :vs<CR>
nnoremap - :sp<CR>

" Resize windows easier

" Prepend <silent> to suppress normal output
nnoremap <silent> <Right> :call ResizeHoriz(5)<CR>
nnoremap <silent> <Left> :call ResizeHoriz(-5)<CR>

nnoremap <Up> :call ResizeVert(5)<CR>
nnoremap <Down> :call ResizeVert(-5)<CR>

" Make each window equal size
nnoremap == <C-w>=
