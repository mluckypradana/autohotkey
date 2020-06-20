^c::
	MsgBox haha
	PixelSearch, Px, Py, 878, 384, 978, 484, 0xffffff, 3, Fast
	if ErrorLevel
	    MsgBox, That color was not found in the specified region.
	else
	    MsgBox, A color within 3 shades of variation was found at X%Px% Y%Py%.
Return