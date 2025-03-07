; Jednoduchý Blink pro ATmega328P s frekvencí 1Hz a zpožděním 5 cyklu
; LED na PB5 (Arduino Uno - pin 13)
.def dly = r17 ;definice aliasu pro registr r17 - zde ukladam delay 

	ldi dly, 5 ;NASTAVENI DELAY
	
rjmp RESET       ; Skok na hlavní program

RESET:
    ; Nastavení PB5 jako výstup
    ldi r16, 0x20    ; Bit 5 = PB5
    out 0x04, r16    ; DDRB (adresa 0x04) = 0x20 (PB5 jako výstup)

Loop:
    ; Zapnutí LED (nastavení PB5 na 1)
    ldi r16, 0x20    ; Bit 5 = PB5
    out 0x05, r16    ; PORTB (adresa 0x05) = 0x20 (LED ON)
    rcall Delay      ; Zavolání zpoždění

    ; Vypnutí LED (nastavení PB5 na 0)
    ldi r16, 0x00
    out 0x05, r16    ; PORTB = 0x00 (LED OFF)
    rcall Delay      ; Zavolání zpoždění

    rjmp Loop        ; Nekonečná smyčka

; Jednoduchá smyčka na zpoždění 5 cyklu
Delay:
    mov r18, dly    ; Nastavíme pocitadlo na hodnotu dly
Del2:
    dec r18          ; Snížíme r18 o 1
    brne Del2        ; Pokud r18 != 0, pokračuj ve snizovani
    ret              ; Vrátíme se zpět
