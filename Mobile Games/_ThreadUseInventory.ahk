;Use bundle inventory
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
global adUsed:=false
loop(){
	useBundleInventory()
}

useBundleInventory(){
	;In inventory
	if(c(539, 490, 0x40A4F0)){
		;Temporary, start video
		if c(675, 722, 0xEEE1B9){
			click(1370, 765)
			Sleep 11000
			return
		}

		;If video chest selected, pick next chest
		if(c(653, 336, 0xF2E6C4) && c(692, 307, 0x69A8D5)){
			return click(750, 357)
		}
		;If BB Coin selected, pick next chest
		if c(800, 312, 0x94CFF5) && c(779, 362, 0xDFCE78){
			return click(877, 356)
		}

		;Surprise bundle
		if c(687, 734, 0xE16AEE) ;Surprise bundle
		|| c(663, 728, 0xEB4E7D) ;Pre-register bundler
		|| c(646, 746, 0x113B23) ;Small emblem pack
		|| c(688, 743, 0xB57C52) ;Hero Trial Pack
		|| c(690, 724, 0x233B4A) ;Lucky Common Emblem Chest
		|| c(690, 721, 0x5A2A2E) ;Limited Emblem Chest
		|| c(677, 725, 0x3B9334) ;Epic Skin Trial Card
		|| c(680, 732, 0xAC804E) ;Skin Fragment Bundle
		|| c(681, 738, 0xC30FC2) ;Daily Supply
		|| c(686, 739, 0xA5E2D9) ;Skin trial pack
			click(1370, 765)
		;Deluxe Skin Trial Card Pack
		if(c(702, 699, 0x152636))
			return clickWhen(671, 755, 0x9ECAD2, 1370, 765)
		;Daily Skin Trial Card Pack
		if(c(671, 755, 0x91C3C9))
			return clickWhen(678, 740, 0x95E9D0, 1370, 765)
		;Assassin Skin Trial Card Bundle
		if(c(677, 733, 0x311864))
			return clickWhen(649, 723, 0xA542D3, 1370, 765)
		;Little Commander Skin
		if(c(701, 699, 0x152636))
			return clickWhen(695, 741, 0x6F2495, 1370, 765)
		;Little Commander Trial pack
		if(c(661, 753, 0xE9A70A))
			return clickWhen(650, 744, 0xBD3636, 1370, 765)
		;Little Commander Trial pack 1 day
		if(c(629, 697, 0x172738))
			return clickWhen(663, 756, 0xE9A70A, 1370, 765)
		;Flare up chest
		if(c(665, 723, 0xA0C9E1))
			return clickWhen(699, 717, 0x7BABC6, 1370, 765)
		;Normal emblem pack
		if(c(646, 747, 0x0A335C))
			return clickWhen(664, 725, 0x3349A4, 1370, 765)
		;Lucky skin chest
		if(c(664, 719, 0x7A2DB3))
			return clickWhen(695, 721, 0xD2C597, 1370, 765)
		;Lucky skin chest
		if(c(675, 706, 0x558DDB))
			return clickWhen(681, 754, 0x3529A2, 1370, 765)
		;Diamond Hero Trial Card
		if(c(675, 756, 0xB47C53))
			return clickWhen(687, 735, 0xC48A61, 1370, 765)
		;Pre-Update Event Chest
		if(c(663, 724, 0xEDAB56))
			return clickWhen(685, 721, 0xFC62FF, 1370, 765)
		;Weekly sign-in bundle
		if(c(704, 701, 0x1D2542))
			return clickWhen(686, 735, 0xDC68EC, 1370, 765)
		return true
	}
	;In quantity use dialog
	if(c(821, 608, 0x3E7891) && c(874, 595, 0x13273F) && c(1153, 599, 0x38728B)){
		;Surprise bundle
		if (c(786, 481, 0xE8E6C4) && c(801, 478, 0xD95FE9))
		|| (c(803, 465, 0x562729) && c(757, 485, 0xFC4545))
		|| (c(792, 491, 0x235A2D) && c(789, 466, 0x469F3B)) ;Epic skin trial card pack
		|| (c(783, 469, 0xFCFBF1) && c(801, 480, 0xCB55DB)) ;Surprise Ticket bundle
			maxOutAndUseInventory()

		;Deluxe Skin Trial Card Pack
		if(c(785, 497, 0x98C7CF) && c(805, 494, 0x4796A7)){
			maxOutAndUseInventory()
		return true
		}
		;Deluxe Skin Trial Card Pack Purple
		if(c(785, 497, 0x98C7CF) && c(800, 477, 0xA4CDE5)){
			maxOutAndUseInventory()
		return true
		}
		;Daily Skin Trial Card Pack
		if(c(785, 495, 0x9EC9D2) && c(803, 494, 0x4799A7)){
			maxOutAndUseInventory()
		return true
		}
		;Hero Trial Pack
		if(c(801, 483, 0xB87F55) && c(777, 500, 0x4F2C3C)){
			maxOutAndUseInventory()
		return true
		}
		;Small emblem pack
		if(c(760, 487, 0x123B23) && c(776, 470, 0x1B622D)){
			maxOutAndUseInventory()
		return true
		}
		;Daily supply
		if(c(805, 471, 0xC48F36) && c(775, 502, 0xAC7541)){
			maxOutAndUseInventory()
		return true
		}
		;Limited Emblem Chest
		if(c(774, 487, 0xE63B33) && c(800, 482, 0x83453C)){
			maxOutAndUseInventory()
		return true
		}
		;Normal emblem pack
		if(c(759, 489, 0x0A325B) && c(764, 466, 0x072D56)){
			maxOutAndUseInventory()
		return true
		}
		;Lucky Skin Chest
		if(c(776, 461, 0x8232BA) && c(810, 461, 0xEEE6CD)){
			maxOutAndUseInventory()
			return true
		}
		;Marksman Skin Trial Card
		if(c(789, 479, 0x4D2913) && c(790, 449, 0xAF7D4F)){
			maxOutAndUseInventory()
			return true
		}
		;Little commander trial pack 1 day
		if c(762, 490, 0xBB372F) && c(774, 503, 0xE9A710) {
			maxOutAndUseInventory()
			return true
		}
		;Skin Trial Pack
		if c(799, 481, 0xAEE8DF) && c(804, 493, 0x4A9EA3) {
			maxOutAndUseInventory()
			return true
		}
		return true
	}
	return false
}

while(true)
	loop()
!p::ExitApp
#Include __Functions.ahk