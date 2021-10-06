;Chrome
;=========================
#IfWinActive ahk_exe chrome.exe

~F24::
	FileRead, key, D:\Other\Hotkeys\Lua Macros\keys\keypressed.txt
	if (key == "q")
		inputTitleBar()
	else if(key == "w")
		inputSectionBar()
Return
inputSectionBar(){
	Loop 49{
		Send {-}
	}
}
inputTitleBar(){
	Loop 25{
		Send {=}
	}
}

;Android Studio
;=========================
#IfWinActive ahk_exe studio64.exe
~F24::
	FileRead, key, D:\Other\Hotkeys\Lua Macros\keys\keypressed.txt
	if (key == "q")
		inputTitleBar()
	else if(key == "w")
		inputSectionBar()
Return


#IfWinActive


~F24::
	FileRead, key, D:\Other\Hotkeys\Lua Macros\keys\keypressed.txt
	if (key == "s")
		openSound()
Return

openSound(){
	click(1889, 23)
	Send Choose your sound input device
	Sleep 100
	Send {Enter}
}