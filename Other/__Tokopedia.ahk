CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1

^q::
	MouseGetPos x, y
	Send {ctrl up}

	;Error
	PixelGetColor, color, 906, 138, RGB
	If (color==0x008000) 
		Click, 	888, 253, L

	;Beli
	PixelGetColor, color, 1035, 427, RGB
	If (color==0xff5722) 
		Click, 1035, 427, L
	;Courier
	PixelGetColor, color, 586, 582, RGB
	If (color==0xff5722) 
		Click, 586, 582, L
	
	;Pay everything
	PixelSearch, Px, Py,  0, 0, 1360, 768, 0x3960f2, 3, Fast
	If !ErrorLevel{
;		msgbox "haha"
		Click, %Px%, %Py%, L
	}

	;Apply method
	PixelGetColor, color, 727, 158, RGB
	If (color==0x42b549) 
		Click, 578, 612, L

	MouseMove x, y
Return

;BCA
^a::
	MouseGetPos x, y
	PixelGetColor, color, 698, 399, RGB
	If (color==0x8EC6E1) 
		Click, 230, 313, L
	PixelGetColor, color, 704, 323, RGB
	If (color==0x045396) 
		Click, 75, 195, L
	PixelGetColor, color, 633, 196, RGB
	If (color==0x000000) {
		Click, 633, 196, L
		Click, 555, 317, L
		Click, 731, 259, L
	}
	MouseMove x, y
Return