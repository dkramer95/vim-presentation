func! LoadDemos()
	let files = split(system("ls demos | grep .vim"), "\n")
	for file in files
		execute "tabnew demos/" . file
	endfor
endfunc

set mouse=a
inoremap kj <esc>

call LoadDemos()
