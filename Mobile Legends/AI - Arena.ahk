global sensitivity:=4
global brawlMatch:=false
global memberDeleted:=false
global memberSorted:=false
global withSquadInvite:=false
global withGroupInvite:=true
global withDeleteMember:=true
aiEnabled:=false

global winRemaining:=1
y = 1005
xs := []
xs[0] := 692
xs[1] := 783
xs[2] := 883
xy := []
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

Esc::ExitApp

#Include __Basic.ahk
#IfWinActive BlueStacks
!,::
	aiEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!.::
	aiEnabled:=true
	SoundBeep 350, 100
	while(aiEnabled){	
		Sleep 1000

		;Click chest
		if(isColor(1391, 383, 0xFFFFF7)){
			click(1417, 363)
			Sleep 1000
			continue
		}
			
		;Start arena match
		if(isColor(873, 655, 0xD9AE49)){
			if(winRemaining>0)
				click(967, 669)
			;Click back
			else
				click(457, 259)
			continue
		}

		;Recieve reward
		if(isColor(1013, 753, 0xBC8E61)){
			click(1013, 753)
			continue
		}

		;Obtain new card
		if(isColor(1049, 771, 0xB98F62)){
			click(962, 755)
			continue
		}

		;Close match
		if(isColor(1462, 799, 0xADD9FA)){
			;Defeat			
			if(isColor(979, 535, 0x767A7A)){
				winRemaining:=winRemaining-1
			}
			click(967, 795)
			continue
		}

		;In match
		if(isColor(952, 207, 0x4D8777)){
			Random, targetIndex, 0, 9
			Random, slotIndex, 0, 2
			if(targetIndex > 6){
				Random, heroIndex, 0, 9
				drag(1050, y, xy[heroIndex][0],  xy[heroIndex][1])
				Sleep 500
				drag(1145, y, xy[heroIndex][0],  xy[heroIndex][1])
				Sleep 500
				drag(1238, y, xy[heroIndex][0],  xy[heroIndex][1])
				Sleep 500
			}	
			drag(xs[0], y, xy[targetIndex][0],  xy[targetIndex][1])
			Sleep 500
			drag(xs[1], y, xy[targetIndex][0],  xy[targetIndex][1])
			Sleep 500
			drag(xs[2], y, xy[targetIndex][0],  xy[targetIndex][1])
			Sleep 500
			continue
		}
	}
Return
#IfWinActive

drag(sx, sy, dx, dy){
	MouseMove sx, sy
	SetMouseDelay 15
	MouseClickDrag, Left, sx, sy, dx, dy
	SetMouseDelay -1
}