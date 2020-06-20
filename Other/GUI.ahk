myRGB=0xABCDEFG

WinSet, Transparent, 254, TargetWindow
  Gui, -Caption
  Gui, -Border

Gui, Add, Text, vmyRGB, %myRGB% ;color value that should be displayed


ypos := 0 ;A_ScreenHeight-400
xpos :=1000
Gui, Show, x%xpos% y%ypos%
gui, +alwaysontop


!e::
	MouseGetPos x, y
	PixelGetColor, color, %x%, %y%, RGB
	GuiControl, Text, myRGB, %color% ;updates my text field with the variable value
Return