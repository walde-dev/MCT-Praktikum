
	AREA	main_s,code
	
	EXPORT  main

	INCLUDE LPC1778_REG_ASM.s	

LED_DELAY			equ (0x3D090)
		


main	
		LDR r0, =LPC_GPIO0_DIR		
		MOV r1, #0xFF00				
		STR r1, [r0]				
		
schleife

		LDR r0, =LPC_GPIO0_SET		
		MOV r1, #0x100				
		STR r1, [r0]				
		
		LDR r2, =LED_DELAY				
warte1		
		SUB r2, r2, #1				
		CMP r2, #0					
		BNE warte1					
		
		LDR r0, =LPC_GPIO0_CLR		
		MOV r1, #0x100				
		STR r1, [r0]				
		
		LDR r0, =LPC_GPIO0_SET		
		MOV r1, #0x200				
		STR r1, [r0]				
		
		LDR r2, =LED_DELAY			
warte2		
		SUB r2, r2, #1				
		CMP r2, #0					
		BNE warte2					
		
		LDR r0, =LPC_GPIO0_CLR		
		MOV r1, #0x200				
		STR r1, [r0]				
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x400
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
warte3		
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte3
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x400
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x800
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
warte4
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte4
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x800
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x1000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
warte5
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte5
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x1000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x2000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
warte6
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte6
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x2000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x4000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
warte7
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte7
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x4000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x8000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
warte8
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte8
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x8000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x4000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
		
warte7r
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte7r
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x4000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x2000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
		
warte6r
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte6r
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x2000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x1000
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
		
warte5r
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte5r
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x1000
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x800
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
		
warte4r
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte4r
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x800
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x400
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
		
warte3r		
		SUB r2, r2, #1
		CMP r2, #0
		BNE warte3r
		
		LDR r0, =LPC_GPIO0_CLR
		MOV r1, #0x400
		STR r1, [r0]
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x200
		STR r1, [r0]
		
		LDR r2, =LED_DELAY

warte2r		
		SUB r2, r2, #1				
		CMP r2, #0					
		BNE warte2r					
		
		LDR r0, =LPC_GPIO0_CLR		
		MOV r1, #0x200				
		STR r1, [r0]				
		
		LDR r0, =LPC_GPIO0_SET
		MOV r1, #0x100
		STR r1, [r0]
		
		LDR r2, =LED_DELAY
		

		
stop	B	schleife				
					
		end
		