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
findinTab := 1

^+s::
	startAi := false
Return

^+a::
	startAi := true
	while (startAI){
		if(selectTabHero())
			continue
		if(selectPanel())
			continue
		if(refindLobby(findinTab, ys))
			continue
		closeMultipleLobbyDialog()
		Sleep 4000
	}
Return

closeMultipleLobbyDialog() {
	PixelGetColor, color, 620, 430
	If (color==0x696151)
		Send {Click, 620, 430}
}

selectTabHero() {
	PixelGetColor, color, 200, 430
	If (color==0x277854){
		MsgBox Selecting tab hero
		;CLick tab hero
		SendEvent {Click 330, 20}
		Sleep 1000
		return true
	}
}

selectPanel() {
	PixelGetColor, color, 717, 566
	If (color==0x241E16)
		return false

	MsgBox Selecting panel
	;Click chat tab
	SendEvent {Click 700, 740}
	Sleep 1000
	
	;activate slide menu
	PixelGetColor, color, 1091, 719
	if(color==0x45453E)
		SendEvent {Click, 1091, 719}
	Sleep 1000
	return true
}

findLobbyTab1(ByRef ys) {
	findinTab = 1
	MsgBox Finding lobby in tab %findinTab%
	SendEvent {Click 450, 563}
	Sleep 3000
	return findLobby(ys)
}

findLobbyTab2(ByRef ys) {
	findinTab = 2
	MsgBox Finding lobby in tab %findinTab%
	SendEvent {Click 570, 563}
	Sleep 3000
	return findLobby(ys)
}

findLobby(Byref ys) {
	MsgBox Finding lobby %ys%
	Loop, % ys.MaxIndex()-1 {
		PixelSearch, Px, Py, %startX%, ys[A_Index+1], %endX%, ys[A_Index], 0x90C364, 3, Fast
		if !ErrorLevel{
			SendEvent {Click, %Px%, %Py%}
			AddedX = % Px + 5
			AddedY = % Py + 1
			SendEvent {Click, %AddedX%, %AddedY%}
			return true
		}
	}
	Sleep 3000
	return false
}

refindLobby(ByRef findinTab, ByRef ys) {
	if(findinTab == 1)
		findinTab := 2
	else 
		findinTab := 1
	MsgBox Refind lobby %findinTab%
	if(findinTab==1) 
		return findLobbyTab1(ys)
	else
		return findLobbyTab2(ys)
}

showingLobby(){
	PixelGetColor, color, 860, 60
	return (color==25211E)
}

findSlot() {
	;6
	PixelGetColor, color, 1127, 139
	If (color==0x2b2622) 
		SendEvent {Click 1110, 154}
	;7
	PixelGetColor, color, 1127, 174
	If (color==0x27221F) 
		SendEvent {Click 1110, 174}
	;8
	PixelGetColor, color, 1127, 212
	If (color==0x231F1C) 
		SendEvent {Click 1110, 212}
	;9
	PixelGetColor, color, 1127, 247
	If (color==0x1F1B19) 
		SendEvent {Click 1110, 247}
	;10
	PixelGetColor, color, 1127, 282
	If (color==0x1E1918) 
		SendEvent {Click 1110, 282}
	;5
	PixelGetColor, color, 886, 282
	If (color==0x1E1A18) 
		SendEvent {Click 1093, 282}
	;4
	PixelGetColor, color, 886, 247
	If (color==0x1F1E19) 
		SendEvent {Click 1093, 247}
	;3
	PixelGetColor, color, 886, 212
	If (color==0x23241C) 
		SendEvent {Click 1093, 212}
	;2
	PixelGetColor, color, 886, 174
	If (color==0x27291F) 
		SendEvent {Click 1093, 174}
	;1
	PixelGetColor, color, 886, 139
	If (color==0x2A3422) 
		SendEvent {Click 1093, 154}
}