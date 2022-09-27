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
		
		 