
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
 byte #3,#128,#0
 byte #7,#192,#0
 byte #3,#128,#0
 byte #7,#192,#0
 byte #15,#224,#0
 byte #7,#192,#0
 byte #15,#224,#0
 byte #31,#240,#0
 byte #15,#224,#0
 byte #7,#192,#0
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
LoadDataNo0
 lda SpriteDataNo0,x
 sta $3000,x
 inx
 cpx #$3F
 bne LoadDataNo0

 ldx #0
 jmp LoadDataNo1
SpriteDataNo1
 byte #0,#112,#0
 byte #0,#248,#0
 byte #0,#112,#0
 byte #1,#240,#0
 byte #3,#248,#0
 byte #1,#240,#0
 byte #15,#224,#0
 byte #31,#240,#0
 byte #15,#224,#0
 byte #7,#192,#0
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
LoadDataNo1
 lda SpriteDataNo1,x
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
 byte #28,#0,#0
 byte #62,#0,#0
 byte #28,#0,#0
 byte #31,#0,#0
 byte #63,#128,#0
 byte #31,#0,#0
 byte #15,#224,#0
 byte #31,#240,#0
 byte #15,#224,#0
 byte #7,#192,#0
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
LoadDataNo2
 lda SpriteDataNo2,x
 sta $3080,x
 inx
 cpx #$3F
 bne LoadDataNo2

 ldx #0
 jmp LoadDataNo3
SpriteDataNo3
 byte #15,#128,#0
 byte #15,#128,#0
 byte #7,#0,#0
 byte #7,#0,#0
 byte #7,#0,#0
 byte #7,#0,#0
 byte #7,#0,#0
 byte #6,#0,#0
 byte #6,#0,#0
 byte #6,#0,#0
 byte #2,#0,#0
 byte #2,#0,#0
 byte #2,#0,#0
 byte #2,#0,#0
 byte #2,#0,#0
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
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #7,#192,#0
 byte #15,#224,#0
 byte #31,#240,#0
 byte #15,#224,#0
 byte #7,#192,#0
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

 lda #0

 sta $C00C
; THIS IS LINE

LoopNo6
 lda $C00C
 sta $CFFE
 lda #22
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo7
 jmp GotoNo7
BranchNo7
 jmp ExitLoopNo6


GotoNo7

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo8
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo8
 ldy #29
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
CompLoopNo9 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo9
 ldy #29
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo6
ExitLoopNo6

 lda #1
 sta $C00C

LoopNo10
 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo11
 jmp GotoNo11
BranchNo11
 jmp ExitLoopNo10


GotoNo11

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #23
CompLoopNo12
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo12
 ldy $C00C
 lda #160

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #23
CompLoopNo13 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo13
 ldy $C00C
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo10
ExitLoopNo10

 lda #1
 sta $C00C

 lda #1

 sta $C00D
; THIS IS LINE2

LoopNo14
 lda $C00D
 sta $CFFE
 lda #15
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo15
 jmp GotoNo15
BranchNo15
 jmp ExitLoopNo14


GotoNo15

LoopNo16
 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo17
 jmp GotoNo17
BranchNo17
 jmp ExitLoopNo16


GotoNo17

 lda $D41B
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo18
 jmp GotoNo18
BranchNo18
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00D
CompLoopNo19
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo19
 ldy $C00C
 lda #46

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00D
CompLoopNo20 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo20
 ldy $C00C
 lda #15

 sta ($00FB),y

GotoNo18

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo16
ExitLoopNo16

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

 jmp LoopNo14
ExitLoopNo14

 lda #0
 sta $D021

 lda #6
 sta $D020

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo21 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo21
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo22 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo22
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo23 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo23
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo24 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo24
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #35
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo26 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo26
 ldy #36
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
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
 ldy #31
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo28 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo28
 ldy #32
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo29 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo29
 ldy #33
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo30 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo30
 ldy #34
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
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
 ldy #35
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
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
 ldy #36
 lda #0

 sta ($00FB),y

 lda #195
 sta $7F9

 lda #195
 sta $7FA

 lda #195
 sta $7FB

 lda #192
 sta $7F8

 lda #196
 sta $7FC

 lda #1
 sta $D027

 lda #1
 sta $D02B

 lda #3
 sta $D028

 lda #3
 sta $D029

 lda #3
 sta $D02A

 lda #100
 sta $D000

 lda #215
 sta $D001

 lda #83
 sta $C00E
 lda #78
 sta $C00F
 lda #79
 sta $C010
 lda #87
 sta $C011
 lda #77
 sta $C012
 lda #65
 sta $C013
 lda #78
 sta $C014
 lda #96
 sta $C015
 lda #83
 sta $C016
 lda #76
 sta $C017
 lda #73
 sta $C018
 lda #68
 sta $C019
 lda #69
 sta $C01A
 lda #82
 sta $C01B
 lda #0
 sta $C01C
; THIS IS STARTMESSAGE

 lda #0

 sta $C00C
; THIS IS STARTCURSOR

LoopNo33
 ldx $C00C
 lda $C00E,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo34
 jmp GotoNo34
BranchNo34
 jmp ExitLoopNo33


GotoNo34

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo35
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo35
 lda $C00C

 clc
 adc #10

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
 lda $C00C

 clc
 adc #10

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

 jmp LoopNo33
ExitLoopNo33

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


LoopNo37
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo38
 jmp GotoNo38
BranchNo38
 jmp ExitLoopNo37


GotoNo38

 jmp LoopNo37
ExitLoopNo37

RESETGAME

 lda #%10000000
 sta $D404


 lda #%01000000
 sta $D40B


 lda #0

 sta $C00D
; THIS IS WIPE

LoopNo39
 lda $C00D
 sta $CFFE
 lda #14
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo40
 jmp GotoNo40
BranchNo40
 jmp ExitLoopNo39


GotoNo40

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo41
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo41
 lda $C00D

 clc
 adc #10

 sta $CFFF

 tay
 lda #32

 sta ($00FB),y

 lda $C00D

 clc
 adc #1

 sta $CFFF

 sta $C00D

 jmp LoopNo39
ExitLoopNo39

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #100
 sta $D000

 lda #215
 sta $D001

 lda #175
 sta $D008

 lda #215
 sta $D009

 lda #50
 sta $D003

 lda #100
 sta $D002

 lda #50
 sta $D005

 lda #150
 sta $D004

 lda #50
 sta $D007

 lda #175
 sta $D006

 lda #0

 sta $C00E
; THIS IS MOVLEFT

 lda #0

 sta $C00F
; THIS IS MOVRIGHT

 lda #10

 sta $C010
; THIS IS MOVTIME

 lda #20

 sta $C011
; THIS IS SLIDETIME

 jmp EXITMOVEICE
MOVEICE

 lda $D003

 clc
 adc #5

 sta $CFFF

 sta $D003

 lda $D005

 clc
 adc #8

 sta $CFFF

 sta $D005

 lda $D007

 clc
 adc #12

 sta $CFFF

 sta $D007

 lda $D003
 sta $CFFE
 lda #215
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo42
 jmp GotoNo42
BranchNo42
 lda #50
 sta $D003

 lda $D41B
 sta $D002

 lda $D002
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo43
 jmp GotoNo43
BranchNo43
 lda #240
 sta $D002

GotoNo43

 lda $D002
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo44
 jmp GotoNo44
BranchNo44
 lda #50
 sta $D002

GotoNo44

GotoNo42

 lda $D005
 sta $CFFE
 lda #215
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo45
 jmp GotoNo45
BranchNo45
 lda #50
 sta $D005

 lda $D41B
 sta $D004

 lda $D004
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo46
 jmp GotoNo46
BranchNo46
 lda #240
 sta $D004

GotoNo46

 lda $D004
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo47
 jmp GotoNo47
BranchNo47
 lda #50
 sta $D004

GotoNo47

GotoNo45

 lda $D007
 sta $CFFE
 lda #215
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo48
 jmp GotoNo48
BranchNo48
 lda #50
 sta $D007

 lda $D41B
 sta $D006

 lda $D006
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo49
 jmp GotoNo49
BranchNo49
 lda #240
 sta $D006

GotoNo49

 lda $D006
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo50
 jmp GotoNo50
BranchNo50
 lda #50
 sta $D006

GotoNo50

GotoNo48

 rts
EXITMOVEICE

 lda #30

 sta $C012
; THIS IS FALLTIME

 lda #30

 sta $C013
; THIS IS FALLRESET

 lda #200

 sta $C014
; THIS IS SPEEDTIME

 lda #0

 sta $C015
; THIS IS SOUNDTIME

LoopNo51
 lda $C015
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo52
 jmp GotoNo52
BranchNo52
 lda $C015

 sec
 sbc #1

 sta $CFFF

 sta $C015

GotoNo52

 lda $C015
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo53
 jmp GotoNo53
BranchNo53
 lda #%01000000
 sta $D40B


GotoNo53

 lda $C014
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo54
 jmp GotoNo54
BranchNo54
 lda $C014

 sec
 sbc #1

 sta $CFFF

 sta $C014

GotoNo54

 lda $C014
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo55
 jmp GotoNo55
BranchNo55
 lda $C013
 sta $CFFE
 lda #5
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo56
 jmp GotoNo56
BranchNo56
 lda $C013

 sec
 sbc #1

 sta $CFFF

 sta $C013

GotoNo56

 lda #200
 sta $C014

GotoNo55

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo57
 jmp GotoNo57
BranchNo57
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo57

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo58
 jmp GotoNo58
BranchNo58
 jsr MOVEICE



 lda $C013
 sta $C012

GotoNo58

 lda $D000
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo59
 jmp GotoNo59
BranchNo59
 lda #10
 sta $D000

GotoNo59

 lda $D000
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo60
 jmp GotoNo60
BranchNo60
 lda #240
 sta $D000

GotoNo60

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo61
 jmp GotoNo61
BranchNo61
 lda $C011

 sec
 sbc #1

 sta $CFFF

 sta $C011

GotoNo61

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo62
 jmp GotoNo62
BranchNo62
 lda $C00E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo63
 jmp GotoNo63
BranchNo63
 lda $C00E

 sec
 sbc #1

 sta $CFFF

 sta $C00E

GotoNo63

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo64
 jmp GotoNo64
BranchNo64
 lda $C00F

 sec
 sbc #1

 sta $CFFF

 sta $C00F

GotoNo64

 lda #20
 sta $C011

GotoNo62

 lda $C00F
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo65
 jmp GotoNo65
BranchNo65
 lda #10
 sta $C00F

GotoNo65

 lda $C00E
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo66
 jmp GotoNo66
BranchNo66
 lda #10
 sta $C00E

GotoNo66

 lda $D000

 clc
 adc $C00F

 sta $CFFF

 sta $D000

 lda $D000

 sec
 sbc $C00E

 sta $CFFF

 sta $D000

 lda #192
 sta $7F8

 lda #%00000100
 bit $DC01
 beq BranchNo67
 jmp GotoNo67
BranchNo67
 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo68
 jmp GotoNo68
BranchNo68
 lda $C010

 sec
 sbc #1

 sta $CFFF

 sta $C010

GotoNo68

 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo69
 jmp GotoNo69
BranchNo69
 lda $C00E

 clc
 adc #1

 sta $CFFF

 sta $C00E

 lda #10
 sta $C010

GotoNo69

 lda #194
 sta $7F8

GotoNo67

 lda #%00001000
 bit $DC01
 beq BranchNo70
 jmp GotoNo70
BranchNo70
 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo71
 jmp GotoNo71
BranchNo71
 lda $C010

 sec
 sbc #1

 sta $CFFF

 sta $C010

GotoNo71

 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo72
 jmp GotoNo72
BranchNo72
 lda $C00F

 clc
 adc #1

 sta $CFFF

 sta $C00F

 lda #10
 sta $C010

GotoNo72

 lda #193
 sta $7F8

GotoNo70

 lda #5
 sta $03F2
 lda #25
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
 beq BranchNo73
 jmp GotoNo73
BranchNo73
 jmp GAMEOVER

GotoNo73

 lda #5
 sta $03F2
 lda #25
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
 beq BranchNo74
 jmp GotoNo74
BranchNo74
 jmp GAMEOVER

GotoNo74

 lda #5
 sta $03F2
 lda #25
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
 beq BranchNo75
 jmp GotoNo75
BranchNo75
 jmp GAMEOVER

GotoNo75

 lda #10
 sta $03F2
 lda #25
 sta $03F3
 lda #10
 sta $03F0
 lda #25
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
 beq BranchNo76
 jmp GotoNo76
BranchNo76
 lda #%01000001
 sta $D40B


 lda #5
 sta $C015

 ldx #25
PointLoopNo76
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo76

 lda $D41B
 sta $D008

 lda $D008
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo78
 jmp GotoNo78
BranchNo78
 lda #240
 sta $D008

GotoNo78

 lda $D008
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo79
 jmp GotoNo79
BranchNo79
 lda #50
 sta $D008

GotoNo79

GotoNo76

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo51
ExitLoopNo51

GAMEOVER

 lda #%01000000
 sta $D40B


 lda #%10000001
 sta $D404


 lda #192
 sta $7F8

 lda #0

 sta $C016
; THIS IS CURSOR

 lda #71
 sta $C01D
 lda #65
 sta $C01E
 lda #77
 sta $C01F
 lda #69
 sta $C020
 lda #96
 sta $C021
 lda #79
 sta $C022
 lda #86
 sta $C023
 lda #69
 sta $C024
 lda #82
 sta $C025
 lda #0
 sta $C026
; THIS IS MESSAGE

 lda #15

 sta $C017
; THIS IS CRASHTIME

LoopNo80
 ldx $C016
 lda $C01D,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo81
 jmp GotoNo81
BranchNo81
 jmp ExitLoopNo80


GotoNo81

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo82
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo82
 lda $C016

 clc
 adc #10

 sta $CFFF

 tay
 ldx $C016
 lda $C01D,x

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo83 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo83
 lda $C016

 clc
 adc #10

 sta $CFFF

 tay
 lda #1

 sta ($00FB),y

 lda $C016

 clc
 adc #1

 sta $CFFF

 sta $C016

 jmp LoopNo80
ExitLoopNo80

LoopNo84
 lda $C017
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo85
 jmp GotoNo85
BranchNo85
 lda $C017

 sec
 sbc #1

 sta $CFFF

 sta $C017

GotoNo85

 lda $C017
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo86
 jmp GotoNo86
BranchNo86
 lda #%10000000
 sta $D404


GotoNo86

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo87
 jmp GotoNo87
BranchNo87
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
;$C015 IS NOW FREE
;$C016 IS NOW FREE
;$C01D IS NOW FREE
;$C017 IS NOW FREE

GotoNo87

 jmp LoopNo84
ExitLoopNo84


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

