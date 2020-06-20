SetKeyDelay 1
blinkAllowed(){
	PixelGetColor, color, 903, 670
	Return (color==0x969595)
}

;Red, blue, green
switchTread(TreadIndex){
	;Get current color
	CurrentColor = 0
	PixelGetColor, color, 861, 756
	if(color==0x1A26A1)
		CurrentColor = 0
	else if(color==0xBA7E02)
		CurrentColor = 1
	else if(color==0x0D891E)
		CurrentColor = 2
	
	;Switch to indexed color
	if(CurrentColor==0&&TreadIndex==1||CurrentColor==1&&TreadIndex==2||CurrentColor==2&&TreadIndex==0)
		Send v
	else if(CurrentColor==0&&TreadIndex==2||CurrentColor==1&&TreadIndex==0||CurrentColor==2&&TreadIndex==1)
		Send vv
}


;Red, blue, green
switchTread2(TreadIndex){
	;Get current color
	CurrentColor = 0
	PixelGetColor, color, 815, 756
	if(color==0x1A26A1)
		CurrentColor = 0
	else if(color==0xBA7E02)
		CurrentColor = 1
	else if(color==0x0D891E)
		CurrentColor = 2
	
	;Switch to indexed color
	if(CurrentColor==0&&TreadIndex==1||CurrentColor==1&&TreadIndex==2||CurrentColor==2&&TreadIndex==0)
		Send v
	else if(CurrentColor==0&&TreadIndex==2||CurrentColor==1&&TreadIndex==0||CurrentColor==2&&TreadIndex==1)
		Send vv
}



;Red, blue, green
switchTread3(TreadIndex){
	;Get current color
	CurrentColor = 0
	PixelGetColor, color, 839, 756
	if(color==0x1A26A1)
		CurrentColor = 0
	else if(color==0xBA7E02)
		CurrentColor = 1
	else if(color==0x0D891E)
		CurrentColor = 2
	
	;Switch to indexed color
	if(CurrentColor==0&&TreadIndex==1||CurrentColor==1&&TreadIndex==2||CurrentColor==2&&TreadIndex==0)
		Send v
	else if(CurrentColor==0&&TreadIndex==2||CurrentColor==1&&TreadIndex==0||CurrentColor==2&&TreadIndex==1)
		Send vv
}