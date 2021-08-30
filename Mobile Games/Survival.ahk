#Include __Basic.ahk
SetKeydelay -1

#NoEnv  ;
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Space & F1::Return ; Mentioned in the hotkeys docs for UP
*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

global aiEnabled:=false

!7::
	aiEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!8::
	aiEnabled:=true
	SoundBeep 350, 100	
	while(aiEnabled){
		pickItems()

		if(c(999, 888, 0x54ECED))
			click(1056, 933)
		if(c(1010, 875, 0x3643B3))
			click(968, 938)
	}
Return
pickItems(){
	;If has item in slot 3
	if (c(1347, 249, 0x827522)) {
		;If is helmet / defense / shoes
		if (c(1315, 114, 0x2EAE5E) || c(1319, 264, 0xCD5D20) || c(1317, 256, 0x97319D))
			take(3)
		;If is ability
		if (c(1318, 256, 0x258B8B)) {
			;If (is healing & pickable) or not healing
			if (c(1365, 282, 0xBBF236)) {
				if(pickable()) {
					take(3)
				}
			}
			else
				take(3)
		}
		;If is not attack (upgrade)
		if(!c(1318, 255, 0xA21313)) {
			take(3)
		}
		;Else (attack)
		else {
			;If no weapon / only blade
			if (hasNoWeapon())
				take(3)
			;Else if shotgun / rifle (?)
			if (c(1349, 284, 0xDC8030) || c(1340, 274, 0xE956C8))
				take(3)
		}
	}

	;If has item in slot 2
	if (c(1345, 177, 0x604F30) || c(1301, 176, 0xE8D89E) || c(1294, 176, 0xDACB95)) {
		;If is helmet / defense / shoes
		if (c(1315, 184, 0x2EAE5E) || c(1315, 113, 0xC85723) || c(1317, 184, 0x97319D))
			take(2)
		;If is ability
		if (c(1317, 184, 0x258B8B)) {
			;If (is healing & pickable) or not healing
			if (c(1364, 210, 0xC7FC45)) {
				if(pickable()) {
					take(2)
				}
			}
			else
				take(2)
		}
		;If is not attack (upgrade)
		if(!c(1316, 183, 0xA21313)) {
			take(2)
		}
		;Else (attack)
		else {
			;If no weapon / only blade
			if (hasNoWeapon())
				take(2)
			;Else if shotgun / rifle (?)
			if (c(1349, 218, 0xC0722B) || c(1341, 198, 0xF876C8))
				take(2)
		}
	}

	
	;If has item in slot 1
	if (c(1347, 104, 0x74623E) || c(1297, 104, 0xB2B390) || c(1284, 165, 0x726F54)
		|| c(1298, 165, 0xA19972) || c(1300, 104, 0xB7B995) || c(1295, 104, 0x949D84)
		|| c(1302, 104, 0xA3A790) || c(1298, 165, 0x857E5B)) { ;1301, 165, 0x837E5F
		;If is helmet / defense / shoes
		if (c(1317, 113, 0x2EAE5E) || c(1318, 113, 0xC95723) || c(1318, 114, 0x97319D))
			take(1)
		;If is ability
		if (c(1315, 110, 0x258B8B)) {
			;If (is healing & pickable) or not healing
			if (c(1363, 138, 0xC8FE44)) {
				if(pickable()) {
					take(1)
				}
			}
			else
				take(1)
		}
		;If is not attack (upgrade)
		if(!c(1317, 112, 0xA21313)) {
			take(1)
		}
		;Else (attack)
		else {
			;If no weapon / only blade
			if (hasNoWeapon())
				take(1)
			;Else if shotgun / rifle (?)
			if (c(1349, 144, 0xD57D2F) || c(1337, 132, 0xE44FBD))
				take(1)
		}
	}
}
hasNoWeapon(){
	return c(1247, 1006, 0x151A1F) || c(1251, 1006, 0xC8AB89)
}
pickable(){
	return !c(904, 1027, 0xE4E4E4)
}
take(index){
	if (index == 3) {
		click(1360, 281)
	}
	else if (index == 2) {
		click(1361, 208)
	}
	else {
		click(1361, 139)
	}
}

#If GetKeyState("Space", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

3::
	click(1362, 135)
	click(1364, 216)
	click(1364, 296)
Return
4::
	click(1362, 135)
Return
5::
	click(1364, 216)
Return

q::
	click(1197, 71)
Return
w::
	click(1239, 80)
Return

x::
	click(978, 1003)
Return
c::
	click(1058, 1012)
Return
v::
	click(975, 1005)
	click(1058, 1012)
Return

g::
	Send {F1}
	click(1412, 988)
	click(978, 1003)
	Sleep 500
	click(1058, 1012)
	click(1427, 828)
Return
