Hotkey, Space, Disable, Off
Disable:
return
~l::Hotkey, Space, Toggle  ; ~ assumes you don't want to disable L

l::Send % "{Space " (GetKeyState("Space") ? "Up" : "Down") . "}"

