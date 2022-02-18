
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
/*
// by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr
// File/Project history:
 1.00.000 -- Today (PL) -- Lastest version (updated regularly!).
 0.01.000 -- 2013/02/12 (PL) -- Creation.
*/
/* Copyright notice: For details, see the following file:
http://Phi.Lho.free.fr/softwares/PhiLhoSoft/PhiLhoSoftLicence.txt
This program is distributed under the zlib/libpng license.
Copyright (c) 2013 Philippe Lhoste / PhiLhoSoft
*/
/*
Automated writer writes texts with the mouse, on a target window.
Designed for BigCanvas:
http://bigcanvas.frozenfractal.com/
Tested with Paint, can work on all similar programs.
*/
#SingleInstance Force
#NoEnv
SendMode Input
StringCaseSense On
SetTitleMatchMode RegEx

;Speed controls how fast the script runs. 1 is the fastest, 100 is the slowest. Default is 2.
speed = 2
; Scale controls how big the drawing will be
scale = 3
; Offsets
offsetX = 0
offsetY = 0

command = X
prevX = 0
prevY = 0

; Better keep digits at fixed width
_0 = v -16:h 8:v 16:h -8:m 4,-7:v -2:m 8,9
_1 = h 8:m -4,0:v -16:l -4,4:m 12,12
_2 = m 8,0:h -8:l 8,-10:v -6:h -8:v 4:m 12,12
_3 = h 8:v -8:h -4:m 4,0:v -8:h -8:m 12,16
_4 = m 6,0:v -16:l -6,12:h 8:m 4,4
_5 = m 8,-16:h -8:v 8:h 6:l 2,2:v 4:l -2,2:h -6:m 12,0
_6 =  m 8,-16:l -8,8:v 8:h 8:v -8:h -8:m 12,8
_7 = l 8,-16:h -8:m 12,16
_8 = h 8:v -6:l -8,-4:v -6:h 8:v 6:l -8,4:v 6:m 12,0
_9 = l 8,-8:v -8:h -8:v 8:h 8:m 4,8

_a = m 0,-8:h 8:v 8:h -8:v -4:h 8:m 4,4
_b = m 0,-16:v 16:h 8:v -8:h -8:m 12,8
_c = v -8:h 8:m -8,8:h 8:m 4,0
_d = m 8,-16:v 16:h -8:v -8:h 8:m 4,8
_e = m 8,0:h -8:v -8:h 8:v 4:h -8:m 12,4
_f = m 2,0:v -16:h 4:m -8,8:h 8:m 4,8
_g = m 0,12:h 8:v -20:h -8:v 8:h 8:m 4,0
_h = v -16:m 0,8:h 8:v 8:m 4,0
_i = v -8:m 0,-2:v -2:m 4,12
_j = m -4,12:h 4:v -20:m 0,-2:v -2:m 4,12
_k = v -16:m 8,16:l -8,-4:l 8,-4:m 4,8
_l = v -16:m 4,16
_m = v -8:h 4:v 4:m 0,-4:h 4:v 8:m 4,0
_n = v -8:h 8:v 8:m 4,0
_o = v -8:h 8:v 8:h -8:m 12,0
_p = m 0,12:v -20:h 8:v 8:h -8:m 12,0
_q = m 8,12:v -20:h -8:v 8:h 8:m 4,0
_r = v -8:h 8:m 4,8
_s = h 8:v -4:h -8:v -4:h 8:m 4,8
_t = m 2,-16:v 16:h 4:m -8,-8:h 8:m 4,8
_u = m 0,-8:v 8:h 8:v -8:m 4,8
_v = m 0,-8:l 4,8:l 4,-8:m 4,8
_w = m 0,-8:v 8:h 4:v -4:m 0,4:h 4:v -8:m 4,8
_x = l 8,-8:m -8,0:l 8,8:m 4,0
_y = m 0,-8:l 4,4:m 4,-4:l -8,12:m 12,-4
_z = m 0,-8:h 8:l -8,8:h 8:m 4,0

; Need to suffix variable names with $ because AHK variable names are case-insensitive!
_A$ = v -16:h 8:v 16:m -8,-8:h 8:m 4,8
;~ _B$ = v -16:h 6:l 2,2:v 4:l -2,2:h -6:m 6,0:l 2,2:v 4:l -2,2:h -6:m 12,0
_B$ = v -16:h 6:v 8:h -6:m 6,0:h 2:v 8:h -8:m 12,0
_C$ = m 8,0:h -8:v -16:h 8:m 4,16
;~ _D$ = v -16:h 6:l 2,2:v 12:l -2,2:h -6:m 12,0
_D$ = v -16:h 4:l 4,8:v 8:h -8:m 12,0
_E$ = v -16:h 8:m -8,8:h 8:m -8,8:h 8:m 4,0
_F$ = v -16:h 8:m -8,8:h 8:m 4,8
_G$ = m 8,-16:h -8:v 16:h 8:v -8:h -4:m 8,8
_H$ = v -16:m 0,8:h 8:m 0,-8:v 16:m 4,0
_I$ = h 4:m -2,0:v -16:m -2,0:h 4:m 4,16
_J$ = m 0,-2:v 2:h 8:v -16:m -2,0:h 4:m 4,16
_K$ = v -16:m 0,8:l 8,-8:m -8,8:l 8,8:m 4,0
_L$ = m 0,-16:v 16:h 8:m 4,0
_M$ = v -16:l 4,8:l 4,-8:v 16:m 4,0
_N$ = v -16:l 8,16:v -16:m 4,16
_O$ = v -16:h 8:v 16:h -8:m 12,0
_P$ = v -16:h 8:v 8:h -8:m 12,8
_Q$ = v -16:h 8:v 16:h -8:m 6,-4:l 4,8:m 2,-4
_R$ = v -16:h 8:v 8:h -8:l 8,8:m 4,0
_S$ = h 8:v -8:h -8:v -8:h 8:m 4,16
_T$ = m 4,0:v -16:m -4,0:h 8:m 4,16
_U$ = m 0,-16:v 16:h 8:v -16:m 4,16
_V$ = m 0,-16:l 8,16:l 8,-16:m 4,16
_W$ = m 0,-16:v 16:l 4,-8:l 4,8:v -16:m 4,16
_X$ = l 8,-16:m -8,0:l 8,16:m 4,0
_Y$ = m 4,0:v -8:l -4,-8:m 8,0:l -4,8:m 8,8
_Z$ = m 0,-16:h 8:l -8,16:h 8:m 4,0
; Conversion of punctuation to valid identifier names. Limited to common signs only...
PunctList     = ,.;: -+*/=?!()@&'"`%_
PunctToLetter = cdsC_DPMSeIEoOaAqQpu
; Comma
_@c = m 0,-2:v 4:m 4,-2
; Dot
_@d = v -2:m 4,2
; Semi-colon
_@s = m 0,-8:v 2:m 0,4:v 4:m 4,-2
; Colon
_@C$ =  v -2:m 0,-4:v -2:m 4,8
; Space
_@_ = m 6,0
; Dash
_@D$ = m 0,-6:h 6:m 4,6
; Plus
_@P$ = m 4,-2:v -8:m -4,4:h 8:m 4,6
; Multiply
_@M$ = m 0,-6:h 8:m -8,4:l 8,-8:m -8,0:l 8,8:m 4,2
; Slash
_@S$ = l 8,-16:m 4,16
; Equals
_@e = m 0,-4:h 8:m -8,-4:h 8:m 4,8
; Question mark / Interrogation point
_@I$ = m 4,0:v -2:m 0,-2:v -4:h 4:v -8:h -8:v 4:m 12,12
; Exclamation mark
_@E$ = v -2:m 0,-2:v -12:m 4,16
; Commercial at (arobase)
_@a = m 16,4:h -16:v -20:h 16:v 16:h -12:v -8:h 8:v 8:m 8,0
; Ampersand
_@A$ = m 12,0:l -12,-12:v -4:h 8:v 4:l -8,8:v 4:h 4:l 8,-8:m 4,8
; Single Quote
_@q = m 0,-14:v 4:m 4,10
; Double Quote
_@Q$ = m 0,-14:v 4:m 4,-4:v 4:m 4,10
; Percent
_@p = l 8,-12:m -8,0:h 2:v 2:h -2:v -2:m 8,12:h -2:v -2:h 2:v 2:m 4,0
; Underscore
_@u = h 8:m 4,0

; Shift+Win+W = fast exit if things go wrong...
+#w:: ExitApp
; Shift+Win+R = reload the script (after changes)
+#R:: Reload

+#T::
InputBox text, Enter text to type
If ErrorLevel
	Return ; Cancelled

WinActivate Paint
;~ WinActivate Bigcanvas.*Firefox

Loop Parse, text
{
;~ 	MsgBox %A_LoopField%
	; Memorize current position, reference point for the absolute moves
	MouseGetPos startX, startY
	pos := InStr(PunctList, A_LoopField)
	If (pos > 0)
	{
		subst := SubStr(PunctToLetter, pos, 1)
		sign = @%subst%
		If subst is upper
		{
			; Uppercase symbol
			sign .= "$"
		}
;~ 			msgbox Subst: %pos% %subst% %sign%
	}
	Else
	{
		sign := A_LoopField
		If sign is upper
		{
			; Uppercase symbol
			sign .= "$"
		}
	}
	instrVar = _%sign%
	instructions := %instrVar%
;~ 	msgbox %A_LoopField% | %pos% | %subst% | %instrVar% | %instructions%
	Loop Parse, instructions, :
	{
		parseOrder(A_LoopField)
	}
}
Return

parseOrder(order)
{
	Global prevX, prevY, startX, startY

	command := getCommand(order)
	x := getX(order)
	y := getY(order)
;~ 	msgbox %order% => %command% %x% %y%
	If (command == "M")
	{
		x -= startX
		y -= startY
		moveTo(x, y)
	}
	Else If (command == "m")
	{
		moveTo(x, y)
	}
	Else If (command == "L")
	{
		x -= startX
		y -= startY
		lineTo(x, y)
	}
	Else If (command == "l")
	{
		lineTo(x, y)
	}
	Else If (command == "H")
	{
		x -= startX
		lineTo(x, y)
	}
	Else If (command == "h")
	{
		lineTo(x, prevY)
	}
	Else If (command == "V")
	{
		y -= startY
		lineTo(x, y)
	}
	Else If (command == "v")
	{
		lineTo(prevX, x) ; Only one parameter so the y value is in the 'x' variable
	}
	prevX = x
	prevY = y
}

getCommand(order)
{
	Return SubStr(order, 1, 1)
}
getX(order)
{
	Global scale, offsetX
	RegExMatch(order, ". ([+-]?[\d.]+)", x)
	Return x1 * scale + offsetX
}
getY(order)
{
	Global scale, offsetY
	RegExMatch(order, ". [+-]?[\d.]+,([+-]?[\d.]+)", y)
	Return y1 * scale + offsetY
}

moveTo(x, y)
{
	Global speed
	MouseMove x, y, speed, R
}
lineTo(x, y)
{
	Global speed, prevX, prevY
	MouseClickDrag L, prevX, prevY, x, y, speed, R
}

moveToAbs(x, y)
{
	Global speed
	MouseMove x, y, speed
}
lineToAbs(x, y)
{
	Global speed, prevX, prevY
	MouseClickDrag L, prevX, prevY, x, y, speed
}


#Include ../___Basic.ahk

+#z::
	MouseGetPos x, y
	a:=x
	b:=y
Return

+#x::
	MouseGetPos x, y
	drag(a, b, x, y)
	MouseGetPos x, y
	a:=x
	b:=y
Return