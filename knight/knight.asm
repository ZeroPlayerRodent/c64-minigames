
 processor 6502
 org  $7ffe
 word $8000
 sei
 stx $d016
 jsr $fda3
 jsr $fd50
 jsr $fd15
 jsr $ff5b

 lda #%11111111
 sta $D015
 sta $D01D
 sta $D017

 lda #$FF
 sta $D40E
 sta $D40F
 lda #$80
 sta $D412

 lda #%10000001
 sta $D404
 lda #%11110000
 sta $D406
 lda #%00100000
 sta $D405
       
 lda #7
 sta $D400
 sta $D401
 sta $D402
 sta $D403
 
 lda #%01000001
 sta $D40B
 lda #%11110000
 sta $D40D
 lda #%00100000
 sta $D40C
 
 lda #5
 sta $D407
 sta $D408
 sta $D409
 sta $D40A
 
 lda #%10000000
 sta $D404
 sta $D40B
        
 lda #%00001100
 sta $D418

 jmp NoCollision
DisplayScore
 lda #30
 adc $C005
 lda #48
 adc $C005
 sta $400+71
 lda #48
 adc $C004
 sta $400+72
 lda #48
 adc $C003
 sta $400+73
 lda #48
 adc $C002
 sta $400+74
 lda #48
 adc $C001
 sta $400+75
 lda #48
 adc $C000
 sta $400+76
 rts

AddPoint
 ldy $C000
 iny
 cpy #10
 beq Digit2
 sty $C000
 jmp DoneAddingPoint
Digit2
 ldy #0
 sty $C000
 ldy $C001
 iny
 cpy #10
 beq Digit3
 sty $C001
 jmp DoneAddingPoint
Digit3
 ldy #0
 sty $C001
 ldy $C002
 iny
 cpy #10
 beq Digit4
 sty $C002
 jmp DoneAddingPoint
Digit4
 ldy #0
 sty $C002
 ldy $C003
 iny
 cpy #10
 beq Digit5
 sty $C003
 jmp DoneAddingPoint
Digit5
 ldy #0
 sty $C003
 ldy $C004
 iny
 cpy #10
 beq Digit6
 sty $C004
 jmp DoneAddingPoint
Digit6
 ldy #0
 sty $C004
 ldy $C005
 iny
 sty $C005
DoneAddingPoint
 rts

DisplayScore2
 lda #30
 adc $C00B
 lda #48
 adc $C00B
 sta $400+40+71
 lda #48
 adc $C00A
 sta $400+40+72
 lda #48
 adc $C009
 sta $400+40+73
 lda #48
 adc $C008
 sta $400+40+74
 lda #48
 adc $C007
 sta $400+40+75
 lda #48
 adc $C006
 sta $400+40+76
 rts

AddPoint2
 ldy $C006
 iny
 cpy #10
 beq Digit22
 sty $C006
 jmp DoneAddingPoint2
Digit22
 ldy #0
 sty $C006
 ldy $C007
 iny
 cpy #10
 beq Digit32
 sty $C007
 jmp DoneAddingPoint2
Digit32
 ldy #0
 sty $C007
 ldy $C008
 iny
 cpy #10
 beq Digit42
 sty $C008
 jmp DoneAddingPoint2
Digit42
 ldy #0
 sty $C008
 ldy $C009
 iny
 cpy #10
 beq Digit52
 sty $C009
 jmp DoneAddingPoint2
Digit52
 ldy #0
 sty $C009
 ldy $C00A
 iny
 cpy #10
 beq Digit62
 sty $C00A
 jmp DoneAddingPoint2
Digit62
 ldy #0
 sty $C00A
 ldy $C00B
 iny
 sty $C00B
DoneAddingPoint2
 rts


FullCollision
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 adc $03F2
 cmp $033C
 bcs ColReset1
 lda #255
ColReset1
 clc
 sta $033C
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 sbc $03F2
 clc
 sta $033C
 lda $033E
 adc $03F3
 cmp $033E
 bcs ColReset2
 lda #255
ColReset2
 clc
 sta $033E
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 adc $03F2
 cmp $033C
 bcs ColReset3
 lda #255
ColReset3
 clc
 sta $033C
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
APointCollided
 rts

PointCollision
 lda #0
 sta $0340

 lda $033C
 cmp $033D
 bcc NotAboveX2
 lda $033D
 adc $03F0
 cmp $033D
 bcs ColReset4
 lda #255
ColReset4
 clc
 tax
 cpx $033C
 bcc NotBelowX2
 lda $033E
 cmp $033F
 bcc NotAboveY2
 lda $033F
 adc $03F1
 cmp $033F
 bcs ColReset5
 lda #255
ColReset5
 clc
 tax
 cpx $033E
 bcc NotBelowY2
 lda #1
 sta $0340
NotAboveX2
NotBelowX2
NotAboveY2
NotBelowY2
 rts
NoCollision

 ldx #0
 jmp LoadDataNo0
SpriteDataNo0
 byte #2,#0,#0
 byte #5,#2,#0
 byte #0,#243,#0
 byte #0,#131,#0
 byte #248,#243,#0
 byte #255,#243,#0
 byte #251,#251,#0
 byte #251,#239,#0
 byte #115,#199,#0
 byte #7,#225,#0
 byte #7,#112,#0
 byte #3,#48,#0
 byte #6,#96,#0
 byte #7,#112,#0
 byte #15,#188,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo0
 lda SpriteDataNo0,x
 sta $3000,x
 inx
 cpx #$3F
 bne LoadDataNo0

 ldx #0
 jmp LoadDataNo1
SpriteDataNo1
 byte #2,#0,#0
 byte #5,#0,#1
 byte #0,#240,#3
 byte #248,#128,#6
 byte #248,#240,#12
 byte #255,#254,#24
 byte #251,#247,#48
 byte #115,#227,#224
 byte #3,#192,#96
 byte #7,#224,#128
 byte #7,#112,#0
 byte #3,#48,#0
 byte #6,#24,#0
 byte #28,#14,#0
 byte #62,#15,#128
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo1
 lda SpriteDataNo1,x
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
 byte #0,#0,#64
 byte #0,#64,#160
 byte #0,#207,#0
 byte #0,#193,#0
 byte #0,#207,#31
 byte #0,#207,#255
 byte #0,#223,#223
 byte #0,#247,#223
 byte #0,#227,#206
 byte #0,#135,#224
 byte #0,#14,#224
 byte #0,#12,#192
 byte #0,#6,#96
 byte #0,#14,#224
 byte #0,#61,#240
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo2
 lda SpriteDataNo2,x
 sta $3080,x
 inx
 cpx #$3F
 bne LoadDataNo2

 ldx #0
 jmp LoadDataNo3
SpriteDataNo3
 byte #0,#0,#64
 byte #128,#0,#160
 byte #192,#15,#0
 byte #96,#1,#31
 byte #48,#15,#31
 byte #24,#127,#255
 byte #12,#239,#223
 byte #7,#199,#206
 byte #6,#3,#192
 byte #1,#7,#224
 byte #0,#14,#224
 byte #0,#12,#192
 byte #0,#24,#96
 byte #0,#112,#56
 byte #1,#240,#124
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo3
 lda SpriteDataNo3,x
 sta $30C0,x
 inx
 cpx #$3F
 bne LoadDataNo3

 ldx #0
 jmp LoadDataNo4
SpriteDataNo4
 byte #48,#192,#0
 byte #24,#130,#0
 byte #9,#172,#0
 byte #63,#240,#0
 byte #15,#248,#0
 byte #127,#255,#0
 byte #31,#248,#0
 byte #11,#176,#0
 byte #25,#140,#0
 byte #17,#6,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo4
 lda SpriteDataNo4,x
 sta $3100,x
 inx
 cpx #$3F
 bne LoadDataNo4

 ldx #0
 jmp LoadDataNo5
SpriteDataNo5
 byte #2,#0,#0
 byte #5,#2,#0
 byte #0,#243,#0
 byte #0,#131,#0
 byte #248,#243,#0
 byte #255,#243,#0
 byte #251,#251,#0
 byte #251,#239,#0
 byte #115,#199,#0
 byte #7,#225,#0
 byte #7,#56,#0
 byte #3,#12,#0
 byte #6,#24,#0
 byte #28,#28,#0
 byte #62,#31,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo5
 lda SpriteDataNo5,x
 sta $3140,x
 inx
 cpx #$3F
 bne LoadDataNo5

 ldx #0
 jmp LoadDataNo6
SpriteDataNo6
 byte #0,#0,#64
 byte #0,#64,#160
 byte #0,#207,#0
 byte #0,#193,#0
 byte #0,#207,#31
 byte #0,#207,#255
 byte #0,#223,#223
 byte #0,#247,#223
 byte #0,#227,#206
 byte #0,#135,#224
 byte #0,#28,#224
 byte #0,#48,#192
 byte #0,#24,#96
 byte #0,#56,#56
 byte #0,#248,#124
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo6
 lda SpriteDataNo6,x
 sta $3180,x
 inx
 cpx #$3F
 bne LoadDataNo6

 ldx #0
 jmp LoadDataNo7
SpriteDataNo7
 byte #24,#0,#5
 byte #32,#0,#10
 byte #255,#255,#255
 byte #32,#0,#10
 byte #24,#0,#5
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo7
 lda SpriteDataNo7,x
 sta $31C0,x
 inx
 cpx #$3F
 bne LoadDataNo7

 ldx #0
 jmp LoadDataNo8
SpriteDataNo8
 byte #160,#0,#24
 byte #80,#0,#4
 byte #255,#255,#255
 byte #80,#0,#4
 byte #160,#0,#24
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo8
 lda SpriteDataNo8,x
 sta $3200,x
 inx
 cpx #$3F
 bne LoadDataNo8

 ldx #0
 jmp LoadDataNo9
SpriteDataNo9
 byte #0,#168,#0
 byte #0,#112,#0
 byte #0,#168,#0
 byte #0,#112,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#168,#0
 byte #0,#168,#0
 byte #0,#112,#0
 byte #0,#32,#0
 byte #0,#0,#0
LoadDataNo9
 lda SpriteDataNo9,x
 sta $3240,x
 inx
 cpx #$3F
 bne LoadDataNo9

 ldx #0
 jmp LoadDataNo10
SpriteDataNo10
 byte #0,#32,#0
 byte #0,#112,#0
 byte #0,#168,#0
 byte #0,#168,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#112,#0
 byte #0,#168,#0
 byte #0,#112,#0
 byte #0,#168,#0
 byte #0,#0,#0
LoadDataNo10
 lda SpriteDataNo10,x
 sta $3280,x
 inx
 cpx #$3F
 bne LoadDataNo10

 ldx #0
 jmp LoadDataNo11
SpriteDataNo11
 byte #0,#0,#0
 byte #0,#0,#0
 byte #4,#0,#0
 byte #10,#0,#0
 byte #1,#224,#0
 byte #1,#0,#0
 byte #249,#228,#0
 byte #255,#242,#0
 byte #251,#250,#0
 byte #251,#238,#0
 byte #115,#196,#0
 byte #7,#224,#0
 byte #7,#112,#0
 byte #51,#48,#0
 byte #62,#224,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo11
 lda SpriteDataNo11,x
 sta $32C0,x
 inx
 cpx #$3F
 bne LoadDataNo11

 ldx #0
 jmp LoadDataNo12
SpriteDataNo12
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #2,#0,#0
 byte #5,#0,#0
 byte #0,#240,#0
 byte #1,#224,#0
 byte #75,#248,#0
 byte #59,#238,#0
 byte #7,#224,#0
 byte #7,#112,#0
 byte #51,#48,#0
 byte #62,#224,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo12
 lda SpriteDataNo12,x
 sta $3300,x
 inx
 cpx #$3F
 bne LoadDataNo12

 ldx #0
 jmp LoadDataNo13
SpriteDataNo13
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #1,#0,#0
 byte #2,#128,#0
 byte #0,#126,#0
 byte #15,#254,#0
 byte #63,#121,#0
 byte #126,#253,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo13
 lda SpriteDataNo13,x
 sta $3340,x
 inx
 cpx #$3F
 bne LoadDataNo13

 lda #0
 sta $D021

 lda #12
 sta $D020

 lda #1

 sta $C00C
; THIS IS LINE

LoopNo15
 lda $C00C
 sta $CFFE
 lda #23
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo16
 jmp GotoNo16
BranchNo16
 jmp ExitLoopNo15


GotoNo16

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo17
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo17
 ldy #30
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
CompLoopNo18 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo18
 ldy #30
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo15
ExitLoopNo15

 lda #1

 sta $C00C
; THIS IS BGX

 lda #1

 sta $C00D
; THIS IS BGY

LoopNo19
 lda $C00D
 sta $CFFE
 lda #23
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo20
 jmp GotoNo20
BranchNo20
 jmp ExitLoopNo19


GotoNo20

LoopNo21
 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo22
 jmp GotoNo22
BranchNo22
 jmp ExitLoopNo21


GotoNo22

 lda $D41B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo23
 jmp GotoNo23
BranchNo23
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00D
CompLoopNo24
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo24
 ldy $C00C
 lda #104

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00D
CompLoopNo25 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo25
 ldy $C00C
 lda #9

 sta ($00FB),y

 lda $D41B
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo26
 jmp GotoNo26
BranchNo26
 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00D
CompLoopNo27 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo27
 ldy $C00C
 lda #5

 sta ($00FB),y

GotoNo26

GotoNo23

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo21
ExitLoopNo21

 lda #1
 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 lda $C00D

 clc
 adc #1

 sta $CFFF

 sta $C00D

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE

 jmp LoopNo19
ExitLoopNo19

 lda #75
 sta $C00E
 lda #78
 sta $C00F
 lda #73
 sta $C010
 lda #71
 sta $C011
 lda #72
 sta $C012
 lda #84
 sta $C013
 lda #83
 sta $C014
 lda #96
 sta $C015
 lda #65
 sta $C016
 lda #84
 sta $C017
 lda #84
 sta $C018
 lda #65
 sta $C019
 lda #67
 sta $C01A
 lda #75
 sta $C01B
 lda #0
 sta $C01C
; THIS IS STARTMESSAGE

 lda #0

 sta $C00C
; THIS IS STARTCURSOR

LoopNo28
 ldx $C00C
 lda $C00E,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo29
 jmp GotoNo29
BranchNo29
 jmp ExitLoopNo28


GotoNo29

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo30
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo30
 lda $C00C

 clc
 adc #8

 sta $CFFF

 tay
 ldx $C00C
 lda $C00E,x

;GARBAGE COLLECTION COMPLETE
;$C00E IS NOW FREE

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo31 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo31
 lda $C00C

 clc
 adc #8

 sta $CFFF

 tay
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo28
ExitLoopNo28

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo32 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo32
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo33 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo33
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo34 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo34
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo35 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo35
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo36 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo36
 ldy #35
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo37 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo37
 ldy #36
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo38 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo38
 ldy #31
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo39 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo39
 ldy #32
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo40 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo40
 ldy #33
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo41 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo41
 ldy #34
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo42 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo42
 ldy #35
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo43 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo43
 ldy #36
 lda #0

 sta ($00FB),y

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


LoopNo44
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo45
 jmp GotoNo45
BranchNo45
 jmp RESETGAME

GotoNo45

 jmp LoopNo44
ExitLoopNo44

RESETGAME

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #192
 sta $7F8

 lda #196
 sta $7FF

 lda #7
 sta $D02E

 lda #0
 sta $D00E

 lda #0
 sta $D00F

 lda #14
 sta $D027

 lda #150
 sta $D001

 lda #100
 sta $D000

 lda #0

 sta $C00D
; THIS IS P1DIR

 lda #2

 sta $C00E
; THIS IS P1SPD

 lda #0

 sta $C00F
; THIS IS P1ATK

 lda #0

 sta $C010
; THIS IS P1BOUNCE

 lda #0

 sta $C011
; THIS IS P1COOL

 lda #10

 sta $C012
; THIS IS STEPTIME

 lda #0

 sta $C013
; THIS IS STEP

 jmp EXITMOVEPLAYER
MOVEPLAYER

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo46
 jmp GotoNo46
BranchNo46
 lda $C011

 sec
 sbc #1

 sta $CFFF

 sta $C011

GotoNo46

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo47
 jmp GotoNo47
BranchNo47
 lda $C00F

 sec
 sbc #1

 sta $CFFF

 sta $C00F

GotoNo47

 lda #%00000001
 bit $DC01
 beq BranchNo48
 jmp GotoNo48
BranchNo48
 lda $D001

 sec
 sbc $C00E

 sta $CFFF

 sta $D001

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo49
 jmp GotoNo49
BranchNo49
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo49

GotoNo48

 lda #%00000010
 bit $DC01
 beq BranchNo50
 jmp GotoNo50
BranchNo50
 lda $D001

 clc
 adc $C00E

 sta $CFFF

 sta $D001

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo51
 jmp GotoNo51
BranchNo51
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo51

GotoNo50

 lda #%00000100
 bit $DC01
 beq BranchNo52
 jmp GotoNo52
BranchNo52
 lda $D000

 sec
 sbc $C00E

 sta $CFFF

 sta $D000

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo53
 jmp GotoNo53
BranchNo53
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo53

 lda #1
 sta $C00D

GotoNo52

 lda #%00001000
 bit $DC01
 beq BranchNo54
 jmp GotoNo54
BranchNo54
 lda $D000

 clc
 adc $C00E

 sta $CFFF

 sta $D000

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo55
 jmp GotoNo55
BranchNo55
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo55

 lda #0
 sta $C00D

GotoNo54

 lda $D000
 sta $CFFE
 lda #230
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo56
 jmp GotoNo56
BranchNo56
 lda #230
 sta $D000

GotoNo56

 lda $D000
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo57
 jmp GotoNo57
BranchNo57
 lda #10
 sta $D000

GotoNo57

 lda $D001
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo58
 jmp GotoNo58
BranchNo58
 lda #220
 sta $D001

GotoNo58

 lda $D001
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo59
 jmp GotoNo59
BranchNo59
 lda #50
 sta $D001

GotoNo59

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo60
 jmp GotoNo60
BranchNo60
 lda $C013

 clc
 adc #1

 sta $CFFF

 sta $C013

 lda $C013
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo61
 jmp GotoNo61
BranchNo61
 lda #0
 sta $C013

GotoNo61

 lda #10
 sta $C012

GotoNo60

 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo62
 jmp GotoNo62
BranchNo62
 lda #192
 sta $7F8

 lda $C013
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo63
 jmp GotoNo63
BranchNo63
 lda #197
 sta $7F8

GotoNo63

GotoNo62

 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo64
 jmp GotoNo64
BranchNo64
 lda #194
 sta $7F8

 lda $C013
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo65
 jmp GotoNo65
BranchNo65
 lda #198
 sta $7F8

GotoNo65

GotoNo64

 lda #%00010000
 bit $DC01
 beq BranchNo66
 jmp GotoNo66
BranchNo66
 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo67
 jmp GotoNo67
BranchNo67
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo68
 jmp GotoNo68
BranchNo68
 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo69
 jmp GotoNo69
BranchNo69
 lda #%01000001
 sta $D40B


 lda #25
 sta $C00F

 lda #40
 sta $C011

 lda #1
 sta $C010

GotoNo69

GotoNo68

GotoNo67

 jmp P1DONTBOUNCE

GotoNo66

 lda #0
 sta $C010

P1DONTBOUNCE

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo70
 jmp GotoNo70
BranchNo70
 lda #1
 sta $C00E

 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo71
 jmp GotoNo71
BranchNo71
 lda #193
 sta $7F8

GotoNo71

 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo72
 jmp GotoNo72
BranchNo72
 lda #195
 sta $7F8

GotoNo72

GotoNo70

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo73
 jmp GotoNo73
BranchNo73
 lda #2
 sta $C00E

 lda #%01000000
 sta $D40B


GotoNo73

 rts
EXITMOVEPLAYER

 lda #0
 sta $C014
 lda #0
 sta $C015
; THIS IS LEFTX

 lda #50
 sta $C016
 lda #125
 sta $C017
; THIS IS LEFTY

 lda #0
 sta $C018
 lda #0
 sta $C019
; THIS IS LEFTATK

 lda #0
 sta $C01A
 lda #1
 sta $C01B
; THIS IS LEFTSTEP

 lda #192
 sta $7F9

 lda #192
 sta $7FA

 lda #15
 sta $D028

 lda #15
 sta $D029

 jmp EXITMOVELEFTS
MOVELEFTS

 ldx #0
 lda $C01A,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C01A,x


 ldx #0
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo74
 jmp GotoNo74
BranchNo74
 lda #0
 tay
 ldx #0
 tya
 sta $C01A,x


GotoNo74

 ldx #1
 lda $C01A,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C01A,x


 ldx #1
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo75
 jmp GotoNo75
BranchNo75
 lda #0
 tay
 ldx #1
 tya
 sta $C01A,x


GotoNo75

 ldx #0
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo76
 jmp GotoNo76
BranchNo76
 lda #0
 tay
 ldx #0
 tya
 sta $C018,x


GotoNo76

 lda #192
 sta $7F9

 ldx #0
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo77
 jmp GotoNo77
BranchNo77
 lda #197
 sta $7F9

GotoNo77

 ldx #1
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo78
 jmp GotoNo78
BranchNo78
 lda #0
 tay
 ldx #1
 tya
 sta $C018,x


GotoNo78

 lda #192
 sta $7FA

 ldx #1
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo79
 jmp GotoNo79
BranchNo79
 lda #197
 sta $7FA

GotoNo79

 ldx #0
 lda $C018,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo80
 jmp GotoNo80
BranchNo80
 lda #193
 sta $7F9

 lda #2
 tay
 ldx #0
 tya
 sta $C018,x


 lda #15
 sta $D028

GotoNo80

 ldx #1
 lda $C018,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo81
 jmp GotoNo81
BranchNo81
 lda #193
 sta $7FA

 lda #2
 tay
 ldx #1
 tya
 sta $C018,x


 lda #15
 sta $D029

GotoNo81

 lda $D41B
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo82
 jmp GotoNo82
BranchNo82
 ldx #0
 lda $C018,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo83
 jmp GotoNo83
BranchNo83
 lda #1
 tay
 ldx #0
 tya
 sta $C018,x


 lda #2
 sta $D028

GotoNo83

GotoNo82

 lda $D41B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo84
 jmp GotoNo84
BranchNo84
 ldx #1
 lda $C018,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo85
 jmp GotoNo85
BranchNo85
 lda #1
 tay
 ldx #1
 tya
 sta $C018,x


 lda #2
 sta $D029

GotoNo85

GotoNo84

 ldx #0
 lda $C014,x

 clc
 adc #5

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C014,x


 ldx #1
 lda $C014,x

 clc
 adc #4

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C014,x


 ldx #0
 lda $C014,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo86
 jmp GotoNo86
BranchNo86
 lda #0
 tay
 ldx #0
 tya
 sta $C014,x


GotoNo86

 ldx #1
 lda $C014,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo87
 jmp GotoNo87
BranchNo87
 lda #0
 tay
 ldx #1
 tya
 sta $C014,x


GotoNo87

 rts
EXITMOVELEFTS

 lda #230
 sta $C01D
 lda #230
 sta $C01E
; THIS IS RIGHTX

 lda #75
 sta $C01F
 lda #175
 sta $C020
; THIS IS RIGHTY

 lda #0
 sta $C021
 lda #0
 sta $C022
; THIS IS RIGHTATK

 lda #1
 sta $C023
 lda #0
 sta $C024
; THIS IS RIGHTSTEP

 lda #194
 sta $7FB

 lda #194
 sta $7FC

 lda #15
 sta $D02A

 lda #15
 sta $D02B

 jmp EXITMOVERIGHTS
MOVERIGHTS

 ldx #0
 lda $C023,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C023,x


 ldx #0
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo88
 jmp GotoNo88
BranchNo88
 lda #0
 tay
 ldx #0
 tya
 sta $C023,x


GotoNo88

 ldx #1
 lda $C023,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C023,x


 ldx #1
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo89
 jmp GotoNo89
BranchNo89
 lda #0
 tay
 ldx #1
 tya
 sta $C023,x


GotoNo89

 ldx #0
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo90
 jmp GotoNo90
BranchNo90
 lda #0
 tay
 ldx #0
 tya
 sta $C021,x


GotoNo90

 lda #194
 sta $7FB

 ldx #0
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo91
 jmp GotoNo91
BranchNo91
 lda #198
 sta $7FB

GotoNo91

 ldx #1
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo92
 jmp GotoNo92
BranchNo92
 lda #0
 tay
 ldx #1
 tya
 sta $C021,x


GotoNo92

 lda #194
 sta $7FC

 ldx #1
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo93
 jmp GotoNo93
BranchNo93
 lda #198
 sta $7FC

GotoNo93

 ldx #0
 lda $C021,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo94
 jmp GotoNo94
BranchNo94
 lda #195
 sta $7FB

 lda #2
 tay
 ldx #0
 tya
 sta $C021,x


 lda #15
 sta $D02A

GotoNo94

 ldx #1
 lda $C021,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo95
 jmp GotoNo95
BranchNo95
 lda #195
 sta $7FC

 lda #2
 tay
 ldx #1
 tya
 sta $C021,x


 lda #15
 sta $D02B

GotoNo95

 lda $D41B
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo96
 jmp GotoNo96
BranchNo96
 ldx #0
 lda $C021,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo97
 jmp GotoNo97
BranchNo97
 lda #1
 tay
 ldx #0
 tya
 sta $C021,x


 lda #2
 sta $D02A

GotoNo97

GotoNo96

 lda $D41B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo98
 jmp GotoNo98
BranchNo98
 ldx #1
 lda $C021,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo99
 jmp GotoNo99
BranchNo99
 lda #1
 tay
 ldx #1
 tya
 sta $C021,x


 lda #2
 sta $D02B

GotoNo99

GotoNo98

 ldx #0
 lda $C01D,x

 sec
 sbc #4

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C01D,x


 ldx #1
 lda $C01D,x

 sec
 sbc #5

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C01D,x


 ldx #0
 lda $C01D,x

 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo100
 jmp GotoNo100
BranchNo100
 lda #230
 tay
 ldx #0
 tya
 sta $C01D,x


GotoNo100

 ldx #1
 lda $C01D,x

 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo101
 jmp GotoNo101
BranchNo101
 lda #230
 tay
 ldx #1
 tya
 sta $C01D,x


GotoNo101

 rts
EXITMOVERIGHTS

 lda #25

 sta $C01C
; THIS IS MOVETIME

 lda #25

 sta $C00C
; THIS IS MOVERESET

 lda #0

 sta $C025
; THIS IS SOUNDTIME

 lda #25

 sta $C026
; THIS IS BONUS

 lda #255

 sta $C027
; THIS IS ARROWTIME

 lda #0

 sta $C028
; THIS IS ARROWMOVE

 lda #255

 sta $C029
; THIS IS ARROWTIME2

 lda #0

 sta $C02A
; THIS IS ARROWMOVE2

 lda #12
 sta $D02D

 lda #12
 sta $D02C

 lda #199
 sta $7FE

 lda #201
 sta $7FD

 lda #0
 sta $D00C

 lda #0
 sta $D00D

 lda #0
 sta $D00A

 lda #0
 sta $D00B

LoopNo102
 lda $C027
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo103
 jmp GotoNo103
BranchNo103
 lda $C027

 sec
 sbc #1

 sta $CFFF

 sta $C027

GotoNo103

 lda $C027
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo104
 jmp GotoNo104
BranchNo104
 lda $C028
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo105
 jmp GotoNo105
BranchNo105
 lda $D000
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo106
 jmp GotoNo106
BranchNo106
 lda $D001
 sta $D00D

 lda #1
 sta $C028

 lda #10
 sta $D00C

 lda #200
 sta $7FE

GotoNo106

 lda $D000
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo107
 jmp GotoNo107
BranchNo107
 lda $D001
 sta $D00D

 lda #2
 sta $C028

 lda #240
 sta $D00C

 lda #199
 sta $7FE

GotoNo107

GotoNo105

GotoNo104

 lda $C028
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo108
 jmp GotoNo108
BranchNo108
 lda $D00C

 clc
 adc #2

 sta $CFFF

 sta $D00C

GotoNo108

 lda $C028
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo109
 jmp GotoNo109
BranchNo109
 lda $D00C

 sec
 sbc #2

 sta $CFFF

 sta $D00C

GotoNo109

 lda $D00C
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo110
 jmp GotoNo110
BranchNo110
 lda #0
 sta $C028

 lda $D41B
 sta $C027

 lda #50
 sta $D00C

 lda #0
 sta $D00D

GotoNo110

 lda $D00C
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo111
 jmp GotoNo111
BranchNo111
 lda #0
 sta $C028

 lda $D41B
 sta $C027

 lda #50
 sta $D00C

 lda #0
 sta $D00D

GotoNo111

 lda $C029
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo112
 jmp GotoNo112
BranchNo112
 lda $C029

 sec
 sbc #1

 sta $CFFF

 sta $C029

GotoNo112

 lda $C029
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo113
 jmp GotoNo113
BranchNo113
 lda $C02A
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo114
 jmp GotoNo114
BranchNo114
 lda $D001
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo115
 jmp GotoNo115
BranchNo115
 lda $D000
 sta $D00A

 lda #1
 sta $C02A

 lda #10
 sta $D00B

 lda #201
 sta $7FD

GotoNo115

 lda $D001
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo116
 jmp GotoNo116
BranchNo116
 lda $D000
 sta $D00A

 lda #2
 sta $C02A

 lda #240
 sta $D00B

 lda #202
 sta $7FD

GotoNo116

GotoNo114

GotoNo113

 lda $C02A
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo117
 jmp GotoNo117
BranchNo117
 lda $D00B

 clc
 adc #2

 sta $CFFF

 sta $D00B

GotoNo117

 lda $C02A
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo118
 jmp GotoNo118
BranchNo118
 lda $D00B

 sec
 sbc #2

 sta $CFFF

 sta $D00B

GotoNo118

 lda $D00B
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo119
 jmp GotoNo119
BranchNo119
 lda #0
 sta $C02A

 lda $D41B
 sta $C029

 lda #0
 sta $D00A

 lda #0
 sta $D00B

GotoNo119

 lda $D00B
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo120
 jmp GotoNo120
BranchNo120
 lda #0
 sta $C02A

 lda $D41B
 sta $C029

 lda #0
 sta $D00A

 lda #0
 sta $D00B

GotoNo120

 lda $C026
 sta $CFFE
 lda #25
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo121
 jmp GotoNo121
BranchNo121
 lda $C026

 sec
 sbc #1

 sta $CFFF

 sta $C026

GotoNo121

 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo122
 jmp GotoNo122
BranchNo122
 lda $C01C

 sec
 sbc #1

 sta $CFFF

 sta $C01C

GotoNo122

 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo123
 jmp GotoNo123
BranchNo123
 jsr MOVELEFTS



 jsr MOVERIGHTS



 lda $C00C
 sta $C01C

GotoNo123

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo124
 jmp GotoNo124
BranchNo124
 lda $C025

 sec
 sbc #1

 sta $CFFF

 sta $C025

GotoNo124

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo125
 jmp GotoNo125
BranchNo125
 lda #0
 sta $D00E

 lda #0
 sta $D00F

 lda #%10000000
 sta $D404


GotoNo125

 ldx #0
 lda $C014,x

 sta $D002

 ldx #1
 lda $C014,x

 sta $D004

 ldx #0
 lda $C016,x

 sta $D003

 ldx #1
 lda $C016,x

 sta $D005

 ldx #0
 lda $C01D,x

 sta $D006

 ldx #1
 lda $C01D,x

 sta $D008

 ldx #0
 lda $C01F,x

 sta $D007

 ldx #1
 lda $C01F,x

 sta $D009

 jsr MOVEPLAYER



 lda #20
 sta $03F2
 lda #15
 sta $03F3
 lda #20
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D002
 sta $033D
 lda $D003
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D002
 sta $033C
 lda $D003
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo126
 jmp GotoNo126
BranchNo126
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo127
 jmp GotoNo127
BranchNo127
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo128
 jmp GotoNo128
BranchNo128
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo129
 jmp GotoNo129
BranchNo129
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo129

GotoNo128

 lda #0
 sta $C011

 ldx $C026
PointLoopNo129
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo129

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo131
 jmp GotoNo131
BranchNo131
 ldx #0
 lda $C014,x

 sta $D00E

 ldx #0
 lda $C016,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo131

 lda #0
 tay
 ldx #0
 tya
 sta $C014,x


 lda $D41B
 tay
 ldx #0
 tya
 sta $C016,x


 ldx #0
 lda $C016,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo132
 jmp GotoNo132
BranchNo132
 lda #220
 tay
 ldx #0
 tya
 sta $C016,x


GotoNo132

 ldx #0
 lda $C016,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo133
 jmp GotoNo133
BranchNo133
 lda #50
 tay
 ldx #0
 tya
 sta $C016,x


GotoNo133

GotoNo127

 ldx #0
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo134
 jmp GotoNo134
BranchNo134
 jmp P1DEAD

GotoNo134

GotoNo126

 lda #20
 sta $03F2
 lda #15
 sta $03F3
 lda #20
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D004
 sta $033D
 lda $D005
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D004
 sta $033C
 lda $D005
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo135
 jmp GotoNo135
BranchNo135
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo136
 jmp GotoNo136
BranchNo136
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo137
 jmp GotoNo137
BranchNo137
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo138
 jmp GotoNo138
BranchNo138
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo138

GotoNo137

 lda #0
 sta $C011

 ldx $C026
PointLoopNo138
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo138

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo140
 jmp GotoNo140
BranchNo140
 ldx #1
 lda $C014,x

 sta $D00E

 ldx #1
 lda $C016,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo140

 lda #0
 tay
 ldx #1
 tya
 sta $C014,x


 lda $D41B
 tay
 ldx #1
 tya
 sta $C016,x


 ldx #1
 lda $C016,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo141
 jmp GotoNo141
BranchNo141
 lda #220
 tay
 ldx #1
 tya
 sta $C016,x


GotoNo141

 ldx #1
 lda $C016,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo142
 jmp GotoNo142
BranchNo142
 lda #50
 tay
 ldx #1
 tya
 sta $C016,x


GotoNo142

GotoNo136

 ldx #1
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo143
 jmp GotoNo143
BranchNo143
 jmp P1DEAD

GotoNo143

GotoNo135

 lda #20
 sta $03F2
 lda #15
 sta $03F3
 lda #20
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D006
 sta $033D
 lda $D007
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D006
 sta $033C
 lda $D007
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo144
 jmp GotoNo144
BranchNo144
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo145
 jmp GotoNo145
BranchNo145
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo146
 jmp GotoNo146
BranchNo146
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo147
 jmp GotoNo147
BranchNo147
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo147

GotoNo146

 lda #0
 sta $C011

 ldx $C026
PointLoopNo147
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo147

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo149
 jmp GotoNo149
BranchNo149
 ldx #0
 lda $C01D,x

 sta $D00E

 ldx #0
 lda $C01F,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo149

 lda #230
 tay
 ldx #0
 tya
 sta $C01D,x


 lda $D41B
 tay
 ldx #0
 tya
 sta $C01F,x


 ldx #0
 lda $C01F,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo150
 jmp GotoNo150
BranchNo150
 lda #220
 tay
 ldx #0
 tya
 sta $C01F,x


GotoNo150

 ldx #0
 lda $C01F,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo151
 jmp GotoNo151
BranchNo151
 lda #50
 tay
 ldx #0
 tya
 sta $C01F,x


GotoNo151

GotoNo145

 ldx #0
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo152
 jmp GotoNo152
BranchNo152
 jmp P1DEAD

GotoNo152

GotoNo144

 lda #20
 sta $03F2
 lda #15
 sta $03F3
 lda #20
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D008
 sta $033D
 lda $D009
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D008
 sta $033C
 lda $D009
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo153
 jmp GotoNo153
BranchNo153
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo154
 jmp GotoNo154
BranchNo154
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo155
 jmp GotoNo155
BranchNo155
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo156
 jmp GotoNo156
BranchNo156
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo156

GotoNo155

 lda #0
 sta $C011

 ldx $C026
PointLoopNo156
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo156

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo158
 jmp GotoNo158
BranchNo158
 ldx #1
 lda $C01D,x

 sta $D00E

 ldx #1
 lda $C01F,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo158

 lda #230
 tay
 ldx #1
 tya
 sta $C01D,x


 lda $D41B
 tay
 ldx #1
 tya
 sta $C01F,x


 ldx #1
 lda $C01F,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo159
 jmp GotoNo159
BranchNo159
 lda #220
 tay
 ldx #1
 tya
 sta $C01F,x


GotoNo159

 ldx #1
 lda $C01F,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo160
 jmp GotoNo160
BranchNo160
 lda #50
 tay
 ldx #1
 tya
 sta $C01F,x


GotoNo160

GotoNo154

 ldx #1
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo161
 jmp GotoNo161
BranchNo161
 jmp P1DEAD

GotoNo161

GotoNo153

 lda #20
 sta $03F2
 lda #20
 sta $03F3
 lda #30
 sta $03F0
 lda #5
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D00C
 sta $033D
 lda $D00D
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D00C
 sta $033C
 lda $D00D
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo162
 jmp GotoNo162
BranchNo162
 jmp P1DEAD

GotoNo162

 lda #10
 sta $03F2
 lda #20
 sta $03F3
 lda #5
 sta $03F0
 lda #25
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D00A
 sta $033D
 lda $D00B
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D00A
 sta $033C
 lda $D00B
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo163
 jmp GotoNo163
BranchNo163
 jmp P1DEAD

GotoNo163

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo102
ExitLoopNo102

P1DEAD

 lda #%10000000
 sta $D404


 lda #%01000000
 sta $D40B


 lda #203
 sta $7F8

 lda #0

 sta $C02B
; THIS IS ANIMFRAME

LoopNo164
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda $C02B
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo165
 jmp GotoNo165
BranchNo165
 lda $C02B

 clc
 adc #1

 sta $CFFF

 sta $C02B

GotoNo165

 lda $C02B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo166
 jmp GotoNo166
BranchNo166
 lda #204
 sta $7F8

GotoNo166

 lda $C02B
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo167
 jmp GotoNo167
BranchNo167
 lda #205
 sta $7F8

 jmp ExitLoopNo164


GotoNo167

 jmp LoopNo164
ExitLoopNo164

 lda #50

 sta $C02C
; THIS IS RESTART

LoopNo168
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo169
 jmp GotoNo169
BranchNo169
 lda $C02C

 sec
 sbc #1

 sta $CFFF

 sta $C02C

GotoNo169

 lda $C02C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo170
 jmp GotoNo170
BranchNo170
 jmp RESETGAME

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE
;$C00E IS NOW FREE
;$C00F IS NOW FREE
;$C010 IS NOW FREE
;$C011 IS NOW FREE
;$C012 IS NOW FREE
;$C013 IS NOW FREE
;$C014 IS NOW FREE
;$C016 IS NOW FREE
;$C018 IS NOW FREE
;$C01A IS NOW FREE
;$C01D IS NOW FREE
;$C01F IS NOW FREE
;$C021 IS NOW FREE
;$C023 IS NOW FREE
;$C01C IS NOW FREE
;$C00C IS NOW FREE
;$C025 IS NOW FREE
;$C026 IS NOW FREE
;$C027 IS NOW FREE
;$C028 IS NOW FREE
;$C029 IS NOW FREE
;$C02A IS NOW FREE
;$C02B IS NOW FREE
;$C02C IS NOW FREE

GotoNo170

 jmp LoopNo168
ExitLoopNo168


Wait1
 lda $d011
 bmi Wait1
Wait2
 lda $d012
Wait3
 cmp $d012
 beq Wait3
 lda $d011
 bpl Wait2
 rts
