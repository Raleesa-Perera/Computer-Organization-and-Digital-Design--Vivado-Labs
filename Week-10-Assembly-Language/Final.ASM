
	CLO		; Close unwanted windows.
	MOV 	BL,1	; Copy a 1 into the BL register.
	
	
	MOV 	DL,5    ;Copy a 5 into the DL register.
	CALL	30	;Call the procedure at address [30]



; ----- Time Delay Procedure Stored At Address [30] -------------
	ORG	30	; Generate machine code from address [30]

	PUSH	DL	; Save DL on the stack.
	PUSHF		; Save the CPU flags on the stack.
Rep:
	MUL	BL,DL
	DEC	DL	; SUBTRACT one from DL.
	JNZ	REP	; Jump back to Rep if DL was not Zero.

	POPF		; Restore the CPU flags from the stack.
	POP	DL	; Restore DL from the stack.

	;RET		; Return from the procedure.

; ---------------------------------------------------------------

Start:
	MOV	AL,8A	; 10001010
	OUT	02	; Send the data in BL to Port 02

	MOV	AL,FF	; 11111111
	OUT	02	; Send the data in BL to Port 02

	JMP	Start
	
	END
