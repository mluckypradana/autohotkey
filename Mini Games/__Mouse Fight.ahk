SetMouseDelay,-1 ;remove delays from mouse action
;#Include __GB.ahk
ys := [] ; initiate the array object
ys[1] := 728
ys[2] := 716
ys[3] := 701
ys[4] := 684
ys[5] := 668
ys[6] := 653
ys[7] := 637
ys[8] := 621
ys[9] := 604
ys[10] := 588
ys[11] := 574
startX = 373
endX = 801
;get slot
MButton & WheelUp::
	Send q
Return

;click lobby
MButton & LButton::
	Send e
Return

;Back from lobby
MButton & WheelDown::
	Send w
Return

;Alt tab
MButton & RButton::
	Send r
Return

