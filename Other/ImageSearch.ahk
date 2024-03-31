;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

#Include FindClick.ahk
#Include ../___Basic.ahk

+^f::
	untapButtons()
	Sleep 1000
	click(164, 554)
	Sleep 100
	FindClick("close.png", "n w")
	FindClick("location.png")
	FindClick("phone.png")
Return

^+e::
	Variable1:="Local brand"
	Variable2:="Jl. Naripan, Cimahi, Bandung, Barat, 40551"
	;FileAppend, %Variable1% `, %Variable2% `n, xyz.csv
	FileAppend, %Variable1% . %A_Tab% . %Variable2%, xyz.csv, UTF-16
Return


^+w::
	global XL := ComObjCreate("Excel.Application")	
	XL.Visible := False	
	WB := XL.Workbooks.Open("C:\Storage\Other\Hotkeys\Other\Leads3.xlsx")
	WS :=WB.Worksheets("Errors")
	Variable1:="Local brand"
	Variable2:="Jl. Naripan, Cimahi, Bandung, Barat, 40551"
	OpenErrorRow := WS.UsedRange.Rows.Count + 1
	WS.Range("A" . OpenErrorRow).Value := Variable1
	WS.Range("B" . OpenErrorRow).Value := Variable2	
	WB.Save()
	XL.Quit()	
	Soundbeep 150, 50
Return
^+q::
	Soundbeep 150, 50
Return

^+t::

	WinSet, Transparent, Off
	ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, 1.jpg
	if (ErrorLevel = 2)
   		 MsgBox Could not conduct the search.
	else if (ErrorLevel = 1)
	    MsgBox Icon could not be found on the screen.
	else
 	   MsgBox The icon was found at %FoundX%x%FoundY%.
Return

