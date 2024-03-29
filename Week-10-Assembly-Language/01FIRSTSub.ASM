
	CLO		; Close unwanted windows.
	MOV AL,4	; Copy a 4 into the AL register.
	MOV BL,2	; Copy a 2 into the BL register.
	SUB AL, BL	; Subtract AL to BL. Answer goes into AL.
	END		; Program ends
