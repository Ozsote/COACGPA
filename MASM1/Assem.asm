	.386
	include Irvine32.inc 
	include macros.inc
	
	.stack 4096
	ExitProcess PROTO, dwExitCode:  DWORD

	.data
		str1 byte 50 DUP (?),0
		codesubject1 byte 1 dup("NO  CODE"),0
		codesubject2 byte 1 dup("NO  CODE"),0
		codesubject3 byte 1 dup("NO  CODE"),0
		codesubject4 byte 1 dup("NO  CODE"),0
		codesubject5 byte 1 dup("NO  CODE"),0
		codesubject6 byte 1 dup("NO  CODE"),0
		codesubject7 byte 1 dup("NO  CODE"),0
		looping dword ?
		boom dword ?
		val	sdword 6 DUP(0),0
		val2	sdword 10 DUP(0),0
		total	sdword 10 DUP(0),0
		totalgpa dword 0
		totalcredit dword ?
		subjectcredit=3
		gpa		sdword ?
		caption byte "Fail!!!You... , you need more training to pass darling",0
		caption1 byte "Pass!!!You are right... , you need more training to be good darling",0
		caption2 byte "Good!!!You are right... , you need more training to be perfect darling",0
		caption3 byte"Excellent!!!You don't need training, you are perfect",0
		done byte"Done!!!",0; define your variables here	
	.code

	Assem PROC
			mov eax,lightcyan
			call settextcolor
			call crlf
			call crlf
			call crlf
			call crlf
			mwritespace 15
			mwriteln"====================WELCOME TO==============================================="
			mwritespace 15
			MWRITELN"====================CGPA CALCULATOR=========================================="
			mwritespace 15
			MWRITELN"----------------------THE MAGNIFICO------------------------------------------"
			call crlf
			call crlf
			mwrite"               "
			mwriteln"Please enter your name >>student name here"
			mwrite"               "
			mreadstring str1
			call crlf
			call crlf
			call waitmsg
			mov eax,white 
			call settextcolor
			


		l0:
			call clrscr
			mwriteln"How many subject do you take in this semester?"
			call readdec
			mov looping, eax
			cmp looping,5
			jg error
			mov eax, 0
			mov ecx, 0
			mov ebx ,0
		ln:
			cmp ecx,looping 
			mov boom , ecx
			jge let
			mwrite"Enter code subject "
			mov eax,boom
			add eax,1
			call writedec
			call crlf
			cmp ebx,0
			je q1
			cmp ebx,4h
			je q2
			cmp ebx,8h
			je q3
			cmp ebx,12
			je q4
			cmp ebx,10h
			je q5
		q1:
			mreadstring codesubject1
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			mwrite"> "
			call readdec
			mov [val+ebx],eax
			add ebx,4
			add ecx,1
			jmp ln
		q2:
			mreadstring codesubject2
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			mwrite"> "
			call readdec
			mov [val+ebx],eax
			add ebx,4
			add ecx,1
			jmp ln

		q3:
			mreadstring codesubject3
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			mwrite"> "
			call readdec
			mov [val+ebx],eax
			add ebx,4
			add ecx,1
			jmp ln

		q4:
			mreadstring codesubject4
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			mwrite"> "
			call readdec
			mov [val+ebx],eax
			add ebx,4
			add ecx,1
			jmp ln

		q5:
			mreadstring codesubject5
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			mwrite"> "
			call readdec
			mov [val+ebx],eax
			add ebx,4
			add ecx,1
			jmp ln

		q6:	
			mreadstring codesubject6
			call crlf
			mwrite"Enter mark "
			mov eax,boom
			add eax,1
			call writedec
			mwritespace 1
			mwrite"> "
			call readdec
			mov [val+ebx],eax
			add ebx,4
			add ecx,1
			jmp ln
		let:	
			call clrscr
			mwriteln"Your result: "
			call crlf
			mwrite"Name : "
			mwritestring str1
			call crlf
			mwriteln"----------------------------------------------------------------------------------------------------------"
			mwriteln"Subject		Marks			Grade			Points			TotalPoints"	
			mwriteln"--------       -------	               ------		        ------		        -----------"
			jmp list
		list:
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
			mov	ebx,12		
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
			mov	ebx,10h		
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
			mov eax,lightmagenta
			call settextcolor
			call crlf
			mwriteln"----------------------------------------------------------------------------------------------------------"
			mwrite"Grand Total Subject : "
			mov eax,0h
			mov ebx,0h
			add eax,[total+ebx]
			mov	ebx,4h
			add eax,[total+ebx]
			mov	ebx,8h
			add eax,[total+ebx]
			mov	ebx,12
			add eax,[total+ebx]
			mov	ebx,10h
			add eax,[total+ebx]
			mov totalgpa,eax
			call writedec
			call crlf
			mov eax,looping
			mwrite"Total Credits : "
			mov ecx,subjectcredit
			mul ecx
			call writedec
			call crlf
			mov totalcredit,eax
			mwrite"GPA : "
			mov eax,totalgpa
			mov ecx,totalcredit
			cmp ecx,0
			je error
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
			mov eax,green
			call settextcolor
			mwriteln"Excellent"
			mov eax,lightmagenta
			call settextcolor
			mwriteln"----------------------------------------------------------------------------------------------------------"
			mov eax,white
			call settextcolor
			mov ebx,offset done
			mov edx,offset caption3
			call msgbox
			jmp exitprocess
		s2:
			mov eax,cyan
			call settextcolor
			mwriteln"Good"
			mov eax,lightmagenta
			call settextcolor
			mwriteln"----------------------------------------------------------------------------------------------------------"
			mov eax,white
			call settextcolor
			mov ebx,offset done
			mov edx,offset caption2
			call msgbox
			jmp exitprocess
		s3:	
			mov eax,yellow
			call settextcolor
			mwriteln"Pass"
			mov eax,lightmagenta
			call settextcolor
			mwriteln"----------------------------------------------------------------------------------------------------------"
			mov eax,white
			call settextcolor
			mov ebx,offset done
			mov edx,offset caption1
			call msgbox
			jmp exitprocess
		s4:
			mov eax,lightred
			call settextcolor
			mwriteln"Fail"
			mov eax,lightmagenta
			call settextcolor
			mwriteln"----------------------------------------------------------------------------------------------------------"
			mov eax,white
			call settextcolor
			mov ebx,offset done
			mov edx,offset caption
			call msgbox
			jmp exitprocess
		g1:
			mov ebx,0
				mov [total+ebx],eax
			mov ebx,4h
				sub edi,1
				mov eax,white
				call settextcolor
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
				mov eax,white
				call settextcolor
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
			mov ebx,12
				sub edi,1
				mov eax,white
				call settextcolor
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
			mov ebx,12
				mov [total+ebx],eax
			mov ebx,10h
			mov eax,white
				call settextcolor
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
			mov ebx,10h
				mov [total+ebx],eax
				mov eax,white
				call settextcolor
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
				mov eax,green
				call settextcolor
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
			cmp ebx,12
				je e3
			cmp ebx,10h
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
				mov eax,cyan
				call settextcolor
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
			cmp ebx,12
				je r3
			cmp ebx,10h
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
				mov eax,yellow
				call settextcolor
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
			cmp ebx,12
				je r3
			cmp ebx,10h
				je r4
				jne l2
			
				
			De:
				mov eax,red
				call settextcolor
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
			cmp ebx,12
				je e3
			cmp ebx,10h
				je e4
				jne l2
			
			Ee:
				mov eax,red
				call settextcolor
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
			cmp ebx,12
				je e3
			cmp ebx,10h
				je e4
				jne l2
			
			error:
				mwrite"<<Invalid>>"
				call crlf
				call waitmsg
				mov eax,white
				call settextcolor
				jmp l0
; WRITE YOUR ASSEMBLY CODE HERE

			INVOKE	 ExitProcess, 0
			Assem ENDP
			END Assem