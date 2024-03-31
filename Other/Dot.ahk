#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
Gui, 1:New, +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow +E0x20 +HwndDot
WinSet, Transparent, 255
d := 5  ; Specify the size of the dot marker
Gui, 1:Color, Red ; Set the GUI background color to red

!q::
    MouseGetPos, mouseX, mouseY  ; Get the current cursor position
    Gui, 1:Show,% "w"d " h"d " x" (mouseX-d) " y" (mouseY-d) " NoActivate"
    ;Gui, 1:Show,% "w"d " h"d " x" (A_ScreenWidth-d)//2 " y" (A_ScreenHeight-d)//2 " NoActivate"
    Return

!w::
    WinHide, ahk_id %Dot%
    Return

GuiEscape:
GuiClose:
    ExitApp  ; Close the script when pressing Esc or closing the GUI
    Return
