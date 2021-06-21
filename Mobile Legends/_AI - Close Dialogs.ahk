closeDialogs(){
	;Close fake serial number idm
	if(isColor(764, 537, 0xFCE100) && isColor(755, 521, 0x000000)){
		click(1149, 621)
		return true
	}
	;Close idm registration
	if(clickWhen(702, 341, 0x4B82E5,1149, 675))
		return true
	;Close idm 
	if(clickWhen(789, 534, 0xFCE100, 1149, 477)) 
		return true
	;Close idm 
	if(clickWhen(791, 544, 0xFCE100, 1146, 485)) 
		return true
	;Close idm
	if(clickWhen(832, 590, 0xFCE100, 1193, 528))
		return true
	;Close idm
	if(clickWhen(767, 616, 0xFCE100, 1257, 691))
		return true

	;Dismiss calendar
	if(clickWhen(1378, 659, 0x26ACE9, 1786, 903))
		return true
	;Dismiss calendar meeting
	if(clickWhen(1482, 723, 0x1798E1, 1863, 981))
		return true
	
	;Dismiss game guardian
	if(clickWhen(1409, 726, 0x424242, 0, 0))
		return true
	;[Done] Get gold chest
	if(clickWhen(613, 345, 0xD74D61, 581, 373)) {
		Sleep 1000
		return true
	}
	;[Done] Get free chest
	if(clickWhen(614, 449, 0xBA3A4C, 580, 477)) {
		Sleep 1000
		return true
	}
	;Get confim chest
	if(clickWhen(682, 531, 0x12842f, 0, 0)) 
		return true
	;Confirm info chest
	if(clickWhen(960, 713, 0xD99F69, 0, 0)) 
		return true
	;Draft pick pager
	if(clickWhen(1427, 545, 0x8CA6CE, 0, 0)) 
		return true
	;Close webview
	if(clickWhen(1349, 814, 0xA9A9A9, 0, 0))
		return true
	;Close conquest of dawn
	if(clickWhen(1478, 376, 0x7CCCFF, 0, 0))
		return true
	;Close popup
	if(clickWhen(1471, 306, 0x7CCAFF, 0, 0))
		return true
	;Close popup 2
	if(clickWhen(1471, 314, 0x5999CB, 0, 0))
		return true
	;Close popup hero highlight
	if(clickWhen(1471, 315, 0x7BC9FF, 0, 0))
		return true

	;CLose popup tag
	if(clickWhen(1409, 398, 0xA17154, 0, 0))
		return true
	;Close popup shop
	if(clickWhen(1320, 312, 0xCBA67C, 0, 0))
		return true
	;Close event
	if(clickWhen(1408, 320, 0xFAE7E7, 0, 0))
		return true
	;Close multiple account
	if(isColor(709, 386, 0x777E58) && isColor(1209, 643, 0x173558)){
		click(955, 643)
		return true
	}
	;Close emoji dialog
	if(clickWhen(1404, 360, 0xDECDC4, 0, 0))
		return true
	;Close mcl dialog
	if(clickWhen(1440, 331, 0xCDDDB1, 0, 0))
		return true
	
	;Close MC dialog
	if(clickWhen(1437, 291, 0xBADCFB, 0, 0))
		return true
	return false
}