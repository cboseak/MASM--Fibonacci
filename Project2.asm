TITLE Project 2 - Fibonacci     (Project2.asm)

; Author: Christopher Boseak
; Course / Project ID   CS2571 / Assignment #2             Date: 10/16/2015
; Description: This is a program that will ask the user to enter how many Fibonacci numbers they would like and will display all Fibonacci numbers

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data

numOfFib		DWORD	?
upperLimit		DWORD	50
nMinus1			DWORD	?
nMinus2			DWORD	?
tempCount		DWORD	?

studentName		BYTE	"Christopher Boseak - Assignment #2 - Fibonacci Numbers",0
introForUser1	BYTE	"*** This is a program that will ask the user to enter how many Fibonacci numbers they would like and will display all Fibonacci numbers***",0
introForUser2	BYTE	"(up to the specified term)",0
invalid			BYTE	"The number you entered is greater than 50, please try again",0


welcomeMsg		BYTE	"Welcome ",0
promptToUser	BYTE	"Please enter your integer (between 1 and 50):",0
promptUserName	BYTE	"Please enter your name: ",0

sayBye1			BYTE	"Thanks for playing! Goodbye ",0
exclamation		BYTE	"!",0
spaceBetween	BYTE	"     ",0
userName		BYTE	21 DUP(0)
byteCount		DWORD	?


.code
main PROC

;---INTRODUCTION TO USER---

	
	mov		edx, OFFSET studentName
	call	WriteString
	call	CrLF
	call	CrLF

	mov		edx, OFFSET promptUserName
	call	WriteString
	mov		edx, OFFSET userName
	mov		ecx, SIZEOF userName
	call	ReadString
	mov		byteCount,eax

	mov		edx, OFFSET welcomeMsg
	call	WriteString
	mov		edx, OFFSET userName
	call	WriteString
	mov		edx, OFFSET exclamation
	call	WriteString
	call	CrLF
	call	CrLF


;---USER INSTRUCTIONS---

	mov		edx, OFFSET	introForUser1
	call	WriteString
	call	CrLF
	call	CrLF

	mov		edx, OFFSET	introForUser2
	call	WriteString
	call	CrLF
	call	CrLF


	
;---GET USER DATA---

userInput:	
	mov		edx, OFFSET	promptToUser
	call	WriteString
	call	readInt
	mov		numOfFib, eax
	mov		ecx, numOfFib
	dec		ecx
	jmp		validate

;---VALIDE---

validate:
	mov		eax,50
	cmp		numOfFib,eax
	jg		tooMuch
	jle		displayFib

tooMuch:
	mov		edx, OFFSET invalid
	call	WriteString
	call	CrLF
	jmp		userInput

;---DISPLAY FIBONACCI---

displayFib:
	mov		nMinus1, 1
	mov		nMinus2, 0
	mov		eax,0
	call	WriteDec
	mov		edx, OFFSET spaceBetween
	call	WriteString
	mov		eax,1
	call	WriteDec
	mov		edx, OFFSET spaceBetween
	call	WriteString
	mov		tempCount,3
start:
	mov		eax, nMinus1
	mov		ebx, nMinus2
	add		eax, ebx
	call	WriteDec
	mov		edx, OFFSET spaceBetween
	call	WriteString
	mov		ebx,nMinus1
	mov		nMinus2,ebx
	mov		nMinus1,eax
	dec		tempCount
	cmp		tempCount,0
	jz		lnEvFive
	loop	start
	jmp		bye								;jump past the line maker if outside of Fib loop


lnEvFive:									;This creates a new line every five numbers
	call	CrLF
	mov		tempCount,5
	jmp		start



;---SAY BYE---
bye:
	call	CrLF
	call	CrLF
	mov		edx, OFFSET sayBye1
	call	WriteString
	mov		edx, OFFSET userName
	call	WriteString
	mov		edx, OFFSET exclamation
	call	WriteString
	call	CrLF
	call	CrLF



	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main