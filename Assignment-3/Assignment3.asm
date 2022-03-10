.include "/home/ramesh720/m328Pdef.inc"

Start:
	ldi r17, 0b11000011 ; identifying input pins 10,11,12,13
	out DDRB,r17		; declaring pins as input
	ldi r17, 0b11111111 ;
	out PORTB,r17		; activating internal pullup for pins 10,11,12,13  
	in r17,PINB
	
	ldi r20,0b00000010
	rcall loopr
	
	ldi r21,0b00000001
	and r21,r17 ;w
	lsr r17
	ldi r22,0b00000001
	and r22,r17 ;z
	lsr r17
	ldi r23,0b00000001
	and r23,r17 ;y
	lsr r17
	ldi r24,0b00000001
	and r24,r17 ;x

	ldi r25,0b00000001
    ldi r26,0b00000001
	ldi r27,0b00000001

    eor r21, r25 ; w'
    eor r23, r25 ; y'

	mov r26,r24 ; x
    mov r27,r22 ; z

    eor r24,r25 ; x'
    eor r22,r25 ; z'

    and r24,r22 ; im1 = x'z'
    and r23,r27 ; im2 = y'z
    or r24,r23 ; im1+im2 = x'z'+y'z

	and r26,r27 ; xz
    and r26,r21 ; im3 = xzw'

    or r24,r26 ; im1+im2+im3 = x'z'+y'z+xzw'

	ldi r20,0b00000010
	rcall loopl

	ldi r16, 0b00111100 ;identifying output pins 2,3,4,5
	out DDRD,r16		;declaring pins as output
	out PORTD,r24		;writing output to pins 2,3,4,5
	

	rjmp Start

loopr:	lsr r17
	dec r20
	brne loopr
	ret

loopl:	lsl r24
	dec r20
	brne loopl
	ret
