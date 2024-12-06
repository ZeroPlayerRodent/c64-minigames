
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
 byte #0,#112,#0
 byte #0,#248,#0
 byte #0,#112,#0
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
 byte #0,#0,#3
 byte #0,#0,#31
 byte #0,#0,#240
 byte #0,#7,#128
 byte #0,#60,#0
 byte #1,#224,#0
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
LoadDataNo1
 lda SpriteDataNo1,x
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
 byte #7,#255,#255
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
 byte #192,#0,#0
 byte #248,#0,#0
 byte #15,#0,#0
 byte #1,#224,#0
 byte #0,#60,#0
 byte #0,#7,#128
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
LoadDataNo3
 lda SpriteDataNo3,x
 sta $30C0,x
 inx
 cpx #$3F
 bne LoadDataNo3

 ldx #0
 jmp LoadDataNo4
SpriteDataNo4
 byte #255,#255,#224
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
 byte #63,#192,#0
 byte #127,#224,#0
 byte #224,#112,#0
 byte #192,#48,#0
 byte #192,#48,#0
 byte #224,#112,#0
 byte #127,#224,#0
 byte #63,#192,#0
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
LoadDataNo5
 lda SpriteDataNo5,x
 sta $3140,x
 inx
 cpx #$3F
 bne LoadDataNo5

 lda #0
 sta $D021

 lda #12
 sta $D020

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo7 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo7
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo8 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo8
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo10 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo10
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo11 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo11
 ldy #35
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo12 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo12
 ldy #36
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
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
 ldy #31
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo14 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo14
 ldy #32
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo15 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo15
 ldy #33
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo16 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo16
 ldy #34
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo17 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo17
 ldy #35
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
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
 ldy #36
 lda #0

 sta ($00FB),y

 lda #1

 sta $C00C
; THIS IS LINE

LoopNo19
 lda $C00C
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

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo21
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo21
 ldy #28
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
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
 ldy #28
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo19
ExitLoopNo19

 lda #1
 sta $C00C

LoopNo23
 lda $C00C
 sta $CFFE
 lda #23
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo24
 jmp GotoNo24
BranchNo24
 jmp ExitLoopNo23


GotoNo24

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo25
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo25
 ldy #14
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
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
 ldy #14
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo23
ExitLoopNo23

 lda #80
 sta $C00D
 lda #73
 sta $C00E
 lda #78
 sta $C00F
 lda #66
 sta $C010
 lda #65
 sta $C011
 lda #76
 sta $C012
 lda #76
 sta $C013
 lda #0
 sta $C014
; THIS IS STARTMESSAGE

 lda #0

 sta $C00C
; THIS IS STARTCURSOR

LoopNo27
 ldx $C00C
 lda $C00D,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo28
 jmp GotoNo28
BranchNo28
 jmp ExitLoopNo27


GotoNo28

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #4
CompLoopNo29
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo29
 lda $C00C

 clc
 adc #4

 sta $CFFF

 tay
 ldx $C00C
 lda $C00D,x

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #4
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
 lda $C00C

 clc
 adc #4

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

 jmp LoopNo27
ExitLoopNo27

 lda #230
 sta $D003

 lda #230
 sta $D005

 lda #150
 sta $D004

 lda #200
 sta $D002

 lda #7
 sta $D028

 lda #7
 sta $D029

 lda #14
 sta $D027

 lda #5
 sta $D02A

 lda #5
 sta $D02B

 lda #5
 sta $D02C

 lda #185
 sta $D006

 lda #135
 sta $D007

 lda #150
 sta $D008

 lda #95
 sta $D009

 lda #220
 sta $D00A

 lda #95
 sta $D00B

 lda #192
 sta $7F8

 lda #193
 sta $7F9

 lda #195
 sta $7FA

 lda #197
 sta $7FB

 lda #197
 sta $7FC

 lda #197
 sta $7FD

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


LoopNo31
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo32
 jmp GotoNo32
BranchNo32
 jmp RESETGAME

GotoNo32

 jmp LoopNo31
ExitLoopNo31

RESETGAME

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #4

 sta $C00D
; THIS IS BALLS

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #3
CompLoopNo33
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo33
 ldy #31
 lda #48

 clc
 adc $C00D

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #3
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
 ldy #31
 lda #1

 sta ($00FB),y

NEWBALL

 lda #192
 sta $7F8

 lda #193
 sta $7F9

 lda #195
 sta $7FA

 lda #197
 sta $7FB

 lda #197
 sta $7FC

 lda #197
 sta $7FD

 lda #50
 sta $D001

 lda #175
 sta $D000

 lda #0

 sta $C00E
; THIS IS BALLDOWN

 lda #0

 sta $C00F
; THIS IS BALLUP

 lda #0

 sta $C010
; THIS IS BALLRIGHT

 lda #0

 sta $C011
; THIS IS BALLLEFT

 lda #10

 sta $C012
; THIS IS GRAVTIME

 lda #10

 sta $C013
; THIS IS GRAVRESET

 lda #0

 sta $C014
; THIS IS BALLROLLING

 lda #0

 sta $C00C
; THIS IS LEFTFLIP

 lda #0

 sta $C015
; THIS IS RIGHTFLIP

 lda #0

 sta $C016
; THIS IS LEFTBOUNCE

 lda #0

 sta $C017
; THIS IS RIGHTBOUNCE

 lda #0

 sta $C018
; THIS IS LEFTCOOL

 lda #0

 sta $C019
; THIS IS RIGHTCOOL

 lda #0

 sta $C01A
; THIS IS BINGTIME

 lda #2

 sta $C01B
; THIS IS SPECIAL

LoopNo35
 lda $C011
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo36
 jmp GotoNo36
BranchNo36
 lda #1
 sta $C011

GotoNo36

 lda $C010
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo37
 jmp GotoNo37
BranchNo37
 lda #1
 sta $C010

GotoNo37

 lda #5
 sta $D02A

 lda #5
 sta $D02B

 lda #5
 sta $D02C

 lda $C01B
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo38
 jmp GotoNo38
BranchNo38
 lda #2
 sta $D02A

GotoNo38

 lda $C01B
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo39
 jmp GotoNo39
BranchNo39
 lda #2
 sta $D02B

GotoNo39

 lda $C01B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo40
 jmp GotoNo40
BranchNo40
 lda #2
 sta $D02C

GotoNo40

 lda $C01A
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo41
 jmp GotoNo41
BranchNo41
 lda $C01A

 sec
 sbc #1

 sta $CFFF

 sta $C01A

GotoNo41

 lda $C01A
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo42
 jmp GotoNo42
BranchNo42
 lda #%01000000
 sta $D40B


GotoNo42

 lda $D001
 sta $CFFE
 lda #40
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo43
 jmp GotoNo43
BranchNo43
 jmp GAMEOVER

GotoNo43

 lda $C00C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo44
 jmp GotoNo44
BranchNo44
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo44

 lda $C015
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo45
 jmp GotoNo45
BranchNo45
 lda $C015

 sec
 sbc #1

 sta $CFFF

 sta $C015

GotoNo45

 lda $C018
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo46
 jmp GotoNo46
BranchNo46
 lda $C018

 sec
 sbc #1

 sta $CFFF

 sta $C018

GotoNo46

 lda $C019
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo47
 jmp GotoNo47
BranchNo47
 lda $C019

 sec
 sbc #1

 sta $CFFF

 sta $C019

GotoNo47

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo48
 jmp GotoNo48
BranchNo48
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo48

 lda $C014
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo49
 jmp GotoNo49
BranchNo49
 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo50
 jmp GotoNo50
BranchNo50
 lda $C00E
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo51
 jmp GotoNo51
BranchNo51
 lda $C00E

 clc
 adc #1

 sta $CFFF

 sta $C00E

GotoNo51

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo52
 jmp GotoNo52
BranchNo52
 lda $C00F

 sec
 sbc #1

 sta $CFFF

 sta $C00F

GotoNo52

 lda $C013
 sta $C012

GotoNo50

 lda $D001

 clc
 adc $C00E

 sta $CFFF

 sta $D001

 lda $D001

 sec
 sbc $C00F

 sta $CFFF

 sta $D001

 lda $D000

 clc
 adc $C010

 sta $CFFF

 sta $D000

 lda $D000

 sec
 sbc $C011

 sta $CFFF

 sta $D000

GotoNo49

 lda $C014
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo53
 jmp GotoNo53
BranchNo53
 lda $D001

 clc
 adc #1

 sta $CFFF

 sta $D001

 lda $D000

 clc
 adc #2

 sta $CFFF

 sta $D000

 lda #%00000100
 bit $DC01
 beq BranchNo54
 jmp GotoNo54
BranchNo54
 lda $D001

 sec
 sbc #1

 sta $CFFF

 sta $D001

GotoNo54

 lda #1
 sta $C010

 lda #0
 sta $C011

GotoNo53

 lda $C014
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo55
 jmp GotoNo55
BranchNo55
 lda $D001

 clc
 adc #1

 sta $CFFF

 sta $D001

 lda $D000

 sec
 sbc #2

 sta $CFFF

 sta $D000

 lda #%00001000
 bit $DC01
 beq BranchNo56
 jmp GotoNo56
BranchNo56
 lda $D001

 sec
 sbc #1

 sta $CFFF

 sta $D001

GotoNo56

 lda #1
 sta $C011

 lda #0
 sta $C010

GotoNo55

 lda $D000
 sta $CFFE
 lda #225
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo57
 jmp GotoNo57
BranchNo57
 lda $C010
 sta $C011

 lda #0
 sta $C010

GotoNo57

 lda $D000
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo58
 jmp GotoNo58
BranchNo58
 lda $C011
 sta $C010

 lda #0
 sta $C011

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
 lda #0
 sta $C00F

GotoNo59

 lda #0
 sta $C014

 lda $D000
 sta $CFFE
 lda $D004

 sec
 sbc #30

 sta $CFFF

 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo60
 jmp GotoNo60
BranchNo60
 lda $D000
 sta $CFFE
 lda $D004

 clc
 adc #20

 sta $CFFF

 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo61
 jmp GotoNo61
BranchNo61
 lda $D001
 sta $CFFE
 lda $D005

 sec
 sbc #5

 sta $CFFF

 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo62
 jmp GotoNo62
BranchNo62
 lda $D001
 sta $CFFE
 lda $D005

 clc
 adc #20

 sta $CFFF

 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo63
 jmp GotoNo63
BranchNo63
 lda #0
 sta $C00E

 lda #1
 sta $C014

 lda $C00C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo64
 jmp GotoNo64
BranchNo64
 lda #0
 sta $C014

 lda #8
 sta $C00F

 lda $D001

 sec
 sbc #10

 sta $CFFF

 sta $D001

GotoNo64

GotoNo63

GotoNo62

GotoNo61

GotoNo60

 lda $D000
 sta $CFFE
 lda $D002

 sec
 sbc #18

 sta $CFFF

 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo65
 jmp GotoNo65
BranchNo65
 lda $D000
 sta $CFFE
 lda $D002

 clc
 adc #30

 sta $CFFF

 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo66
 jmp GotoNo66
BranchNo66
 lda $D001
 sta $CFFE
 lda $D003

 sec
 sbc #5

 sta $CFFF

 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo67
 jmp GotoNo67
BranchNo67
 lda $D001
 sta $CFFE
 lda $D003

 clc
 adc #20

 sta $CFFF

 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo68
 jmp GotoNo68
BranchNo68
 lda #0
 sta $C00E

 lda #2
 sta $C014

 lda $C015
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo69
 jmp GotoNo69
BranchNo69
 lda #0
 sta $C014

 lda #8
 sta $C00F

 lda $D001

 sec
 sbc #10

 sta $CFFF

 sta $D001

GotoNo69

GotoNo68

GotoNo67

GotoNo66

GotoNo65

 lda #20
 sta $03F2
 lda #5
 sta $03F3
 lda #5
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
 beq BranchNo70
 jmp GotoNo70
BranchNo70
 ldx #25
PointLoopNo70
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo70

 lda $C01B
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo72
 jmp GotoNo72
BranchNo72
 ldx #75
PointLoopNo72
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo72

 lda $C01B

 clc
 adc #1

 sta $CFFF

 sta $C01B

 lda $C01B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo74
 jmp GotoNo74
BranchNo74
 lda #1
 sta $C01B

GotoNo74

GotoNo72

 lda #3
 sta $C01A

 lda #%01000001
 sta $D40B


 lda $D001
 sta $CFFE
 lda $D007
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo75
 jmp GotoNo75
BranchNo75
 lda #0
 sta $C00E

 lda $D41B
 sta $CFFE
 lda #5
 and $CFFE

 clc
 adc #1

 sta $CFFF

 sta $C00F

GotoNo75

 lda $D001
 sta $CFFE
 lda $D007
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo76
 jmp GotoNo76
BranchNo76
 lda #2
 sta $C00E

 lda #0
 sta $C00F

GotoNo76

 lda $D000

 clc
 adc #10

 sta $CFFF

 sta $CFFE
 lda $D006
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo77
 jmp GotoNo77
BranchNo77
 lda #0
 sta $C011

 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C010

GotoNo77

 lda $D000

 clc
 adc #10

 sta $CFFF

 sta $CFFE
 lda $D006
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo78
 jmp GotoNo78
BranchNo78
 lda #0
 sta $C011

 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C010

GotoNo78

 lda $D000

 clc
 adc #10

 sta $CFFF

 sta $CFFE
 lda $D006
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo79
 jmp GotoNo79
BranchNo79
 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C011

 lda #0
 sta $C010

GotoNo79

GotoNo70

 lda #20
 sta $03F2
 lda #5
 sta $03F3
 lda #5
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
 beq BranchNo80
 jmp GotoNo80
BranchNo80
 ldx #25
PointLoopNo80
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo80

 lda $C01B
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo82
 jmp GotoNo82
BranchNo82
 ldx #75
PointLoopNo82
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo82

 lda $C01B

 clc
 adc #1

 sta $CFFF

 sta $C01B

 lda $C01B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo84
 jmp GotoNo84
BranchNo84
 lda #1
 sta $C01B

GotoNo84

GotoNo82

 lda #3
 sta $C01A

 lda #%01000001
 sta $D40B


 lda $D001
 sta $CFFE
 lda $D009
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo85
 jmp GotoNo85
BranchNo85
 lda #0
 sta $C00E

 lda $D41B
 sta $CFFE
 lda #5
 and $CFFE

 clc
 adc #1

 sta $CFFF

 sta $C00F

GotoNo85

 lda $D001
 sta $CFFE
 lda $D009
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo86
 jmp GotoNo86
BranchNo86
 lda #2
 sta $C00E

 lda #0
 sta $C00F

GotoNo86

 lda $D000
 sta $CFFE
 lda $D008
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo87
 jmp GotoNo87
BranchNo87
 lda #0
 sta $C011

 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C010

GotoNo87

 lda $D000
 sta $CFFE
 lda $D008
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo88
 jmp GotoNo88
BranchNo88
 lda #0
 sta $C011

 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C010

GotoNo88

 lda $D000

 clc
 adc #10

 sta $CFFF

 sta $CFFE
 lda $D008
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo89
 jmp GotoNo89
BranchNo89
 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C011

 lda #0
 sta $C010

GotoNo89

GotoNo80

 lda #20
 sta $03F2
 lda #5
 sta $03F3
 lda #5
 sta $03F0
 lda #15
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
 beq BranchNo90
 jmp GotoNo90
BranchNo90
 ldx #25
PointLoopNo90
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo90

 lda $C01B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo92
 jmp GotoNo92
BranchNo92
 ldx #75
PointLoopNo92
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo92

 lda $C01B

 clc
 adc #1

 sta $CFFF

 sta $C01B

 lda $C01B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo94
 jmp GotoNo94
BranchNo94
 lda #1
 sta $C01B

GotoNo94

GotoNo92

 lda #3
 sta $C01A

 lda #%01000001
 sta $D40B


 lda $D001
 sta $CFFE
 lda $D00B
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo95
 jmp GotoNo95
BranchNo95
 lda #0
 sta $C00E

 lda $D41B
 sta $CFFE
 lda #5
 and $CFFE

 clc
 adc #1

 sta $CFFF

 sta $C00F

GotoNo95

 lda $D001
 sta $CFFE
 lda $D00B
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo96
 jmp GotoNo96
BranchNo96
 lda #2
 sta $C00E

 lda #0
 sta $C00F

GotoNo96

 lda $D000
 sta $CFFE
 lda $D00A
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo97
 jmp GotoNo97
BranchNo97
 lda #0
 sta $C011

 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C010

GotoNo97

 lda $D000
 sta $CFFE
 lda $D00A
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo98
 jmp GotoNo98
BranchNo98
 lda #0
 sta $C011

 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C010

GotoNo98

 lda $D000

 clc
 adc #10

 sta $CFFF

 sta $CFFE
 lda $D00A
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo99
 jmp GotoNo99
BranchNo99
 lda $D41B
 sta $CFFE
 lda #3
 and $CFFE

 sta $C011

 lda #0
 sta $C010

GotoNo99

GotoNo90

 lda #193
 sta $7F9

 lda #195
 sta $7FA

 lda #%00001000
 bit $DC01
 beq BranchNo100
 jmp GotoNo100
BranchNo100
 lda #194
 sta $7F9

 lda #0
 sta $CFFE
 lda $C017
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo101
 jmp GotoNo101
BranchNo101
 lda #0
 sta $CFFE
 lda $C019
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo102
 jmp GotoNo102
BranchNo102
 lda #30
 sta $C015

 lda #1
 sta $C017

GotoNo102

GotoNo101

 jmp SKIPRIGHT

GotoNo100

 lda #0
 sta $C017

 lda #0
 sta $C015

SKIPRIGHT

 lda #%00000100
 bit $DC01
 beq BranchNo103
 jmp GotoNo103
BranchNo103
 lda #196
 sta $7FA

 lda #0
 sta $CFFE
 lda $C016
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo104
 jmp GotoNo104
BranchNo104
 lda #0
 sta $CFFE
 lda $C018
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo105
 jmp GotoNo105
BranchNo105
 lda #30
 sta $C00C

 lda #1
 sta $C016

GotoNo105

GotoNo104

 jmp SKIPLEFT

GotoNo103

 lda #0
 sta $C00C

 lda #0
 sta $C016

SKIPLEFT

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo35
ExitLoopNo35

GAMEOVER

 lda #%01000000
 sta $D40B


 lda #10

 sta $C01C
; THIS IS BOOMTIME

 lda #%10000001
 sta $D404


 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo106
 jmp GotoNo106
BranchNo106
 lda $C00D

 sec
 sbc #1

 sta $CFFF

 sta $C00D

GotoNo106

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #3
CompLoopNo107
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo107
 ldy #31
 lda #48

 clc
 adc $C00D

 sta $CFFF


 sta ($00FB),y

LoopNo108
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo109
 jmp GotoNo109
BranchNo109
 lda $C01C

 sec
 sbc #1

 sta $CFFF

 sta $C01C

GotoNo109

 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo110
 jmp GotoNo110
BranchNo110
 lda #%10000000
 sta $D404


GotoNo110

 lda #%00010000
 bit $DC01
 beq BranchNo111
 jmp GotoNo111
BranchNo111
 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo112
 jmp GotoNo112
BranchNo112
 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo113
 jmp GotoNo113
BranchNo113
 jmp NEWBALL

GotoNo113

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
;$C00C IS NOW FREE
;$C015 IS NOW FREE
;$C016 IS NOW FREE
;$C017 IS NOW FREE
;$C018 IS NOW FREE
;$C019 IS NOW FREE
;$C01A IS NOW FREE
;$C01B IS NOW FREE
;$C01C IS NOW FREE

GotoNo112

GotoNo111

 jmp LoopNo108
ExitLoopNo108


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
