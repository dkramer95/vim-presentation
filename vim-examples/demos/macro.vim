func! MacroDemo()
	set splitright
	tabnew
	e demos/routes.txt
	vs demos/test.json
	let yankMacro = "0\"ayt,f,w\"byt,f,w\"cyt,f,w\"dyt,f,w\"eyt,f,w\"fyt,f,w\"gyt,f,w\"hyt,f,w\"iy$" 

	let pasteMacro = "\<C-w>lG?}\<CR>V%y%a,\<CR>\<ESC>pkddj0f:f\"ci\"\<C-r>a\<ESC>j0f:f\"ci\"\<C-r>b\<ESC>j0f:f\"ci\"\<C-r>c\<ESC>j0f:f\"ci\"\<C-r>d\<ESC>j0f:f\"ci\"\<C-r>e\<ESC>j0f:f\"ci\"\<C-r>f\<ESC>j0f:f\"ci\"\<C-r>g\<ESC>j0f:f\"ci\"\<C-r>h\<ESC>j0f:f\"ci\"\<C-r>i\<ESC>\<C-w>hj"

	let macro = yankMacro . pasteMacro
	let @z = macro
endfunc

call MacroDemo()
