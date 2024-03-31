;Snap top right
CoordMode "ToolTip", "Screen"
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"

>^w:: {
    SetKeyDelay(50)
    SendEvent "{LWin down}{up}{up}{up}{up}{right}{LWin up}"
    SetKeyDelay(0)
}
;Snap bottom right
>^s:: {
    SetKeyDelay(50)
    SendEvent "{LWin down}{up}{up}{up}{up}{right}{down}{down}{LWin up}"
    SetKeyDelay(0)
}
;Snap bottom left
>^a:: {
    SetKeyDelay(50)
    SendEvent "{LWin down}{up}{up}{up}{up}{left}{down}{down}{LWin up}"
    SetKeyDelay(0)
}
;Snap top left
>^q:: {
    SetKeyDelay(50)
    SendEvent "{LWin down}{up}{up}{up}{up}{left}{LWin up}"
    SetKeyDelay(0)
}
;Snap left
>^1:: {
    SetKeyDelay(50)
    SendEvent "{LWin down}{up}{up}{up}{up}{left}{up}{left}{LWin up}"
    SetKeyDelay(0)
}
;Snap right
>^2::{
    SetKeyDelay(50)
    SendEvent "{LWin down}{up}{up}{up}{up}{right}{up}{right}{LWin up}"
    SetKeyDelay(0)
}
