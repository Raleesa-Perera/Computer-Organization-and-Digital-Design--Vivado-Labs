
	CLO		; Close unwanted windows.
	MOV CL,4	; Copy a 4 into the CL register.
	MOV DL,2	; Copy a 2 into the DL register.
	MUL CL,DL	; DIVIDE CL by DL. Answer goes into CL.
	END		; Program ends
