" Insert ip here
let ip_addr = ""

if !exists("g:kramer_channel") || ch_status(g:kramer_channel) != "open"
	echo "Opening channel"
	let g:kramer_channel = ch_open(ip_addr, { "waittime": "1000" })
endif

func! SendData(data)
	call ch_sendraw(g:kramer_channel, a:data . "\n")
endfunc
