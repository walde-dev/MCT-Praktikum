
	AREA	main_s,code
	
	EXPORT  main

	INCLUDE LPC1778_REG_ASM.s		
		
LED_DELAY		equ	(0x3E8)
;LED_DELAY		equ	(0x1)
		


main	
		

		LDR r0, =LPC_GPIO0_DIR
		MOV r1, #0x00FF00
		STR r1, [r0]
		

		
		
		LDR r1, =LPC_GPIO0_SET		
		MOV r2, #0x600				
		STR r2, [r1]
		
		LDR r0, =LED_DELAY		
		BL warte
		
		LDR r1, =LPC_GPIO0_CLR		
		MOV r2, #0x600		
		STR r2, [r1]
		
		LDR r0, =LED_DELAY
		BL warte
		
		
		MOV r0, #0x4
		MOV r1, #0x1
		BL zahlAusgeben
		
		B main


zahlAusgeben
		CMP r1, #0x0
		

		CMP r0, #0x0
		BEQ zahlNullAusgeben
		
		CMP r0, #0x1
		BEQ zahlEinsAusgeben
		
		
zahlNullAusgeben
		LDR r2, =LPC_GPIO0_SET		
		MOV r3, #0x600				
		STR r3, [r2]



warte
		LDR r1, =0x1770
		MUL r0, r0, r1
warteschleife		
		SUB r0, r0, #0x1
		CMP r0, #0x0
		BNE warteschleife
		BX LR
	
		
stop		
					
		end
		