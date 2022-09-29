#Include ../___Basic.ahk
global assistEnabled:=false

Escape::
	ExitApp
Return

!a::
	Soundbeep 350, 100
	assistEnabled :=true
	while( assistEnabled){
		;Missions
		if(isColor(723, 254, 0x5AA038))
			click(723, 254)
		if(isColor(1179, 255, 0x5AA038))
			click(1179, 255)
		if(isColor(1031, 256, 0x5AA038))
			click(1031, 256)
				
		;DIalog collect
		if(isColor(498, 974, 0x363E4C))
			click(998, 974)
		;Progress trait
		if(isColor(618, 829, 0xFFC900))
			click(618, 829)
		;Rank up trait
		if(isColor(617, 828, 0x51D4FE))
			click(617, 828)
		;Reward continue
		if(isColor(1270, 910, 0x6D91D9))
			click(1070, 910)
		
		;Buy
		;if(isColor(1280, 808, 0x408033))
		;	click(1280, 808)
		;if(isColor(1280, 948, 0x408033))
		;	click(1280, 948)

		;Research
		if(isColor(1379, 836, 0x224C3E))
			click(1379, 836)

		;Geode
		clickWhen(1178, 843, 0xE631FF, 0, 0)
		clickWhen(934, 963, 0x8664A6, 0, 0)
	}
Return

!s::
	Soundbeep 350, 100
	assistEnabled:=false
Return

!e::
	click(1291, 706)
	Sleep 50
	click(1291, 706)
	Sleep 50
	click(1291, 706)
	Sleep 50
Return