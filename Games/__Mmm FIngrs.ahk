SetMouseDelay,-1 ;remove delays from mouse action
Escape::
	ExitApp
Return

;Debug
+d::	
Return

y = 167
+a::
	SendEvent {Click, 663, %y%, Down}
	while (true) {
		MouseGetPos, MouseX, MouseY
		ObstacleX := MouseX ; - 10
		ObstacleY := MouseY - 10
		PixelGetColor, color, %ObstacleX%, %ObstacleY%
		;If color is safe
		if(!colorIsSafe(color)) {
			moveBack()
		}
	}
Return

colorIsSafe(color){
	return (color==0xFFF8E3 ||color==0xFFFBED)
}

moveBack(){
	Sleep 200
	MouseGetPos, MouseX, MouseY
	while(MouseY<=y){
		ObstacleY := MouseY - 10
		MouseMove %ObstacleX%, %ObstacleY%
		moveBack()
		
		Random, RandX , -10, 10
		ObstacleX := MouseX
		ObstacleY := MouseY - 10
		PixelGetColor, color, %ObstacleX%, %ObstacleY%
		while(!colorIsSafe(color)){

			;-------------------------Moveback vertically
			ObstacleX := MouseX
			Random, RandY, -10, 10
			ObstacleY := MouseY - RandY
			MouseMove %ObstacleX%, %ObstacleY%

			;----------------------------Again move horizontal
			While(!colorIsSafe(color)) {
				Random, RandX , -10, 10
				ObstacleX := MouseX + RandX ; - 10
				ObstacleY := MouseY + 10
				PixelGetColor, color, %ObstacleX%, %ObstacleY%
			}
			MouseMove %ObstacleX%, %ObstacleY%
		}

	}
}