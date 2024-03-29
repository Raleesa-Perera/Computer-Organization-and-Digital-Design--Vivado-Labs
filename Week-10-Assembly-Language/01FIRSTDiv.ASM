
	CLO		; Close unwanted windows.
	MOV CL,15	; Copy a 15 into the CL register.
	MOV DL,5	; Copy a 5 into the DL register.
	MUL CL,DL	; DIVIDE CL by DL. Answer goes into CL.
	END		; Program ends
