CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
#SingleInstance force
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1


+!t::
	Send tools:text=""
	Send {Left}
Return

+!c::
	Send tools:srcCompat="@tools:sample/backgrounds/scenic"
Return