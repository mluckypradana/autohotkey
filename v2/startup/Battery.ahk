#Requires AutoHotkey v2.0
#SingleInstance Force
CoordMode "ToolTip", "Screen"
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"

; This script is to monitor battery charging capacity, if battery is charging and capacity is more than 90%, then tell user to unplug the charger
; If battery is discharging and capacity is less than 15%, then tell user to plug in the charger

Persistent
SetTimer checkBattery, 180000 ;180000 ; Check battery every 3 minutes

; MsgBox str, 'Battery status', 64

; CheckBattery:: {
; 	checkbattery()
; }

killProcesses(){
	; Runwait "Taskkill /IM Widgets.exe /F"
	; Runwait "Taskkill /IM OfficeClickToRun.exe /F"
    ProcessClose "Notepad.exe"
    ProcessClose("Widgets.exe")
    ProcessClose("TextInputHost.exe")
}

checkBattery() {
	; killProcesses()
	battStatus := ['Discharging', 'AC', 'Fully charged'
		, 'Low', 'Critical', 'Charging'
		, 'High, charging', 'Low, charging', 'Critical, charging'
		, 'Undefined', 'Partially charged']
	For batt in ComObjGet('winmgmts:').ExecQuery('SELECT * FROM Win32_Battery'){
		status := battStatus[batt.BatteryStatus]
		power := batt.EstimatedChargeRemaining
		
		str := battStatus[batt.BatteryStatus] '`n'
			. batt.EstimatedChargeRemaining '%`n'
			. batt.Status
	}
	if (status == 'Discharging' && power <= 15){
		SoundBeep 1000, 700 ; Add sound beep when battery is charged above 90%
		tip("Plug the charger.", 5000)
	}
	else if (status == 'AC' && power >= 90) {
		SoundBeep 1000, 500 ; Add sound beep when battery is charged above 90%
		tip("Unplug the charger", 5000)
	}
}

tip(text, timeout := 1000) {
	ToolTip text, timeout
	SetTimer () => ToolTip(), timeout * -1
}