					.DATA
					couleur DW 5 ;Couleur 
					coordX DW 0 ;Coord x
					coordY DW 0 ; coord y
					largeurRectangle DW 255 ;largeur rectangle
					hauteurRectangle DW 16 ;hauteurRectangle
					.CODE
					LEA SP, STACK		
					LD R0, %00000000
					OUT R0, 5
					LD R1, coordY
					LD R2, couleur
					LD R3, 16; Nombre de mire
		boucle:	    CMP R3, 0
					BEQ fin
					ADD R2, 16
					ADD R1, 16
					PUSH R2
					PUSH R1
					PUSH coordX
					PUSH largeurRectangle
					PUSH hauteurRectangle					
					CALL dessinRectangle
					DEC R3					
					JMP boucle
			fin:	HLT
					
dessinRectangle:    LD R0, [SP + 1]
					OUT R0, 4; hauteur du rectangle dans le port 3
					LD R0, [SP + 2]
					OUT R0, 3; largeur du rectangle le port 4
					LD R0, [SP + 3]
					OUT R0, 1; Coord x dans le port 1
					LD R1, [SP + 4]
					OUT R1, 2; Coord Y dns le port 2
					LD R2, [SP + 5]
					OUT R2, 5; Dessin du carre	
					RET 5
					.STACK 10					