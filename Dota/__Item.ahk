blinkAllowed(){
	PixelGetColor, color, 903, 670
	Return (color==0x969595)
}

;Red, blue, green
switchTread(TreadIndex){
	;Get current color
	CurrentColor = 0
	PixelGetColor, color, 796,727
	if(color==0x1A28A2)
		CurrentColor = 0
	else if(color==0xBE8102)
		CurrentColor = 1
	else if(color==0x0E8C20)
		CurrentColor = 2
	
	;Switch to indexed color
	if(CurrentColor==0&&TreadIndex==1||CurrentColor==1&&TreadIndex==2||CurrentColor==2&&TreadIndex==0)
		Send v
	else if(CurrentColor==0&&TreadIndex==2||CurrentColor==1&&TreadIndex==0||CurrentColor==2&&TreadIndex==1)
		Send vv
}