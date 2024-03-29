Start:
	MOV	AL,FC	; 11111100
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,DF	; 11011111
	OUT	02	; Send the data in AL to Port 02

	JMP	Start
	
	END
