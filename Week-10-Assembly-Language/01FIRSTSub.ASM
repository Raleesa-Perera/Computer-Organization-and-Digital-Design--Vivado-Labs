
	CLO		; Close unwanted windows.
	MOV AL,3	; Copy a 3 into the AL register.
	MOV BL,2	; Copy a 2 into the BL register.
	SUB AL, BL	; Subtract AL to BL. Answer goes into AL.
	END		; Program ends
