SetMouseDelay, -1
SetKeyDelay -1

global soulRingX:=813
global soulRingY:=687
global bottleX:=861
global bottleY:=687

;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

s::
	MouseGetPos, x, y
	soulRingX:=x
	soulRingY:=y
Return

b::
	MouseGetPos, x, y
	bottleX:=x
	bottleY:=y
Return

activateSoulRing(){
	MouseGetPos, x, y
	Click %soulRingX%, %soulRingY%
	MouseMove %x%, %y%
}

activateBottle(){
	MouseGetPos, x, y
	Click %bottleX%, %bottleY%
	MouseMove %x%, %y%
}

findColor(){
	PixelSearch, Px, Py, 991, 36, 1360, 557, 0x2E0B18, 0, Fast
	if !ErrorLevel
		MouseMove %Px%, %Py%	
}

refreshReady(){
	PixelGetColor, color, 756, 678, RGB
	return color==0x9fa4c1	
}

sleepByCurrentRefreshLevel() {
	Sleep 400
	PixelGetColor, color, 767, 716, RGB
	if(color==0xdbc788){
		Sleep 1000
		return
	}
	
	PixelGetColor, color, 760, 716, RGB
	if(color==0xdbc788){
		Sleep 2000
		return
	}

	PixelGetColor, color, 751, 716, RGB
	if(color==0xdbc788){
		Sleep 3000
		return
	}
}

refresh(){
	if(!refreshReady()){
		Soundbeep 550, 100
		Return
	}

	Send r
	sleepByCurrentRefreshLevel()
	activateBottle()
	activateSoulRing()
}

e::
	activateSoulRing()
	Send sce
Return

w::
	activateSoulRing()
	Send w
Return

q::
	activateSoulRing()
	Send q
Return

v::
	activateSoulRing()
	Send cvwq
Return

r::
	refresh()
Return

;Switch stash item
!^+s::
	MouseGetPos, posx, posy
	setmousedelay -1
	mouseMove 1200, 650
	setmousedelay 9
	MouseClickDrag, left, 1200, 650, 806, 674 ;Item 1
	setmousedelay -1
	mouseMove 1227, 650
	setmousedelay 9
	MouseClickDrag, left, 1227, 650, 870, 674 ;Item 2
	setmousedelay -1
	mouseMove 1260, 650
	setmousedelay 9
	MouseClickDrag, left, 1260, 650, 806, 706 ;Item 4
	setmousedelay -1
	mouseMove 1286, 650
	setmousedelay 9
	MouseClickDrag, left, 1286, 650, 870, 706 ;Item 5
	setmousedelay -1
	mousemove %posx%, %posy%
Return