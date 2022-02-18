#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global picX1:=0
global picY1:=0
global picX2:=0
global picY2:=0

!1::
	MouseGetPos x, y
	picX1:=x
	picY1:=y
Return

!2::
	MouseGetPos x, y
	picX2:=x
	picY2:=y
Return

!3::
	MouseGetPos x, y
	canvasX1:=x
	canvasY1:=y
Return

!4::
	MouseGetPos x, y
	canvasX2:=x
	canvasY2:=y
Return

!a::
	x:=
Return