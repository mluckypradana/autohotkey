#NoEnv
#SingleInstance force
SetWinDelay 0
Coordmode Mouse, Screen
Selecting := False

Locked  := False
Visible := True         ;<= determine start-up behaviour
global color := 0xFFFFFF

; use VirtualScreen here to support multiple monitors
; Maybe here is where I need to plant that other code? =============>>>>

xl=10         ;left screenpixel of horizontal crosshair
xr=1550       ;right

yt=10         ;upper screenpixel of vertical crosshair
yb=960       ;lower screenpixel

m1w:=xr-xl
m1h:=yb-yt

ID1 := Box(2,1,m1h)
ID2 := Box(3,m1w,1)

SetTimer Ruler, 10

if (Visible == False) {
    WinHide ahk_id %ID1%,, 
    WinHide ahk_id %ID2%,, 
}
Return

; === Toggle display of crosshairs
+F3::
	if(color == 0xFFFFFF)
		color := 0xFF0000
	else
		color := 0xFFFFFF
	ID1 := Box(2,1,m1h)
	ID2 := Box(3,m1w,1)
Return
F3::
if (Visible == True) {
    WinHide ahk_id %ID1%,,
    WinHide ahk_id %ID2%,,
    Visible := False
   }
else {
    WinShow ahk_id %ID1%,,
    WinShow ahk_id %ID2%,,
    Visible := True
}
Return

 ; Subroutines
ruler:
MouseGetPos, xpos,ypos
WinMove ahk_id %ID1%,, xpos ,yt
WinMove ahk_id %ID2%,, xl   ,ypos

WinSet, alwaysontop,on,ahk_id %ID1%   ;to get them ontop of other windows 
WinSet, alwaysontop,on,ahk_id %ID2%   ;that are also ontop
return 


Box(n,wide,high)
   {
      Gui %n%:Color, %color%, 0                  ; Red
      Gui %n%:-Caption +ToolWindow +E0x20 ; No title bar, No taskbar button, Transparent for clicks
      Gui %n%: Show, Center W%wide% H%high%      ; Show it
      WinGet ID, ID, A                    ; ...with HWND/handle ID
      Winset AlwaysOnTop,ON,ahk_id %ID%   ; Keep it always on the top
      WinSet Transparent,255,ahk_id %ID%  ; Opaque
      Return ID
   }

Esc::
ExitApp