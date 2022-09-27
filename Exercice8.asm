					.DATA
					couleur DW 16
					coordX DW 50
					coordY DW 50
					largeurRectangle DW 100
					hauteurRectgangle DW 75
					.CODE
					LEA SP, STACK
					PUSH couleur
					PUSH coordX
					PUSH coordY
					PUSH largeurRectangle
					PUSH hauteurRectgangle
					CALL dessinRectangle
					HLT
					
dessinRectangle:    LD R0, %00000000; Efface l'écran
					OUT R0, 5
					LD R0, [SP + 1]
					OUT R0, 3; hauteur du rectangle dans le port 3
					LD R0, [SP + 2]
					OUT R0, 4; taille du rectangle le port 4
					LD R0, [SP + 3]
					OUT R0, 2; Coord y dans le port 2
					LD R0, [SP + 4]
					OUT R0, 1; Coord x dans le port1
					LD R0, [SP + 5]; Dessin du rectangle
					ADD R0, 5
					OUT R0, 5; Dessin du carre	
					RET
					.STACK 6
					
					
					
			
			
