	.386
	include Irvine32.inc 
	include Macros.inc
	.model flat, stdcall
	.stack 4096
	ExitProcess PROTO, dwExitCode:  DWORD

	.data
			; define your variables here	
	.code

	Assembly PROC
				mWriteLn"ASCII Virtual-scan Virtual-key	Keyboard flags"
				
	
	LookForKey:
		mov eax,50
		call Delay

		call ReadKey
		jz	 LookForkey

		mShow al,h
		mShow ah,h
		mShow dx,h
		mShow ebx,hnn

		cmp		dx,VK_ESCAPE
		jne		LookForKey

		exit
	Assembly ENDP
	END Assembly