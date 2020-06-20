CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen

currentColor:=0x000000
started:=0

^!s::
	SoundBeep 300, 50
	started:=0
Return


^!d::
	MouseGetPos, x, y
	PixelGetColor, color, %x%, %y%
	distance:= Distance(0x3C1D1C, 0x4F2326)
	MsgBox %distance% %color%
Return

Distance(rbg1, rbg2) {
   return abs((rbg1 & 0xff) - (rbg2 & 0xff) 
   + abs(((rbg1 >> 8) & 0xff) - ((rbg2 >> 8) & 0xff)) 
   + abs(((rbg1 >> 16) & 0xff) - ((rbg2 >> 16) & 0xff))) ;

}

;Distance 15
^!a::
	started:=1
	SoundBeep 350, 50
	MouseGetPos, x, y
	currentX:=x
	currentY:=y
	PixelGetColor, color, %x%, %y%
	currentColor:=color
	while(true) {
		if(started==0)
			break

		PixelGetColor, color, %currentX%, %currentY%
		distance:= Distance(color, currentColor)
		if(distance>15){
			MouseMove %currentX%, %currentY%
			ControlSend, , aha, BlueStacks
			SoundBeep 350, 50
		}
		Sleep 1000
	}
Return