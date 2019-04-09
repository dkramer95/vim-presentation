func! ColorColumnDemo()
	highlight ColorColumn ctermbg=red ctermfg=darkgrey
	let x = 0
	let xVel = 1
	let width = winwidth(winnr())

	while 1 == 1
		sleep 10m
		let &colorcolumn=x
		execute "highlight ColorColumn ctermbg=" . x . " ctermfg=" . x
		let x += xVel
		redraw
		if ((x + 1) >= width || (x + xVel) < 0)
			let xVel = xVel * -1
		endif
	endwhile
endfunc

func! AnimateText(speed)
	"Yank text in current buffer into register @c
	normal! GVgg"cyy

	try
		"Create new buffer to contain yanked text from register @c
		let tempBufName = "animation"

		execute ":new " . tempBufName .
					\" | set syntax=" . &syntax .
					\" | b " . tempBufName .
					\" | setlocal noswapfile
					\  | setlocal buftype=nowrite"

		"Convert text to uppercase
		let yankedText = @c
		let textLength = strlen(yankedText)

		let j = 0
		redraw

		"Draw each char, one at a time
		while (j < textLength)
			let char = strpart(yankedText, j, 1)
			let lineNum = getcurpos()[1]
			execute "sleep" . a:speed . "m"

			"Check to see if char is new line
			if (char == '$')
				let lineNum += 1
				normal! o
			else
				let @d = char
				normal! yy"dp
			endif

			redraw
			let j += 1
		endwhile

		"Show for a while
		sleep 3000m
	catch /^Vim:Interrupt$/
		echo "Animation Caught Interrupt"
	finally
		"Ensure we always clean up contents
		execute ":bdelete! " . tempBufName
	endtry
endfunc
