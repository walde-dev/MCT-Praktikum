
	AREA	main_s,code
	
	EXPORT  main
	EXPORT  TIMER0_IRQHandler 
	EXPORT  TIMER1_IRQHandler 

	INCLUDE LPC1778_REG_ASM.s		
		
LED_DELAY		equ	(0x100000)
;LED_DELAY		equ	(0x2)
PRESCALE_VALUE 	equ (0x1D4C0)

main	
		LDR r0, =LPC_TIM0_PR
		LDR r1, =PRESCALE_VALUE
		STR r1, [r0]
		
		LDR r0, =LPC_TIM1_PR
		LDR r1, =PRESCALE_VALUE
		STR r1, [r0]
		
		LDR r0, =LPC_TIM0_MR0
		MOV r1, #0xA
		STR r1, [r0]

		LDR r0, =LPC_TIM0_MR1
		MOV r1, #0x1
		STR r1, [r0]
		
		LDR r0, =LPC_TIM0_TCR
		MOV r1, #0x1
		STR r1, [r0]
		
		LDR r0, =LPC_TIM1_TCR
		MOV r1, #0x1
		STR r1, [r0]
		
		LDR r0, =LPC_TIM0_MCR
		MOV r1, #0x2
		STR r1, [r0]
		
		LDR r0, =LPC_TIM1_MCR
		MOV r1, #0x2
		STR r1, [r0]
		
		LDR r0, =LPC_ISER0
		MOV r1, #0x1
		STR r1, {r0]
		
		LDR r0, =LPC_ISER1
		MOV r1, #0x2
		STR r1, {r0]
		
		LDR r0, =LPC_GPIO0_DIR
		MOV r1, #0x00FF00
		STR r1, [r0]
		
		MOV r7, #0x0 ;zehner wert
		MOV r8, #0x0 ;einser wert
	
pollme
		
		LDR r3, =LPC_GPIO0_PIN
		LDR r4, [r3]
		AND r4, r4, #0xFF0000
		
		CMP r4, #0xFE0000  ;Starttaste
		BEQ Stoppuhrstart
		
		CMP r4, #0xFD0000
		;BEQ Stoppuhrstop   ;Stoptaste
		
		CMP r4, #0xFC0000
		;BEQ Stoppuhrreset  ;Resettaste
		
		BNE pollme
		
		
TIMER0_IRQHandler 
		ADD r8, r8, #0x1
		MOV r0, r8
		MOV r1, #0x1
		PUSH{LR}
		BL zahlAusgeben
		POP{LR}
		BX LR
		
TIMER1_IRQHandler
		LDR r3, =LPC_GPIO0_SET
		AND r3, r3, #0x7F
		
		
Stoppuhrstart
		MOV r0, #0x0
		MOV r1, #0x0
loop
		BL zahlAusgeben
		CMP r0, #0x9
		BEQ neueZehn
		ADD r0, r0, #0x1
		B loop
		
neueZehn	
		ADD r7, r7, #0x1
		MOV r0, r7
		MOV r1, #0x1
		BL zahlAusgeben
		
		
		B Stoppuhrstart
		


		
zahlAusgeben

		PUSH {LR}
		LDR r2, =werte
		LDR r3, [r2, r0, LSL #2]
		
		CMP r1, #0x0
		BEQ linksAusgeben
		CMP r1, #0x1
		BEQ rechtsAusgeben

zahlSetzen
		
		LDR r4, =LPC_GPIO0_SET	
		LSL r3, r3, #8
		MOV r5, r3				
		STR r5, [r4]
		
		PUSH{r0}
		LDR r0, =LED_DELAY
		BL warteschleife
		
		LDR r4, =LPC_GPIO0_CLR		
		MOV r5, r3		
		STR r5, [r4]
		
		LDR r0, =LED_DELAY
		
		BL warteschleife
		POP {r0}
		POP {LR}
		
		BX LR

linksAusgeben
		LDR r6, =0x7F
		AND r3, r3, r6
		B zahlSetzen
		
rechtsAusgeben
		LDR r6, =0x80
		ORR r3, r3, r6
		B zahlSetzen
warte
		LDR r1, =0x1770
		;LDR r1, =0x1
		MUL r0, r0, r1

warteschleife		

		SUB r0, r0, #0x1
		CMP r0, #0x0
		BNE warteschleife
		BX LR

werte 	DCD 63, 6, 91, 79, 102, 109, 125, 7, 127, 103
		
stop		
					
		end
