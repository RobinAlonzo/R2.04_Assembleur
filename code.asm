		; Exercice 3
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
		 
		 
		 
		 ;Exercice 4 
		 .DATA
		 chaine DW "Bonjour je m'appel robin"
			   DW 0	   
		 maxi   DSW 1
		 .CODE
		 LEA R2, chaine
		 LD R1, 0
boucle:  LD R0,[R2] 
	     CMP R0, 0
		 BNE sinon
		 JMP fin

		 
sinon:   CMP R0, R1
	     BLT maxR0
	     LD R1, R0
	     INC R2
	     JMP boucle
	   
	   
maxR0:   INC R2	
	     JMP boucle
	   
fin:     ST R1, maxi
	     HLT
		 
		 ;Exercice 5
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
		  
		  ;Exercice 6
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
		
			;Exercice 7
			.CODE
			LEA SP, STACK
			LD R0, %00000000; Efface l'écran
			OUT R0, 5
			LD R4, %11000101; Touche A appuyé
			LD R5, %10000101; Touche A relaché
			LD R6, %11000110; Touche B appuyé
			LD R0, %11000111; clique souris			
	souris: IN R1, 0; 
			IN R2, 6; Coordx souris
			IN R3, 7; Coordy souris		
			CMP R1, R0
			BNE souris
			SUB R2, 50 ;On enlève 50 px a CoordX
			SUB R3, 50 ;On enlève 50 px à Coordy			
			CALL grandCarre
	touche: IN R0, 0
			CMP R0, R4
			BNE suite
			ADD R2, 25 ; On rajoute 50px à Coordx
			ADD R3, 25			
			CALL petitCarre
	suite:	CMP R0, R6
			BEQ fin
			JMP touche
	   fin: HLT
		
petitCarre: LD R0, %00000000; Efface l'écran
			OUT R0, 5; On met les infos de R0 dans le port 5 // Permet d'effacer l'écran
dessCarre:  LD R1, 50; Taile du carré
			OUT R2, 1; Coord x dans le port1
			OUT R3, 2; Coord y dans le port 2
			OUT R1, 3; Taille du carre dans le port 3
			OUT R1, 4; Taille du carre le port 4
			LD R0, %11000101; Carré plein 50px
			OUT R0, 5; Dessin du carre
			IN R0, 0
			CMP R0, R5
			BNE dessCarre
			SUB R2, 25
			SUB R3, 25				
			CALL grandCarre
			RET
			
grandCarre: LD R0, %00000000; Efface l'écran
			OUT R0, 5
			LD R1, 100; Largeur et hauteur
			OUT R2, 1
			OUT R3, 2
			OUT R1, 3
			OUT R1, 4
			LD R0, %11000101; Carré plein 100px
			OUT R0, 5
			RET
			.STACK 3
		
			;Exercice 8
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
					
					;Exercice 9
					.DATA
					couleur DW 5
					coordX DW 0
					coordY DW 0
					largeurRectangle DW 255
					hauteurRectangle DW 16
					.CODE
					LEA SP, STACK		
					LD R0, %00000000
					OUT R0, 5
					LD R1, coordY
					LD R2, couleur
					LD R3, 16; Nombre de mire
		boucle:	    CMP R3, 0
					BEQ fin
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
					
			
			
			
			

						
			

					  
		  

		 
		 
		
		 