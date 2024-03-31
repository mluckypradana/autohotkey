#NoEnv
SetWorkingDir %A_ScriptDir%
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
#Include InstagramScrapingVariables.ahk
!^+s::
tooltip("App closed")
	ExitApp
Return
!^+a::
	; text:="Mobil bekas carsome bandung|Automotive Dealership|Showroom resmi penjualan mobil bekas berkualitas & bergaransi hingga I tahun I|meliputi AC, Mesin, Transmisi|See translation|(E) carsome.id/|Jl. Soekarno Hatta No.241, Kel.Kopo Kec.Bojongloa kaler, Bandung 40233"
	; msg(getValuesWithRegex(text, linkRegex))
	; Return
	; text:= "http://google.com Ini adalah contoh link google.com dan https://link.tree"
	; linkRegex:=getLinkRegex()
	; urls:=getUrlListFromRegex(text, linkRegex)
	; msg(urls[1])
	; Return

	; imageFile := "C:\Storage\Other\Hotkeys\Dev\explorer.jpg"
	; searchArea := "2 12 56 87"
	; options := "Tolerance=30"
	; result := FindClick(imageFile, searchArea, options)
	; tooltip(result . " " . result.y)

	untapButtons()
	
	focusEmu()
	queryArray:= StrSplit(queries, ",")
	for index, query in queryArray {
		if !resetExplorer()
			Return

		currentQuery:=query
		searchQuery(query)
		clickView(vSearchKeyboard)

		waitView(vTabTop)
		Sleep 100
		clickView(vTabAccounts)

		pixelWaitNot(vFirstAccount[1], vFirstAccount[2], 0xFFFFFF, 15000) ;If 1 account show up

		if cv(vFirstThumbnailEmpty){
			tooltip("No result")
		}

		openResults()
		createNewExcelFile()
	}
	tooltip("Script stopped")
Return
createNewExcelFile(){
	focusExcel()
	addNewRow()
	;Send ^n
	focusEmu()
}
searchQuery(query){
	clickView(vSearchBar) ;Search bar
	waitView(vKeyboard)
	Send %query%
}
resetExplorer(){
	clickView(vExplorer)
	clickView(vExplorer)
	waitView(eSearchBar)
	return cv(eSearchBar)
}

openResults(){
	global colors

	;Start go through items
	currentY:=textY
	resultTotal:=0
	failDetect:=0
	while (currentY<=textEndY && failDetect<maxFailDetect){ ;Not reach end of list
		failDetect:=0
		while(c(textX, currentY, 0xFFFFFF) && currentY<=textEndY && failDetect<maxFailDetect){ ;Not yet find text in single item
			currentY:=currentY+2
			failDetect:=failDetect+1
		}
		;click(textX, currentY)
		lastItemY:=currentY

		if(currentY<textEndY){
			if !selectItem(textX, currentY){
				tooltip("Probably end of the list")
				Return
			}else 
				resultTotal:=resultTotal+1
		}

		currentY := currentY + itemGapY

		;Break if a lot of duplicate
		if (duplicateUsername > maxDuplicateUsername)
			return	
	}
	
	if(resultTotal>maxResultTotal)
		showNextPage()
	else
		return

	currentItemThumbColor:=getColor(xThumb, lastItemY)
	if(currentItemThumbColor == lastItemThumbColor && currentItemThumbColor!=0xFFFFFF){
		tooltip("End of the list")
		return
	}
	else{
		lastItemThumbColor:=getColor(xThumb, lastItemY)
		openResults()
	}
}
selectItem(x, y){
	;move(x, y)
	click(x, y)
	;Wait at least username to show up
	waitView(vMoreMenu, 1000)
	if !cv(vMoreMenu)
		return false
	getItemInformation()
	back()
	pasteResult()
	waitView(vSearchBar)
	return true
}
closeDialog(){
	clickView(aNameEnd)
}
getItemInformation(){
	global copiedList:=[]

	;Username
	if !getTextOcr(aNameStart[1], aNameStart[2], aNameEnd[1], aNameEnd[2])
		return

	if hasTextFromArray(Clipboard, usernames){
		duplicateUsername:=duplicateUsername+1
		return
	}else{
		username:=Clipboard
		StringReplace,username,username,-,_,A
		usernames.Push(username)
	}
	username:=Clipboard

	;Copy profile url
	clickView(vMoreMenu)
	waitView(vCopyProfile)
	if !cv(vCopyProfile){
		clickView(vCopyUserProfile)
	}else
		clickView(vCopyProfile)
	ClipWait, 10
	waitView(vLinkCopied)
	copiedList.Push(Clipboard)
	closeDialog()

	copiedList.Push(username)

	waitView(vPosts, 15000)
	if !cv(vPosts){
		tooltip("No post")
		return
	}

	;Get posts
	if !getTextOcr(aStatStart[1], aStatStart[2], aStatEnd[1], aStatEnd[2])
		return
	text:=removeStatText(removeNewLine(Clipboard))
	stats := StrSplit(text, "|")
	if(stats[1]=="")
		stats[1]:="0"
	copiedList.Push(stats[1])

	;Get following
	clickView(vFollowing)	
	waitView(vFollowers)
	if cv(vFollowers){
		if !getTextOcr(aStatFollowStart[1], aStatFollowStart[2], aStatFollowEnd[1], aStatFollowEnd[2])
			return
		followers:=createArrayStat(removeNewLine(Clipboard))
		copiedList.Push(followers[1])
		copiedList.Push(followers[2])
		clickView(vBack)
		waitView(vMoreMenu, 1000)
	}else{
		copiedList.Push(stats[2])
		copiedList.Push(stats[3])
	}
	
	;Get bottom description
	phones:=""
	links:=""
	desc:="-"
	aDescStart:=[669, 197]
	aDescSearchEnd:=[722, 575]
	result:=searchColor(aDescStart[1], aDescStart[2], aDescSearchEnd[1], aDescSearchEnd[2], 0x0095F6, 1)
	if(result==null){
		tooltip("Couldn't get description")
	}
	else {
		;Click more if exists
		if(vMore[2]<result.y){
			clickView(vMore)
			Sleep 50
			;Re-search the follow color
			result:=searchColor(aDescStart[1], aDescStart[2], aDescSearchEnd[1], aDescSearchEnd[2], 0x0095F6, 1)
		}
	}
	;If minimum desc height meet
	if (result.y - aDescStart[2] > hDescMin){
		if !getTextOcr(aDescStart[1], aDescStart[2], aDescEnd[1], result.y)
			return
		desc:=replaceNewLine(cleanUpDescText(Clipboard))
	}
	copiedList.Push(desc)
	copiedList.Push(currentQuery)
	
	hasContact:=false
	;If contact button in second row
	if(getColor(xSecondRowContact, result.y) == 0x0095F6){
		click(xSecondRowContact, result.y+ySecondRowContact)
		hasContact:=true
	}
	;Search contact button, click 3rd column contact
	else if (getColor(xFollowIdentifier, result.y) != 0x0095F6) {
		click(xContact, result.y+yContactRelativeButton) ;Show dialog
		hasContact:=true
	}

	if(hasContact){
		waitView(vBgDialog)
		waitView(vBgDialog)
		waitView(vBgDialog)
		;If email showed up
		if cv(vKeyboard) {
			if !getTextOcr(aEmailStart[1], aEmailStart[2], aEmailEnd[1], aEmailEnd[2])
				return
			;Back from email
			clickView(vBack)
			waitView(vGmailIcon)
			back()
			waitView(vMoreMenu)
		}
		else if cv(vBgDialog) {
			if !getTextOcr(aContactStart[1], aContactStart[2], aContactEnd[1], aContactEnd[2])
				return
			text:=removeContactText(removeNewLine(Clipboard))
			contacts := StrSplit(text, "|")
			copiedList.Push(cleanPhone(contacts[1]))
			copiedList.Push(contacts[2])
			clickView(aNameEnd)
			clickView(aNameEnd)
			waitView(vMoreMenu)
		}
	}
	else{
		phones:=getValuesWithRegex(desc, phoneRegex)
		;Get phone from phones
		phoneArray:=StrSplit(phones, ",")
		for i, phone in phoneArray{
			phoneText.=cleanPhone(phone) . " "
		}
		copiedList.Push(phoneText)
	}
	links:=getValuesWithRegex(desc, linkRegex, " ")
	if(length(links)>0)
		copiedList.Push(links)
}
cleanPhone(phone){
	StringReplace,phone,phone,' ',,A
	StringReplace,phone,phone,-,,A
	StringReplace,phone,phone,(,,A
	StringReplace,phone,phone,),,A
	if startsWith(phone, "+62")	
		StringReplace,phone,phone,+62,,A
	if startsWith(phone, "0")	
		StringTrimLeft, AllMatches, AllMatches, 1
	return phone
}
cleanUpDescText(string){
	StringReplace,string,string,See translation,,A
	StringReplace,string,string,See |,' ',A
	return string
}
back(){
	Send ^+2
}
focusEmu(){
	WinActivate, ahk_exe HD-Player.exe
}
pasteResult(){
	global copiedList
	focusExcel()
	while(copiedList.Length()>0){
		pasteCopiedArray()
		moveToNewColumn()
	}
	Sleep 100
	addNewRow()
	Sleep 100
	Send {Home}
	Sleep 100
	focusEmu()
}
focusExcel(){
	WinActivate, ahk_exe msedge.exe
}
moveToNewColumn(){
	; Send {Space}
	; Send {Space}
	; Send {Space}
	; Send {Space}
	Send {Right}
}
addNewRow(){
	Send {Down}
	; Send {Enter}
}
getTextOcr(x1, y1, x2, y2){
	Clipboard := null
	baseColor:=getColor(vOcr[1], vOcr[2])
	Send #+t ;Start capturing OCR
	vOcr[3]:=baseColor
	pixelWaitNot(vOcr[1], vOcr[2], baseColor, 15000)
	if getColor(vOcr[1], vOcr[2])==baseColor{
		tooltip("Failed showing OCR")
		return false
	}
	; Sleep 100
	Sleep 200
	drag(x1, y1, x2, y2) ;Get stats OCR
	pixelWait(vOcr[1], vOcr[2], baseColor)
	ClipWait, 10
	return true
}
pasteCopiedArray(){
	global copiedList
	if(copiedList.Length()<=0)
		Return

	Clipboard:=""
	 if(length(copiedList[1])<32){
	 	SendInput % copiedList[1]
		Sleep 20
	}else {
		;pasteText(Clipboard, copiedList[1])
		Clipboard := copiedList[1]
		ClipWait, 10
		Send ^v
		pasteWait()
		Sleep 500
	}
	copiedList.RemoveAt(1)
}
removeContactText(string){
	StringReplace,string,string,Contact,,A
	StringReplace,string,string,Call,,A
	StringReplace,string,string,Text,,A
	StringReplace,string,string,Email,|,A
	return string
}
createArrayStat(string){
	StringReplace,string,string,' ', ,A
	StringReplace,string,string,followers,|,A
	StringReplace,string,string,following,,A
	StringReplace,string,string,Suggested,,A
	StringReplace,string,string,O,0,A
	return StrSplit(string, "|")
}
removeStatText(string){
	StringReplace,string,string,Posts,|,A
	StringReplace,string,string,Followers,|,A
	StringReplace,string,string,Following,|,A
	return string
}
replaceNewLine(string){
	StringReplace,string,string,`n, | ,A
	StringReplace,string,string,`r,,A
	return string
}
removeNewLine(string){
	StringReplace,string,string,`n,,A
	StringReplace,string,string,`r,,A
	return string
}
thumbnailIsSimilar(x, y){
	global colors
	PixelGetColor color, %x%, %y%, RGB
	if hasVal(colors, color) != 0 { ;Hasn't been clicked yet
		colors.Push(color)
		tooltip("Pushing the color")
		return true
	}
	return false
}
hasVal(haystack, needle) {
	if !(IsObject(haystack)) || (haystack.Length() = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}
;Return true if scrolling
showNextPage(){
	;drag(752, 982, 754, 123, 100)
	MouseMove % vBottomList[1], % vBottomList[2]
	Click Down
	MouseGetPos x, y
	currentAccel:=1
	while(y>vTopList[2]){
		negativeAccel:=currentAccel*-1
		MouseMove, 0, %negativeAccel%, , R
		MouseGetPos x, y
		currentAccel:=10
	}
	MouseMove % vTopList[1], % vTopList[2]
	Sleep 100
	MouseMove % vTopList[1]+20, % vTopList[2]
	Sleep 100
	Click Up
	Sleep 1500
	return true
}
#Include %a_scriptdir%\..\___Functions.ahk
#Include C:\Storage\Other\Hotkeys\Lib\FindClick.ahk