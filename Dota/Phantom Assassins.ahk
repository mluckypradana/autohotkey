attack:=true
hasEnemy:=false

Escape::
	ExitApp
Return

;Signal enemy
+e::
	SoundBeep, 350, 100
	While(true){
		PixelSearch, Px, Py, 684, 636, 848, 661, 0xbfb599, 15, Fast
		If ErrorLevel{
			if (!hasEnemy) {
				SoundBeep, 550, 100
				hasEnemy:=true
			}
		}
		else if(hasEnemy){
			SoundBeep 350, 100
			hasEnemy:=false
		}
		Sleep 250
	}
Return