
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,2 :: 		void interrupt(){
;MyProject.c,3 :: 		while(intf_bit){
L_interrupt0:
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt1
;MyProject.c,4 :: 		portc=0x00;
	CLRF       PORTC+0
;MyProject.c,5 :: 		if(portb.b1==0){
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt2
;MyProject.c,6 :: 		if(porta.b0){  //Rw
	BTFSS      PORTA+0, 0
	GOTO       L_interrupt3
;MyProject.c,7 :: 		porta.b2=1;    //Gw
	BSF        PORTA+0, 2
;MyProject.c,8 :: 		porta.B0=0;
	BCF        PORTA+0, 0
;MyProject.c,9 :: 		porta.B1=0;
	BCF        PORTA+0, 1
;MyProject.c,10 :: 		porte.B1=1;    //Ys
	BSF        PORTE+0, 1
;MyProject.c,11 :: 		porte.B0=0;
	BCF        PORTE+0, 0
;MyProject.c,12 :: 		porte.B2=0;
	BCF        PORTE+0, 2
;MyProject.c,13 :: 		for(count=3;count>0;count--){
	MOVLW      3
	MOVWF      _count+0
L_interrupt4:
	MOVF       _count+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt5
;MyProject.c,14 :: 		portc=0;
	CLRF       PORTC+0
;MyProject.c,15 :: 		portc|= ((count%10) <<4);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	IORWF      PORTC+0, 1
;MyProject.c,16 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt7:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt7
	DECFSZ     R12+0, 1
	GOTO       L_interrupt7
	DECFSZ     R11+0, 1
	GOTO       L_interrupt7
	NOP
	NOP
;MyProject.c,13 :: 		for(count=3;count>0;count--){
	DECF       _count+0, 1
;MyProject.c,17 :: 		}
	GOTO       L_interrupt4
L_interrupt5:
;MyProject.c,18 :: 		porte.B0=1;  //Rs
	BSF        PORTE+0, 0
;MyProject.c,19 :: 		porte.B1=0;
	BCF        PORTE+0, 1
;MyProject.c,20 :: 		}
	GOTO       L_interrupt8
L_interrupt3:
;MyProject.c,21 :: 		else if(porte.b0){    //Rs
	BTFSS      PORTE+0, 0
	GOTO       L_interrupt9
;MyProject.c,22 :: 		porte.b2=1;     //Gs
	BSF        PORTE+0, 2
;MyProject.c,23 :: 		porte.B0=0;
	BCF        PORTE+0, 0
;MyProject.c,24 :: 		porte.B1=0;
	BCF        PORTE+0, 1
;MyProject.c,25 :: 		porta.B1=1;    //Yw
	BSF        PORTA+0, 1
;MyProject.c,26 :: 		porta.B0=0;
	BCF        PORTA+0, 0
;MyProject.c,27 :: 		porta.B2=0;
	BCF        PORTA+0, 2
;MyProject.c,28 :: 		for(count=3;count>0;count--){
	MOVLW      3
	MOVWF      _count+0
L_interrupt10:
	MOVF       _count+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt11
;MyProject.c,29 :: 		portc=0;
	CLRF       PORTC+0
;MyProject.c,30 :: 		portc|= ((count%10) <<4);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	IORWF      PORTC+0, 1
;MyProject.c,31 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt13:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt13
	DECFSZ     R12+0, 1
	GOTO       L_interrupt13
	DECFSZ     R11+0, 1
	GOTO       L_interrupt13
	NOP
	NOP
;MyProject.c,28 :: 		for(count=3;count>0;count--){
	DECF       _count+0, 1
;MyProject.c,32 :: 		}
	GOTO       L_interrupt10
L_interrupt11:
;MyProject.c,33 :: 		porta.B0=1;
	BSF        PORTA+0, 0
;MyProject.c,34 :: 		porta.B1=0;
	BCF        PORTA+0, 1
;MyProject.c,35 :: 		}
L_interrupt9:
L_interrupt8:
;MyProject.c,36 :: 		portc=0x00;
	CLRF       PORTC+0
;MyProject.c,37 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt14:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt14
	DECFSZ     R12+0, 1
	GOTO       L_interrupt14
	DECFSZ     R11+0, 1
	GOTO       L_interrupt14
	NOP
	NOP
;MyProject.c,38 :: 		while(portb.b1==0);
L_interrupt15:
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt16
	GOTO       L_interrupt15
L_interrupt16:
;MyProject.c,40 :: 		}
L_interrupt2:
;MyProject.c,41 :: 		if(portb.b0){
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt17
;MyProject.c,42 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;MyProject.c,43 :: 		}
L_interrupt17:
;MyProject.c,44 :: 		}
	GOTO       L_interrupt0
L_interrupt1:
;MyProject.c,45 :: 		}
L_end_interrupt:
L__interrupt35:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_countDown:

;MyProject.c,49 :: 		void countDown(char num){
;MyProject.c,50 :: 		for(i=num;i>3;i--){
	MOVF       FARG_countDown_num+0, 0
	MOVWF      _i+0
L_countDown18:
	MOVF       _i+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_countDown19
;MyProject.c,51 :: 		if(num==23){
	MOVF       FARG_countDown_num+0, 0
	XORLW      23
	BTFSS      STATUS+0, 2
	GOTO       L_countDown21
;MyProject.c,52 :: 		porta.B2=1;
	BSF        PORTA+0, 2
;MyProject.c,53 :: 		porta.B0=0;
	BCF        PORTA+0, 0
;MyProject.c,54 :: 		porta.B1=0;
	BCF        PORTA+0, 1
;MyProject.c,55 :: 		porte.B0=1;
	BSF        PORTE+0, 0
;MyProject.c,56 :: 		porte.B1=0;
	BCF        PORTE+0, 1
;MyProject.c,57 :: 		porte.B2=0;
	BCF        PORTE+0, 2
;MyProject.c,59 :: 		}
L_countDown21:
;MyProject.c,60 :: 		if(num==15){
	MOVF       FARG_countDown_num+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_countDown22
;MyProject.c,61 :: 		porta.B0=1;
	BSF        PORTA+0, 0
;MyProject.c,62 :: 		porta.B1=0;
	BCF        PORTA+0, 1
;MyProject.c,63 :: 		porta.B2=0;
	BCF        PORTA+0, 2
;MyProject.c,64 :: 		porte.B2=1;
	BSF        PORTE+0, 2
;MyProject.c,65 :: 		porte.B0=0;
	BCF        PORTE+0, 0
;MyProject.c,66 :: 		porte.B1=0;
	BCF        PORTE+0, 1
;MyProject.c,67 :: 		}
L_countDown22:
;MyProject.c,68 :: 		portc=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;MyProject.c,69 :: 		portc |=((i%10)<<4);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	IORWF      PORTC+0, 1
;MyProject.c,70 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_countDown23:
	DECFSZ     R13+0, 1
	GOTO       L_countDown23
	DECFSZ     R12+0, 1
	GOTO       L_countDown23
	DECFSZ     R11+0, 1
	GOTO       L_countDown23
	NOP
	NOP
;MyProject.c,50 :: 		for(i=num;i>3;i--){
	DECF       _i+0, 1
;MyProject.c,71 :: 		}
	GOTO       L_countDown18
L_countDown19:
;MyProject.c,72 :: 		if(i==3){
	MOVF       _i+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_countDown24
;MyProject.c,73 :: 		if(num==23){
	MOVF       FARG_countDown_num+0, 0
	XORLW      23
	BTFSS      STATUS+0, 2
	GOTO       L_countDown25
;MyProject.c,74 :: 		porta.b1=1;
	BSF        PORTA+0, 1
;MyProject.c,75 :: 		porta.b2=0;
	BCF        PORTA+0, 2
;MyProject.c,77 :: 		}
L_countDown25:
;MyProject.c,78 :: 		if(num==15){
	MOVF       FARG_countDown_num+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_countDown26
;MyProject.c,79 :: 		porte.b1=1;
	BSF        PORTE+0, 1
;MyProject.c,80 :: 		porte.b2=0;
	BCF        PORTE+0, 2
;MyProject.c,81 :: 		}
L_countDown26:
;MyProject.c,82 :: 		for(i=3;i>0;i--){
	MOVLW      3
	MOVWF      _i+0
L_countDown27:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_countDown28
;MyProject.c,83 :: 		portc=0;
	CLRF       PORTC+0
;MyProject.c,84 :: 		portc|=((i%10)<<4);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	IORWF      PORTC+0, 1
;MyProject.c,85 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_countDown30:
	DECFSZ     R13+0, 1
	GOTO       L_countDown30
	DECFSZ     R12+0, 1
	GOTO       L_countDown30
	DECFSZ     R11+0, 1
	GOTO       L_countDown30
	NOP
	NOP
;MyProject.c,82 :: 		for(i=3;i>0;i--){
	DECF       _i+0, 1
;MyProject.c,86 :: 		}
	GOTO       L_countDown27
L_countDown28:
;MyProject.c,87 :: 		portc=0x00;
	CLRF       PORTC+0
;MyProject.c,88 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_countDown31:
	DECFSZ     R13+0, 1
	GOTO       L_countDown31
	DECFSZ     R12+0, 1
	GOTO       L_countDown31
	DECFSZ     R11+0, 1
	GOTO       L_countDown31
	NOP
	NOP
;MyProject.c,90 :: 		}
L_countDown24:
;MyProject.c,91 :: 		}
L_end_countDown:
	RETURN
; end of _countDown

_main:

;MyProject.c,93 :: 		void main() {
;MyProject.c,94 :: 		ADCON1=0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;MyProject.c,95 :: 		trisb.b0=1;
	BSF        TRISB+0, 0
;MyProject.c,96 :: 		trisb.b1=1;
	BSF        TRISB+0, 1
;MyProject.c,97 :: 		trisb.b2=0;
	BCF        TRISB+0, 2
;MyProject.c,98 :: 		trisa=0b000;
	CLRF       TRISA+0
;MyProject.c,99 :: 		trise=0b000;
	CLRF       TRISE+0
;MyProject.c,100 :: 		trisc=0b00000000;
	CLRF       TRISC+0
;MyProject.c,101 :: 		portc=0b00000000;
	CLRF       PORTC+0
;MyProject.c,102 :: 		porta=0b00000000;
	CLRF       PORTA+0
;MyProject.c,103 :: 		porte=0b00000000;
	CLRF       PORTE+0
;MyProject.c,104 :: 		portb.b0=1;
	BSF        PORTB+0, 0
;MyProject.c,105 :: 		portb.b1=1;
	BSF        PORTB+0, 1
;MyProject.c,106 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;MyProject.c,107 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,108 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;MyProject.c,109 :: 		intedg_bit=0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;MyProject.c,110 :: 		not_rbpu_bit=0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;MyProject.c,111 :: 		while(1){
L_main32:
;MyProject.c,112 :: 		countDown(23);
	MOVLW      23
	MOVWF      FARG_countDown_num+0
	CALL       _countDown+0
;MyProject.c,113 :: 		countDown(15);
	MOVLW      15
	MOVWF      FARG_countDown_num+0
	CALL       _countDown+0
;MyProject.c,114 :: 		}
	GOTO       L_main32
;MyProject.c,116 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
