#Persistent
timeOut := 3000

SetTimer, CheckIdle, 1000
reloaded:=false

CheckIdle:
    Global reloaded
    If WinActive("ahk_exe studio64.exe") {
        If (A_TimeIdle > timeOut) {
            if(!reloaded){
                reload()
                reloaded:=true
            }
        }
    }
Return

reload(){
    tooltip("Reloading")
    Send ^\
}

; Hotkey to reset the 'reloaded' variable when any key is pressed
;#IfWinActive ahk_exe studio64.exe
#Include ../___Functions.ahk