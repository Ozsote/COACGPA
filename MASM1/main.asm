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
		codesubject1 byte 8 DUP (?),0
		codesubject2 byte 8 DUP (?),0
		codesubject3 byte 8 DUP (?),0
		codesubject4 byte 8 DUP (?),0
		codesubject5 byte 8 DUP (?),0
		val		sdword 6 DUP(?),0
		val2	sdword 6 DUP(?),0
		total	sdword 6 DUP(?),0
		totalgpa dword ?
		totalcredit dword ?
		subjectcredit=3
		gpa		sdword ?
	; define your variables here	
	.code
			
	main PROC
			call crlf
			call crlf
			call crlf
			call crlf
			mwriteln"====================WELCOME TO==============================================="
			MWRITELN"====================CGPA CALCULATOR=========================================="
			MWRITELN"----------------------THE MAGNIFICO------------------------------------------"
			call crlf
			call crlf
			mwrite"                "
			mwriteln"Please enter your name >>student name here"
			mwrite"                "
			mreadstring string1
			call crlf
			call crlf
			call waitmsg
		l0:
			call clrscr
			mwriteln"Enter code/subject 1 > codesubject1"
			mreadstring codesubject1
			mwrite"Enter marks 1 > "
			call readint
			mov	ebx,0h		
			mov	[val+ebx],eax
			nop
			call	crlf
			mwriteln"Enter code/subject 2 > codesubject2"
			mreadstring codesubject2
			mwrite"Enter marks 2 > "
			call readint
			mov	ebx,4h		
			mov	[val+ebx],eax
			nop
			call	crlf
			mwriteln"Enter code/subject 3 > codesubject3"
			mreadstring codesubject3
			mwrite"Enter marks 3 > "
			call readint
			mov	ebx,8h		
			mov	[val+ebx],eax
			nop
			call	crlf
			mwriteln"Enter code/subject 4 > codesubject4"
			mreadstring codesubject4
			mwrite"Enter marks 4 > "
			call readint
			mov	ebx,12h		
			mov	[val+ebx],eax
			nop
			call	crlf
			mwriteln"Enter code/subject 5 > codesubject5"
			mreadstring codesubject5
			mwrite"Enter marks 5 > "
			call readint
			mov	ebx,16h		
			mov	[val+ebx],eax
			call clrscr
			mwriteln"Your result: "
			call crlf
			mwrite"Name : "
			mwritestring string1
			call crlf
			mwriteln"------------------------------------------------------------------------------"
			mwriteln"Subject		Marks			Grade			Points			TotalPoints"	
			mwriteln"--------       -------	               ------		        ------		        -----------"
			mwritestring	codesubject1
			mwritespace 10
			mov ecx,4
			mov	ebx,0h		
			mov	eax,[val+ebx]
			call writedec
			cmp eax,100
			jg error
			cmp eax,80
			jge Ae
			cmp eax,60
			jge Be
			cmp eax,40
			jge Ce
			cmp eax,20
			jge	De
			cmp	eax,0
			jge Ee
			jl error
		o1:
			call crlf
			mwritestring	codesubject2
			mwritespace 10
			mov ecx,3
			mov	ebx,4h		
			mov	eax,[val+ebx]
			call writedec
			cmp eax,100
			jg error
			cmp eax,80
			jge Ae
			cmp eax,60
			jge Be
			cmp eax,40
			jge Ce
			cmp eax,20
			jge	De
			cmp	eax,0
			jge Ee
			jl error
		o2:
			call crlf
			mwritestring	codesubject3
			mwritespace 10
			mov ecx,2
			mov	ebx,8h		
			mov	eax,[val+ebx]
			call writedec
			cmp eax,100
			jg error
			cmp eax,80
			jge Ae
			cmp eax,60
			jge Be
			cmp eax,40
			jge Ce
			cmp eax,20
			jge	De
			cmp	eax,0
			jge Ee
			jl error
			
		o3:
			call crlf
			mwritestring	codesubject4
			mwritespace 10
			mov ecx,1
			mov	ebx,12h		
			mov	eax,[val+ebx]
			call writedec
			cmp eax,100
			jg error
			cmp eax,80
			jge Ae
			cmp eax,60
			jge Be
			cmp eax,40
			jge Ce
			cmp eax,20
			jge	De
			cmp	eax,0
			jge Ee
			jl error
			call crlf
		
		o4:
			call	crlf
			mwritestring	codesubject5
			mwritespace 10
			mov ecx,0
			mov	ebx,16h		
			mov	eax,[val+ebx]
			call writedec
			cmp eax,100
			jg error
			cmp eax,80
			jge Ae
			cmp eax,60
			jge Be
			cmp eax,40
			jge Ce
			cmp eax,20
			jge	De
			cmp	eax,0
			jge Ee
			jl error
		
		l2:
			call crlf
			mwriteln"------------------------------------------------------------------------------"
			mwrite"Grand Total Subject : "
			mov eax,0h
			mov ebx,0h
			add eax,[total+ebx]
			mov	ebx,4h
			add eax,[total+ebx]
			mov	ebx,8h
			add eax,[total+ebx]
			mov	ebx,12h
			add eax,[total+ebx]
			mov	ebx,16h
			add eax,[total+ebx]
			mov totalgpa,eax
			call writedec
			call crlf
			mov eax,5
			mwrite"Total Credits : "
			mov ecx,subjectcredit
			mul ecx
			call writedec
			call crlf
			mov totalcredit,eax
			mwrite"GPA : "
			mov eax,totalgpa
			mov ecx,totalcredit
			div ecx
			mov gpa,eax
			call writedec
			call crlf
			mwrite"Status : "
			cmp eax,4
			je s1
			cmp eax,3
			je s2
			cmp eax,2
			je s3
			cmp eax,1
			jle s4
		s1:
			mwrite"Excellent"
			jmp exitprocess
		s2:
			mwrite"Good"
			jmp exitprocess
		s3:
			mwrite"Pass"
			jmp exitprocess
		s4:
			mwrite"Fail"
			jmp exitprocess
		g1:
			mov ebx,0
				mov [total+ebx],eax
			mov ebx,4h
				sub edi,1
				cmp ecx,4
				je o1
				cmp ecx,3
				je o2
				cmp ecx,2
				je o3
				cmp ecx,1
				je o4
				jne l2
		g2:
			mov ebx,4h
				mov [total+ebx],eax
			mov ebx,8h
				sub edi,1
				cmp ecx,4
				je o1
				cmp ecx,3
				je o2
				cmp ecx,2
				je o3
				cmp ecx,1
				je o4
				jne l2
		g3:
			mov ebx,8h
				mov [total+ebx],eax
			mov ebx,12h
				sub edi,1
				cmp ecx,4
				je o1
				cmp ecx,3
				je o2
				cmp ecx,2
				je o3
				cmp ecx,1
				je o4
				jne l2
		g4:
			mov ebx,12h
				mov [total+ebx],eax
			mov ebx,16h
				sub edi,1
				cmp ecx,4
				je o1
				cmp ecx,3
				je o2
				cmp ecx,2
				je o3
				cmp ecx,1
				je o4
				jne l2
		g5:
			mov ebx,16h
				mov [total+ebx],eax
				cmp ecx,4
				je o1
				cmp ecx,3
				je o2
				cmp ecx,2
				je o3
				cmp ecx,1
				je o4
				jne l2
		j1:
			jmp o1
		Ae:
				mwritespace 20
				mwrite"A"
				mwritespace 25
				mov eax,4h
				call writedec
				mwritespace 25
				mov edx,3
				mul edx
				call writedec
			cmp ebx,0h
				je e0
			cmp ebx,4h
				je e1
			cmp ebx,8h
				je e2
			cmp ebx,12h
				je e3
			cmp ebx,16h
				je e4
			e0:
				mov edi,5
				cmp edi,5
				je g1
			e1:
				cmp edi,4
				je g2
			e2:
				cmp edi,3
				je g3
			e3:
				cmp edi,2
				je g4
			e4:
				cmp edi,1
				je g5
				
				
				
			Be:
				mwritespace 20
				mwrite"B"
				mwritespace 25
				mov eax,3
				call writedec
				mwritespace 25
				mov edx,3
				mul edx
				call writedec
			cmp ebx,0h
				je r0
			cmp ebx,4h
				je r1
			cmp ebx,8h
				je r2
			cmp ebx,12h
				je r3
			cmp ebx,15h
				je r4
			r0:
				mov edi,5
				cmp edi,5
				je g1
			r1:
				cmp edi,4
				je g2
			r2:
				cmp edi,3
				je g3
			r3:
				cmp edi,2
				je g4
			r4:
				cmp edi,1
				je g5
				
			Ce:
				mwritespace 20
				mwrite"C"
				mwritespace 25
				mov eax,2
				call writedec
				mwritespace 25
				mov edx,3
				mul edx
				call writedec
			cmp ebx,0h
				je r0
			cmp ebx,4h
				je r1
			cmp ebx,8h
				je r2
			cmp ebx,12h
				je r3
			cmp ebx,15h
				je r4
			
				
			De:
				mwritespace 20
				mwrite"D"
				mwritespace 25
				mov eax,1
				call writedec
				mwritespace 25
				mov edx,3
				mul edx
				call writedec
			cmp ebx,0h
				je e0
			cmp ebx,4h
				je e1
			cmp ebx,8h
				je e2
			cmp ebx,12h
				je e3
			cmp ebx,15h
				je e4
			
			Ee:
				mwritespace 20
				mwrite"E"
				mwritespace 25
				mov eax,0
				call writedec
				mwritespace 25
				mov edx,3
				mul edx
				call writedec
			cmp ebx,0h
				je e0
			cmp ebx,4h
				je e1
			cmp ebx,8h
				je e2
			cmp ebx,12h
				je e3
			cmp ebx,15h
				je e4
			
			error:
				mwrite"<<Invalid>>"
				jmp l0


			

			; WRITE YOUR ASSEMBLY CODE HERE

			INVOKE	 ExitProcess, 0
			main ENDP
			END main