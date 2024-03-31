#Requires AutoHotkey v2.0
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

!Esc:: {
    Reload
}

checkWeekday(){
	; ;Habitica
	; if(timeIs(8,00)||timeIs(12,00)||timeIs(17,00)||timeIs(22,00))
	; 	openHabitica()
	; ;Quests
	; if timeIs(8,30) || timeIs(12,10) || timeIs(19,00)
	; 	openTasksBoard()
	;Water
	if(timeIs(9,30)||timeIs(10,00)||timeIs(10,30)||timeIs(11,00)||timeIs(11,30)||timeIs(13,30)||timeIs(14,00)||timeIs(14,30)||timeIs(15,30)||timeIs(16,00)||timeIs(16,30))
		notify("Drink water")
	;Brush teeth
	else if timeIs(12,45)
		notify("Brush teeth")
	;Pray time
	if timeIs(5,00)
		shalat("Fil, Quraish")
	else if timeIs(12,30)
		shalat("Maun(Aroaita), Kautsar")
	else if timeIs(15,30)
		shalat("Kafirun, Nasr(Idadza)")
	else if timeIs(18,30)
		shalat("Lahab (Tabat yada), Ikhlas")
	else if timeIs(19,30)
		shalat("Falaq, Nas")
	;Journaling
	;else if timeIs(21,00)
	;	startJournaling()
	;Specific day
	if dayIs(1){
		if timeIs(10,00)
			openEmail()
	}
	else if dayIs(3){
		if timeIs(10,00)
			openEmail()
	}
	else if dayIs(4){
		if timeIs(12,00)
			openWeb("https://www.kompas.com/")
	}
	else if dayIs(5){
		if timeIs(10,00)
			openEmail()
	}
}
checkWeekend(){

}
startJournaling(){
	openWeb("https://www.appsheet.com/start/1d14c511-1cff-4fdd-9214-f75550286baf#appName=MyJournalApp-431400263&group=%5B%5D&page=deck&sort=%5B%7B%22Column%22%3A%22Time%22%2C%22Order%22%3A%22Descending%22%7D%5D&table=Entries&view=Entries")
}
openHabitica(){
	if !WinExist("Tasks | Habitica")
		Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe" --profile-directory="Profile 2" --app-id=pdigihnmoiplkhocekidmdcmhchhdpjo --app-url=https://habitica.com/ --app-run-on-os-login-mode=windowed --app-launch-source=19
	else WinActivate
}
openTasksBoard(){
	if !WinExist("TasksBoard | Desktop app for Google Tasks")
		Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe" --profile-directory="Profile 2" --app-id=ffpdhnednbmelagcknnegjemgooenfml --app-url=https://tasksboard.com/ --app-launch-source=4
else WinActivate
}
openEmail(){
	openWeb("https://mail.google.com/mail/u/0/#inbox")
}
shalat(text){
	;Send #m
	Msgbox %text%
}
notify(text){
	tooltip(text, 5000)
	ping()
}
timeIs(hour, minute){
	return A_Hour == hour && A_Min == minute
}
dayIs(day){
	return getDay()==day
}
dateIs(date) {
    currentDate := FormatTime(, "dd")
    return currentDate==date
}
getDay(Offset:=0) {
	someday := A_Now
	someday += Offset | 0, d
	someday := FormatTime(%someday%, dddd)
	Switch someday{
	case "Monday": Return 1
	case "Tuesday": Return 2
	case "Wednesday": Return 3
	case "Thursday": Return 4
	case "Friday": Return 5
	case "Saturday": Return 6
	Default: Return 7
	}
}
if(getDay()>5)
    ProcessClose("MouseWithoutBorders.exe")
checkInterval := 3 * 60 * 1000 ; 3 minutes in milliseconds
Loop{
	;Weekday
	if(getDay() > 0 && getDay() < 6){
		checkWeekday()
		Sleep 1000 * 60 ;1 minute sleep
	}
	;Weekend
	else {
		checkWeekend()
		Sleep 1000 * 60 * 60 * 2 ;3 hours sleep
	}
	
	;checkBluetooth()
}
checkBluetooth(){
	;Bluetooth
	connected := BluetoothGetState()
	; If Bluetooth is not connected to any device, start a timer
	if (connected = 0) {
		SetTimer TurnOffBluetooth, -%checkInterval%
		;MsgBox, Bluetooth not connected, turning off Bluetooth in %checkInterval% milliseconds.
	}
	; If Bluetooth is connected to a device, stop the timer
	else {
		SetTimer TurnOffBluetooth, Off
	}
}
BluetoothGetState() {
    VarSetCapacity(BluetoothRadioInfo, BLUETOOTH_DEVICE_INFO, 0)
    VarSetCapacity(BluetoothSearchParams, BLUETOOTH_DEVICE_SEARCH_PARAMS, 0)
    DllCall("Bthprops.cpl\BluetoothFindFirstRadio", "ptr", &BluetoothSearchParams, "ptr", &BluetoothRadioInfo)
    state := DllCall("Bthprops.cpl\BluetoothGetRadioInfo", "ptr", &BluetoothRadioInfo, "ptr", &BluetoothDeviceState, "uint", BLUETOOTH_DEVICE_STATE)
    DllCall("Bthprops.cpl\BluetoothFindRadioClose", "ptr", &BluetoothRadioInfo)
    return state
}
; Function to turn off Bluetooth
TurnOffBluetooth:
	RunWait %comspec% /c "devcon disable BTHENUM\{00000000-0000-0000-0000-000000000000}_LOCALMFG&0000",, Hide       
    SetTimer TurnOffBluetooth, Off
return
;Mouse function on
;=========================
; #Include %a_scriptdir%\..\..\___Functions.ahk
; #Include %a_scriptdir%\..\..\__Emojis.ahk
;#Include ___2nd Keyboard.ahk
