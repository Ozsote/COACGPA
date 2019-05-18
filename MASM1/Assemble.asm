	.386
	include Irvine32.inc 
	.model flat, stdcall
	.stack 4096
	ExitProcess PROTO, dwExitCode:  DWORD

	PBYTE  TYPEDEF PTR BYTE		; pointer to bytes
PWORD  TYPEDEF PTR WORD		; pointer to words
PDWORD TYPEDEF PTR DWORD
	.data

			arrayB BYTE  10h,20h,30h
			arrayW WORD  1,2,3
			arrayD DWORD 4,5,6

; Create some pointer variables.
			ptr1 PBYTE  arrayB
			ptr2 PWORD  arrayW
			ptr3 PDWORD arrayD
	; define your variables here	
	.code

	Assemble PROC
			mov esi,ptr1
	mov al,[esi]		; 10h
	call writeint
	mov esi,ptr2
	mov ax,[esi]
	call writeint; 1
	mov esi,ptr3
	mov eax,[esi]	; WRITE YOUR ASSEMBLY CODE HERE
	call writeint
			INVOKE	 ExitProcess, 0
			Assemble ENDP
			END Assemble