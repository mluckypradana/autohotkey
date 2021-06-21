Gui, Color, Black

Gui, -Caption +AlwaysOnTop

SysGet, Mon, Monitor

Return



!y::Gui, Show, w%MonRight% h%MonBottom% x0 y0

!x::Gui, Hide