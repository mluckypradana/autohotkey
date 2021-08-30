#Include __Basic.ahk
SetKeydelay -1

#q::dragToMouse(684, 686)
#w::dragToMouse(763, 702)
#e::dragToMouse(842, 695)
#r::dragToMouse(919, 703)
#a::dragToMouse(1003, 704)
#s::dragToMouse(1082, 697)
#d::dragToMouse(1159, 699)
#f::dragToMouse(1242, 695)
dragToMouse(dx, dy){
	MouseGetPos x, y
	drag(dx, dy, x,  y)
}