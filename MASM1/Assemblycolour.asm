	.386
	include Irvine32.inc 
	.model flat, stdcall
	.stack 4096
	ExitProcess PROTO, dwExitCode: DWORD

	.data
				message byte "Would you like to open the file? ",0 
				la byte "Done",0
				answer dword ? 
				BUFSIZE = 5000
				buffer BYTE BUFSIZE DUP(?)
				bytesWritten DWORD ?; define your variables here	
	.code

	Assemblycolour PROC
			
			call readfloat
			call writefloat
			call crlf
			mov eax, red 
			call settextcolor
			call readfloat
			call writefloat
			call crlf
			mov eax,  + (black*16)
			call settextcolor
			; WRITE YOUR ASSEMBLY CODE HERE

			INVOKE	 ExitProcess, 0
			Assemblycolour ENDP
			END Assemblycolour
	Lala PROC
		
	Lala ENDP
	END Lala
