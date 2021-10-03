global sensitivity:=4
global brawlMatch:=false
global memberDeleted:=false
global memberSorted:=false
global firstGroupManaged:=false
global secondGroupManaged:=false
global withSquadInvite:= false
global withGroupInvite:= false
global withDeleteMember:= false

aiEnabled:= true
attack:=true
watchAds:=false
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false
match:=0
ads:=0
maxAds:=10

#Include ../___Basic.ahk
;#IfWinActive BlueStacks


#\::ExitApp

;Zoom 50
#z::
	click(231, 674)
	Sleep 100
	click(263, 673)
	Sleep 100
	click(215, 679)
Return

#x::
	foundCheckBox:=true
	found:=0
	maxFound:=10
	while(foundCheckBox){
		PixelSearch, px, py, 279, 522, 352, 655, 0xFFFFFF, 0, RGB Fast
		If !ErrorLevel{
			click(px, py)
			Sleep 75
			found:=found+1
			if(found>maxFound)
				Return
			Continue
		}
		Return
	}
Return