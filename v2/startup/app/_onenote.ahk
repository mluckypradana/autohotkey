#HotIf WinActive("ahk_exe ONENOTE.exe")
Global withSeparator := true
changeFontColor() {
    Send("{Shift up}{Alt up}{Ctrl up}")
    SendEvent "!hfc"
    Send("{Shift up}{Alt up}{Ctrl up}")
}
sendSeparator() {
    Send " | "
}
untapButtons(){
}
!Space:: {
    Global withSeparator
    withSeparator := !withSeparator
    tip("withSeparator: " . withSeparator)
}
;Normal
!`:: {
    changeFontColor()
    SendEvent "a"
    tip("Normal", 200)
}
;Remark
!1:: {
    global withSeparator
    changeFontColor()
    Send "{Up 2}{Left 1}{Space}"
    if (withSeparator)
        sendSeparator()
    tip("Remark", 200)
}
;Example
!2:: {
    changeFontColor()
    SendEvent "{Up 2}{Left 5}{Space}"
    if (withSeparator)
        sendSeparator()
    tip("Example", 200)
}
;Header
!3:: {
    changeFontColor()
    SendEvent "{Up 2}{Left 9}{Space}"
    tip("Header", 200)
}
;Important
!4:: {
    Send "!hfc{Up 2}{Left 8}{Space}"
    untapButtons()
    if (withSeparator)
        sendSeparator()
    tip("Important", 200)
}
;Action
!5:: {
    Send "!hfc{Up 2}{Left 6}{Space}"
    if (withSeparator)
        sendSeparator()
    tip("Action", 200)
}
;Play pause media
!s::{
    Send("{Media_Play_Pause}")
}
#HotIf