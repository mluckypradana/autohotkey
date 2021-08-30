global withArena:=true
global winRemaining:=5

isWithArena(withArena){
	if(withArena){
		global y := 1006
		global xs := []
		xs[0] := 692
		xs[1] := 783
		xs[2] := 883
		global xy := []
		xy[0,0] := 671
		xy[0,1] := 575
		xy[1,0] := 745
		xy[1,1] := 682
		xy[2,0] := 699
		xy[2,1] := 456
		xy[3,0] := 785
		xy[3,1] := 589
		xy[4,0] := 865
		xy[4,1] := 725
		xy[5,0] := 778
		xy[5,1] := 485
		xy[6,0] := 892
		xy[6,1] := 648
		xy[7,0] := 781
		xy[7,1] := 381
		xy[8,0] := 883
		xy[8,1] := 537
		xy[9,0] := 1017
		xy[9,1] := 713

		;In match
		if(c(962, 984, 0x373E5F)){
				targetIndex := rand(0, 9)
			if(targetIndex > 6){
				Random heroX, 0, 2
				x:=1050
				if(heroX==0)
					x:=1145
				else if(heroX==1)
					x:=1238
				heroIndex := rand(0, 9)
				drag(x, y, xy[heroIndex][0],  xy[heroIndex][1])
				Sleep 100
			}	
			drag(xs[0], y, xy[targetIndex][0],  xy[targetIndex][1])
			Sleep 100
			targetIndex := rand(0, 9)
			drag(xs[1], y, xy[targetIndex][0],  xy[targetIndex][1])
			Sleep 100
			targetIndex := rand(0, 9)
			drag(xs[2], y, xy[targetIndex][0],  xy[targetIndex][1])
			Sleep 100
			return true
		}
	}

		;Start arena match
		if(isColor(873, 655, 0xD9AE49)){
			;Click victory reward
			click(1416, 361)
			Sleep 500
			click(1235, 364)
			Sleep 1500
			
			if(winRemaining>0){
				click(967, 669)			
			}
			;Click back
			else{
				click(457, 259)
			}
			return true
		}

		;Close reward info
		if(isColor(755, 363, 0x1F3C59) && isColor(1237, 361, 0xC9B288)){
			click(1238, 360)
			return true
		}

		;Recieve reward
		if(isColor(1013, 753, 0xBC8E61)){
			click(1013, 753)
			return true
		}

		;Obtain new card
		if(isColor(1049, 771, 0xB98F62)){
			click(962, 755)
			return true
		}

		;Close match
		if c(921, 805, 0x7C8387) {
			;Win arena			
			if(!c(971, 534, 0x9FA0A0)){
				winRemaining:=winRemaining-1
				tooltip("Winning")
			}
			click(967, 795)
			pixelWait(463, 257, 0xF1D89A)
			return true
		}
	return false
}