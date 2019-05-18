	.386
	include Irvine32.inc
	include macros.inc
	.model flat, stdcall
	.stack 4096
	ExitProcess PROTO, dwExitCode:  DWORD

	.data
				looping dword ?
				string1 byte 100 dup (?)
				val dword 1,2,3,4,5
				boom dword ?; define your variables here	
	.code

	Assemblylala PROC
			mwriteln"How many subject do you take in this semester?"
			call readdec
			mov looping, eax
			mov eax, 0
			mov ecx, 0
		ln:
			cmp ecx,looping 
			mov boom , ecx
			jge l0
			mwrite"Enter code subject "
			mov eax,boom
			add eax,1
			call writedec
			call crlf
			mov ebx ,0
			mreadstring string1
			mwritestring string1
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			call readdec
			mov [val+ebx],eax
			add ebx,8
			add ecx,1
			jmp ln
		l0:
			mwrite"Finished"
			

			INVOKE	 ExitProcess, 0
			Assemblylala ENDP
			END Assemblylala