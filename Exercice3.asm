		.CODE
		LD R0, 1
		LD R1, 2
		LD R2, 6
boucle: CMP R1, R2
		BGT fin
		MUL R0, R1
		INC R1
		JMP boucle
fin: 
		HLT