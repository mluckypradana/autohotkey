#Include ../___Basic.ahk
global clickerEnabled:=false
global xSource := 0
global ySource := 0
global xRand1 := 0
global xRand2 := 0
global yRand1 := 0
global yRand2 := 0

!p::
	ExitApp
Return

;Regular click
!/::
	gosub, stoplabel
	valid:=true
	if valid
		this.ahkterminate()
	valid:=false
	if valid ? tooltip("True 2") : tooltip("False 2")

Return
stoplabel:
Return
!'::

Return

returned(thread){
	tooltip(DllCall("GetCurrentThreadId", UInt))
	gosub BreakCheck
}
BreakCheck:
	tooltip(breakcheck)
Return


project1:={Key:"this is a test"}
AhkThread("MsgBox('hello from thread')")
