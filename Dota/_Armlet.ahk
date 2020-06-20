#Include __Item.ahk
ArmletX:=565 ;535
ArmletRegen:=false

;Set Armlet offset
+4::
	MouseGetPos, posx, posy
	ArmletX:= % posx
	SoundBeep, 350, 100
	;Msgbox %ArmletX%
Return

;Regular armlet toggle (Double tap)
^x::
	if(!armletActivated()){
		activateArmlet()
		return
	}
	Send xx
Return

;Toggle armlet
+x::
	;Activate armlet
	While (true){
		;Break toggle if die
		PixelGetColor, color, 847, 683
		If (color!=0xF0ECF8) {	
			SoundBeep, 350, 100
			SoundBeep, 350, 100
			Break
		}

		;Durable
		IfWinActive, Dota 2
		{
			PixelGetColor, color, %ArmletX%, 728
			If (color<=0x2F8D4D) {
				Send xx
				Sleep 1000	
			}
		}
	}

		Send x
Return
;Arlmet Regeneration
^!x::
	switchTread(2)
	activateArmlet()
	Sleep 600 ;Suitable in 870
	switchTread(0)
	Send x
	;ArmletRegen:=true
	;While(ArmletRegen){
	;	IfWinActive, Dota 2
	;	{
	;	}
	;}
Return
+s::
	ArmletRegen:=false
Return

activateArmlet(){
	PixelGetColor, color, 847, 683
	If (color!=0xF0ECF8) 
		Send x
}
armletActivated(){
	PixelGetColor, color, 847, 683
	return (color==0xF0ECF8) 
}