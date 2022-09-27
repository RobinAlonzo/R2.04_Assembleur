		  .DATA
		  chaine DW "On souligneeeee."
		  point DW "."

		  .CODE
		  LD R0, %00000000 ;effacer l'écran
		  OUT R0, 5 
		  LD R4, 9; Coord X
		  OUT R4, 1 ;Coorx X dans port 1
		  LD R5, 9; Coord Y
		  OUT R5, 2; Coord Y dans port 2
		  LEA R1, chaine ;Récupération de l'adresse de la chaine
		  LEA R2, point ;Récupération de l'adresse du point
boucle:   LD R6, [R1] ;R6 prend le caractère 
		  CMP R6, [R2] ;Compare si R6 = R2
		  BEQ souligne
		  OUT [R1], 3 ;Le caractère à écrire
		  LD R0, %11100111 ;Ecriture du caractère
		  OUT R0, 5 ;Ecriture dans port 5
		  INC R1 ;Incrémentation de R1
		  JMP boucle ;On refait la boucle
		
souligne: IN R1, 1 
		  IN R2, 2
		  OUT R4, 1
		  INC R5
		  OUT R5, 2
		  OUT R1, 3
		  INC R2
		  OUT R2, 4
		  LD R0, %11100010
		  OUT R0, 5
		  HLT
		  

