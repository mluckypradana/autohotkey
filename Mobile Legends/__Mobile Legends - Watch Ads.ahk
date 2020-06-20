#SingleInstance force
setmousedelay -1
active:=true
hasEnemy:=false

!+s::
	ExitApp
Return

equal( c1, c2 ) ; find the distance between 2 colors
{ ; function by [VxE], return value range = [0, 441.67295593006372]
; that just means that any two colors will have a distance less than 442
   r1 := c1 >> 16
   g1 := c1 >> 8 & 255
   b1 := c1 & 255
   r2 := c2 >> 16
   g2 := c2 >> 8 & 255
   b2 := c2 & 255
   return Sqrt( (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2 )
}


^'::
	active:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
^/::
	active:=true
	SoundBeep 350, 100
	while(active){
		;Defaults
		Sleep 1000

		;If is in main menu, to Inventory
		;PixelGetColor, color, 1468,804, RGB
		;If (equal(color,0x42A2EF)<4){
		;	Click 1337,819
		;	Continue
		;}

		;Click use ads
		PixelGetColor, color, 1442,759, RGB
		If (equal(color,0xAC845D)<4){
			Click 1442,759
			Sleep 3000
			Continue
		}

		;If allowed to click close video (If no time remaining and close button is exists)
		PixelGetColor, color, 1365,6, RGB
		PixelGetColor, closeColor, 1460,39, RGB
		If (equal(color,0x010001)>4 && equal(closeColor, 0x4C4C4F)<4){
			Click 1460,39
			Continue
		}


		;(Another) If allowed to click close video
		PixelGetColor, color, 993,578, RGB
		PixelGetColor, closeColor, 1463,55, RGB
		If (equal(color,0x3C4043)>4 && equal(closeColor, 0x3C4043)<4){
			Click 1460,39
			Continue
		}

		;Mute audio
		;PixelGetColor, color, 460,45, RGB
		;PixelGetColor, muteColor, 454,35, RGB
		;If (equal(color,0xFFFFFF)<4 && equal(muteColor, 0xF8F8F8)>4){
		;	Click 460,45
		;	Continue
		;}

		;Receive reward
		PixelGetColor, color, 1030,730, RGB
		If (equal(color,0xAB845D)<4){
			MouseGetPos x, y
			Click 1030,730
			MouseMove x, y
			Continue
		}

		;View video
		PixelGetColor, color, 1452,286, RGB
		If (equal(color,0x83CEFF)<4){
			Click 1452,286
			Continue
		}

		;Resume Video
		PixelGetColor, color, 1177,640, RGB
		If (equal(color,0x3E82F7)<4){
			Click 1177,640
			Sleep 7000
			Continue
		}

		;Share
		PixelGetColor, color, 992,301, RGB
		PixelGetColor, shareColor, 574,265, RGB
		If (equal(color,0xFFF8D8)<4 && equal(shareColor,0xACD5EF)<4){
			commendAll()
			share()
			Sleep 120000
			Continue
		}

		;Don't quit game
		PixelGetColor, color, 1137,753, RGB
		If (equal(color,0xDB575F)<4){
			Click 783,738
			Continue
		}

		;Block invite reason
		PixelGetColor, color, 770,561, RGB
		If (equal(color,0x43E6FF)<4){
			Click 964,680
			Continue
		}
	}
Return

share() {
	Click 565,274
	Sleep 500
	Click 563,370
	Sleep 2000
	Send {Esc}
}

commendAll() {
	Loop 2{
		Click 621,432
		Click 620,716
		Click 621,501
		Click 621,648
		Click 623,576
	}
}

!d::
Return