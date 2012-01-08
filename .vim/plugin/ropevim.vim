if(match(hostname(), 'dev20') >= 0)
	function! LoadRope()
	python << EOF
import ropevim
EOF
	endfunction

	call LoadRope()
endif
