
	CLO		; Close unwanted windows.
	MOV AL,4	; Copy a 4 into the AL register.
	MOV DL,2	; Copy a 2 into the DL register.
	MUL AL,DL	; Multiply AL by DL. Answer goes into AL.
	END		; Program ends
