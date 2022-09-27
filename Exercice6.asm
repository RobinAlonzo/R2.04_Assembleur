			.CODE
			LEA SP, STACK
			LD R0, %00000000; Efface l'écran
			OUT R0, 5
			LD R4, %11000101; Touche A appuyé
			LD R5, %10000101; Touche A relaché
			LD R6, %11000110; Touche B appuyé			
			CALL grandCarre
	touche: IN R0, 0
			CMP R0, R4
			BNE suite		
			CALL petitCarre
	suite:	CMP R0, R6
			BEQ fin
			JMP touche
	   fin: HLT
		
petitCarre: LD R0, %00000000; Efface l'écran
			OUT R0, 5; On met les infos de R0 dans le port 5 // Permet d'effacer l'écran
dessCarre:  LD R1, 50; Taile du carré
			LD R2, 100;
			OUT R2, 1; Coord x dans le port1
			OUT R2, 2; Coord y dans le port 2
			OUT R1, 3; Taille du carre dans le port 3
			OUT R1, 4; Taille du carre le port 4
			LD R0, %11000101; Carré plein 50px
			OUT R0, 5; Dessin du carre
			IN R0, 0
			CMP R0, R5
			BNE dessCarre			
			CALL grandCarre
			RET
			
grandCarre: LD R0, %00000000; Efface l'écran
			OUT R0, 5
			LD R1, 100; Largeur et hauteur
			LD R3, 78
			OUT R3, 1
			OUT R3, 2
			OUT R1, 3
			OUT R1, 4
			LD R0, %11000101; Carré plein 100px
			OUT R0, 5
			RET
			.STACK 3
		
			
			

			