NumpadEnter & Numpad1::
	if WinExist("ahk_exe chrome.exe") {
	  WinActivate
	  ControlFocus, Chrome_AutocompleteEditView1
	  }
	else
	Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
Return