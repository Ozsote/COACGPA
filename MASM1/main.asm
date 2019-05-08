	.386
	include Irvine32.inc 
	include macros.inc
	.model flat, stdcall
	.stack 4096
	ExitProcess PROTO, dwExitCode:  DWORD
	;Name : Tee Jun Joe
	;No. Matric : A18CS0263
	;Group Project : 4-B
	.data
		string1 byte 50 DUP (?),0
		codesubject1 byte 50 DUP (?),0
		codesubject2 byte 50 DUP (?),0
		codesubject3 byte 50 DUP (?),0
		codesubject4 byte 50 DUP (?),0
		codesubject5 byte 50 DUP (?),0
		val		sdword 5,?
		subjectcredit=3
	; define your variables here	
	.code
			
	main PROC
			mwriteln"====================WELCOME TO==============================================="
			MWRITELN"====================CGPA CALCULATOR=========================================="
			MWRITELN"----------------------THE MAGNIFICO------------------------------------------"
			call crlf
			call crlf
			mwrite"                "
			mwriteln"Please enter your name >>student name here"
			mwrite"                "
			mreadstring string1
			mwriteln"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			mwriteln"Enter code/subject 1 > codesubject1"
			mreadstring codesubject1
			call	crlf
			mwrite"Enter marks 1 >"
			call readint
			mov	ebx,0h		
			mov	[val+ebx],eax
			nop
			mwriteln"Enter code/subject 2 > codesubject2"
			mreadstring codesubject2
			call crlf
			mwrite"Enter marks 2 >"
			call readint
			mov	ebx,4h		
			mov	[val+ebx],eax
			nop
			mwriteln"Enter code/subject 3 > codesubject3"
			mreadstring codesubject3
			call crlf
			mwrite"Enter marks 3 >"
			call readint
			mov	ebx,8h		
			mov	[val+ebx],eax
			nop
			mwriteln"Enter code/subject 4 > codesubject4"
			mreadstring codesubject4
			call crlf
			mwrite"Enter marks 4 >"
			call readint
			mov	ebx,12h		
			mov	[val+ebx],eax
			nop
			mwriteln"Enter code/subject 5 > codesubject5"
			mreadstring codesubject5
			call crlf
			mwrite"Enter marks 5 >"
			call readint
			mov	ebx,16h		
			mov	[val+ebx],eax
			

			; WRITE YOUR ASSEMBLY CODE HERE

			INVOKE	 ExitProcess, 0
			main ENDP
			END main