global sensitivity:=4
global aiEnabled:=true
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false

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
		;If you want to team up with a friend, what should you do? Click Invite	
		if(c(1206, 756, 0x9CBDE5) && c(1195, 759, 0x92B4DA) && c(1131, 761, 0x95B7DE) && c(760, 759, 0x5D7E9E))
			r()
		;Friday Saturday Sunday? No
		if(c(1238, 760, 0x6992AF) && c(925, 753, 0x5A7F9E) && c(975, 756, 0x86A8CD))
			r()
		;Friend can follow level 10? 50
		if(c(975, 755, 0x8AADD2) && c(871, 755, 0x7A9EC1) && c(826, 760, 0x92B5DB))
			l()
		;Is it true that in the Magic Chess, your hero can be upgraded to 3-star? Yes
		if(c(640, 765, 0xA1B2DA) && c(626, 763, 0x64809F) && c(1247, 751, 0x89B9DA) && c(802, 741, 0x577D9A))
			l()
		;How many members are there in the Venom Squad? 5
		if(c(1186, 747, 0x5C819F) && c(1120, 747, 0x587D9A) && c(1008, 748, 0x6C90B1) && c(671, 759, 0x527593))
			l()
		;What will you get when Skin Trial Card owned? BP
		if(c(756, 761, 0x6081A1) && c(707, 769, 0x7B99BC) && c(572, 770, 0x8BACCB) && c(1075, 740, 0x6F93B3))
			l()
		;All heroes available in Mayhem? No
		if(c(1073, 748, 0x5D82A0) && c(1060, 756, 0x9ABCE3) && c(948, 764, 0xA2C3EC) && c(651, 749, 0x7896B3))
			r()

		;Survival Victory? Survive end game
		if(c(1274, 748, 0x6390AC) && c(1237, 765, 0x95BEDF) && c(1012, 764, 0x9BBCE4) && c(793, 755, 0x85A8CC))
			r()
		;Claude's Companion name? Dexter
		if(c(968, 751, 0x89ABD0) && c(801, 764, 0x8FB1D7) && c(658, 748, 0x6C8CA8) && c(590, 749, 0x607E9D))
			r()
		;Cyclone Eye respawn? 45s
		if(c(978, 749, 0x93B5DB) && c(920, 764, 0x8DB0D6) && c(851, 764, 0x90B2D9) && c(756, 765, 0xA3BBE5))
			l()
		;Cecillion and Carmila? Gusion
		if(c(1287, 749, 0x7CABCA) && c(1134, 765, 0x9FC0E8) && c(1032, 765, 0xA1C2EB) && c(735, 763, 0x4E718D))
			r()
		;Cecillion and Carmila? Castle Aberleen
		if(c(1093, 748, 0x6E92B3) && c(861, 751, 0x82A4C8) && c(881, 748, 0x6E92B3) && c(664, 752, 0x87A3C5))
			r()
		;Popol kupa meet? Trap
		if(c(1064, 749, 0x7B9EC0) && c(1004, 763, 0x7296B8) && c(986, 765, 0xA2C3EC) && c(800, 763, 0x6D91B2))
			r()
		;Atlas to Abysmal Sea? Ancient Race
		if(c(1189, 748, 0x6E92B3) && c(1145, 751, 0x5D83A1) && c(1048, 749, 0x4B728D) && c(759, 749, 0x507491))
			r()
		;Northen Vale geographicaly closer? Magic Academy
		if(c(1209, 750, 0x8CAED4) && c(1008, 748, 0x3A627B) && c(879, 764, 0x96B7DF) && c(733, 765, 0xA1BAE3))
			r()
		;Freya Stack? 6
		if(c(1037, 749, 0x8DAFD4) && c(868, 764, 0x8FB1D7) && c(669, 764, 0x8AA5CB) && c(831, 748, 0x517693))
			r()
		;Freya Stack? 6
		if(c(1038, 748, 0x7195B5) && c(870, 761, 0x83A5CA) && c(833, 748, 0x6A8EAF) && c(796, 754, 0x3D647D))
			r()
		;Hero not in Magic Academy? Terizla
		if(c(1078, 749, 0x93B5DC) && c(1064, 765, 0xA3C4ED) && c(939, 765, 0x9FC0E9) && c(854, 765, 0x9EBFE8))
			r()
		;Fighter on the stormy sea? Yes
		if(c(923, 758, 0x82A5C9) && c(843, 758, 0x6085A4) && c(779, 773, 0x819EC2) && c(606, 772, 0x9EBFDF))
			l()
		;Hero Power? Buy Equipment
		if(c(1207, 747, 0x5A809D) && c(1141, 763, 0x8CAED4) && c(1026, 764, 0x91B3DA) && c(907, 749, 0x6A8EAF))
			r()
		;Reward cannot be obtained from Magic Wheel? Permium Skin Fragment
		if(c(638, 758, 0x8098BB) && c(590, 758, 0x63809F) && c(1256, 740, 0x6390AD) && c(1142, 740, 0x496F8B))
			r()
		;Dyroth Silvanna siblings? Yes
		if(c(945, 748, 0x7196B7) && c(920, 765, 0x9EBFE8) && c(756, 749, 0x6989AA) && c(618, 748, 0x6D8DA9))
			l()
		;X Borg is immune to damage when armor destroyed? Yes
		if(c(681, 759, 0xA2BAE4) && c(608, 761, 0x537490) && c(1239, 755, 0x8CB6D6) && c(732, 745, 0x537693))
			l()
		;Kupa die when Popol dies? Yes
		if(c(906, 747, 0x577C9A) && c(816, 762, 0x557B98) && c(790, 748, 0x668AAA) && c(647, 763, 0x6E89AA))
			l()
		;Fighter on Stormy Sea, Bane want to get the Aurora Heart? To conquer the world
		if(c(633, 742, 0x839ABE) && c(569, 743, 0x5C7B99) && c(1237, 724, 0x4A748E) && c(991, 724, 0x6084A3))
			l()
		;Match, easier to win? Using an effective Lineup
		if(c(1247, 748, 0x5F8CA9) && c(1130, 764, 0x88ABD0) && c(1091, 748, 0x7A9EC1))
			r()
		;Match, easier to win? Using an effective Lineup
		if(c(1052, 758, 0x6489A8) && c(1013, 755, 0x5B809E) && c(860, 759, 0x80A3C7))
			r()
		;Common enemy Kahleed and Moskov? Khufra
		if(c(1096, 749, 0x8CAFD3) && c(1063, 750, 0x91B3D9) && c(988, 749, 0x98BAE1) && c(906, 749, 0x6E92B3))
			l()
		;Common enemy Kahleed and Moskov? Khufra
		if(c(1062, 749, 0x3E657F) && c(1124, 760, 0xA1C2EA) && c(889, 756, 0x779BBC))
			l()
		;Exchange Premium Skin Fragments for Elite Skins? Yes
		if(c(1269, 747, 0x507C96) && c(1211, 747, 0x567D99) && c(1152, 747, 0x5E83A1) && c(987, 747, 0x5E83A2))
			l()
		;Lithowanderer effect? 20s
		if(c(1116, 750, 0x799DC0) && c(1124, 750, 0x7EA1C4) && c(858, 747, 0x658CA9) && c(1205, 745, 0x688CAD))
			r()
		;Zilong, Baxia, Wanwan Ling? Oriental Fighters
		if(c(1278, 765, 0x91BADE) && c(1241, 749, 0x567F9A) && c(1101, 749, 0x466C88) && c(1016, 749, 0x577C9A))
			l()
		;Zilong, Baxia, Wanwan Ling? Oriental Fighters
		if(c(1291, 748, 0x5E8BA7) && c(1242, 750, 0x78A1C0) && c(1101, 750, 0x406681) && c(1020, 748, 0x6489A9))
			l()
		;Starlight Member Follow? 200
		if(c(1111, 748, 0x7094B6) && c(949, 749, 0x3C637C) && c(849, 748, 0x769ABD) && c(690, 749, 0x4B6E8A))
			r()
		;Argus Unkillable? Yes
		if(c(1188, 762, 0x8DAFD5) && c(926, 761, 0x6488A8) && c(654, 740, 0x436781) && c(1180, 747, 0x688DAD))
			l()
		;Heor awakend Leomord to fight against Tigreal? Vexana
		if(c(1172, 757, 0x6E92B3) && c(1033, 757, 0x9ABCE3) && c(954, 752, 0x7C9FC2))
			l()
		;Balmond live? Stormeye Wasteland
		if(c(850, 757, 0x6A8EAF) && c(763, 754, 0x5C7D9C) && c(658, 758, 0x89A4CA) && c(686, 756, 0x577998))
			l()
		;Magic Chess 20 golds? 2 Gold
		if(c(629, 758, 0x7893B5) && c(571, 773, 0x7B9EBC) && c(1254, 738, 0x57839E) && c(1233, 754, 0x6F98B5))
			r()
		;Sense existence of Twilight Orb? Lunox
		if(c(1192, 748, 0x7195B5) && c(1155, 748, 0x6488A8) && c(1109, 765, 0xA2C3EC) && c(1061, 749, 0x91B4DA))
			l()
		;Twilight orb shown up? 4
		if(c(946, 748, 0x8BAED3) && c(694, 744, 0x91ABD2) && c(1247, 751, 0x8DBEDF))
			l()
		;Grock immune to control when skill 1 to wall? Yes
		if(c(614, 758, 0x879DC1) && c(606, 758, 0xA2B4DB) && c(599, 758, 0x849BBF) && c(576, 740, 0x486A86))
			l()
		;Quickly level up character? Join a game and do some quest
		if(c(1000, 748, 0x7194B5) && c(967, 750, 0x597E9D) && c(905, 749, 0x7094B5) && c(814, 763, 0x8FB1D8))
			l()
		;Spend ticket in Lucky Spin to obtain hero fragment? Yes
		if(c(1035, 726, 0x82A5C9) && c(1012, 729, 0x6185A5) && c(959, 730, 0x5A7F9D) && c(917, 732, 0x5E83A2))
			l()
		;Aurora lose her lover? Zhask
		if(c(1045, 749, 0x6B8FB0) && c(991, 749, 0x7DA0C3) && c(913, 749, 0x4B728D) && c(894, 749, 0xA4C5EE))
			r()
		;Hours wait betwen two free Lucky Spin chances? 48h
		if(c(661, 758, 0x809CC0) && c(581, 758, 0x6D88A8) && c(672, 751, 0x9CB5D5) && c(723, 750, 0x86A2C8))
			r()
		;Lanes in Classic? 3
		if(c(1090, 749, 0x93B5DB) && c(1030, 749, 0x396079) && c(946, 748, 0x6D92B2) && c(876, 753, 0x90B2D8))
			l()
		;Lanes in Classic? 3
		if(c(1029, 748, 0x335972) && c(945, 749, 0x95B7DE) && c(837, 756, 0x5A809D))
			l()
		;Ranked mode unlocked? 9
		if(c(802, 753, 0x3B627B) && c(766, 755, 0x456984) && c(572, 748, 0x375D76))
			r()
		;Yi Sun Shin ship name? Turtle Ship
		if(c(943, 748, 0x6A8FAF) && c(840, 763, 0x7093B5) && c(687, 748, 0x7C9ABD) && c(668, 755, 0x6787A7))
			r()
		;Atlas return his mecha after use ultimate? Yes
		if(c(720, 759, 0x97B1D8) && c(676, 761, 0x6A8AAB) && c(698, 761, 0x6C8BAC) && c(645, 759, 0x748EB1))
			l()
		;Belerick protect? World Tree
		if(c(768, 758, 0x83A0C4) && c(726, 772, 0x9FB8E1) && c(662, 761, 0x547694) && c(676, 739, 0x7594B1))
			l()
		;MC Orange Hero? 5 Gold
		if(c(709, 759, 0x9CB5DE) && c(659, 760, 0x456A84) && c(630, 762, 0x879CC0) && c(576, 758, 0x6E89AA))
			r()
		;MC Orange Hero? 5 Gold
		if(c(653, 739, 0x2F566E) && c(628, 763, 0x3E627C) && c(1031, 742, 0x769ABB))
			r()
		;Premium Skin Fragment, 7 Day Login? Yes
		if(c(632, 758, 0x869DC1) && c(1209, 751, 0x9FC0E8) && c(1263, 751, 0x8DBEDF) && c(1157, 751, 0x9ABCE4))
			l()
		;Cool Sumer from Gacha Party? Yes
		if(c(631, 758, 0x7D95B8) && c(1190, 745, 0x466C88) && c(790, 744, 0x83A6C5) && c(710, 743, 0x6E8DAF))
			l()
		;Petrify Duration? 0.9
		if(c(1231, 748, 0x648DA9) && c(1218, 760, 0x6186A5) && c(1208, 751, 0x6B8FB0) && c(1183, 752, 0x83A6CA))
			l()
	}
Return
#IfWinActive

l(){
	MouseGetPos x, y
	if(x!=754 && y!=808){
		clickL(754, 808) 
		MouseMove 754, 808
	}
}
r(){ 
	MouseGetPos x, y
	if(x!=1135 && y!=810){
		clickL(1135, 810) 
		MouseMove 1135, 810
	}
}
c(x, y, color){
	return isColor(x, y, color)
}

