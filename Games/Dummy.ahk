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

#Include __Basic.ahk
#IfWinActive BlueStacks


!p::ExitApp

!9::
	aiEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!0::
	aiEnabled:=true
	SoundBeep 350, 100
	while(aiEnabled){
		Send asdf
	}
Return