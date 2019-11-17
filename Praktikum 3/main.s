
	AREA	main_s,code
	
	EXPORT  main

	INCLUDE LPC1778_REG_ASM.s	
		
LED_DELAY		equ (0xF4240)
		
main
		LDR r3, =LPC_GPIO0_DIR
		MOV r4, #0x00FF00
		STR r4, [r3]
		LDR r5, =0x80		
pollme
		LDR r3, =LPC_GPIO0_PIN
		LDR r4, [r3]
		AND r4, r4, #0xFF0000
			
		
		CMP r4, #0xFE0000
		BEQ nachLinksLaufen
		CMP r4, #0xFD0000
		BEQ nachRechtsLaufen
		BNE pollme			
nachLinksLaufen
		LDR r0, =LPC_GPIO0_SET		
		MOV r1, r5				
		STR r1, [r0]
		
		B goLeft		
nachRechtsLaufen
		LDR r0, =LPC_GPIO0_SET		
		MOV r1, r5				
		STR r1, [r0]
		
		B goRight	
goLeft
		LDR r0, =LPC_GPIO0_CLR		
		MOV r1, r5				
		STR r1, [r0]
		
		LSL r5, r5, #0x1
		MOV r1, r5
		
		LDR r0, =LPC_GPIO0_SET		
		MOV r1, r5				
		STR r1, [r0]
		
		BL warteschleife
				
		CMP r5, #0x10000
		BNE pollme
		
		MOV r5, #0x80
		B pollme			
goRight
		LDR r0, =LPC_GPIO0_CLR		
		MOV r1, r5				
		STR r1, [r0]
				
		LSR r5, r5, #0x1
		MOV r1, r5
		
		LDR r0, =LPC_GPIO0_SET		
		MOV r1, r5				
		STR r1, [r0]
		
		BL warteschleife
		
		CMP r5, #0x80
		BNE pollme
		
		MOV r5, #0x10000
		B pollme
		
warteschleife
		LDR r2, =LED_DELAY
warte
		SUB r2, r2, #0x1
		CMP r2, #0x0
		BNE warte
		BX LR
							
stop					
					
		end