

Capslock & F3::
	MouseGetPos x, y
	Loop, 40{
		circle(x, y, A_Index*18, 50)
	}
	MouseMove x, y
Return

circle(xc, yc, degree, radius){
	r := degree * 3.14 / 180
	x := xc-(radius * cos(r))
	y := yc-(radius * sin(r))
	MouseMove x, y
	Sleep 1
}
