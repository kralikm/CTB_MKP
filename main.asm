; Jednoduchý Blink pro ATmega328P s frekvencí 1Hz a zpožděním 5 sekund
; LED na PB5 (Arduino Uno - pin 13)

.org 0x0000          ; Reset vektor na začátku paměti
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

; Jednoduchá smyčka na zpoždění 5 sekund
Delay:
    ldi r18, 0x05    ; Nastavíme zpoždění na 5 sekund
Del1:
    ldi r19, 0x01    ; Každá smyčka trvá 1 sekundu
Del2:
    nop              ; No operation (trvá 1 cyklus)
    dec r19          ; Snížíme r19 o 1
    brne Del2        ; Pokud r19 != 0, pokračuj vnitřní smyčkou
    dec r18          ; Snížíme r18 o 1
    brne Del1        ; Pokud r18 != 0, pokračuj vnější smyčkou
    ret              ; Vrátíme se zpět
