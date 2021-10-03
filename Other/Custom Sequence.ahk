global xs := []
global ys := []
global colors := []

#Include ../___Basic.ahk

;Add x
>!/::
	isEmpty:= x[0]==""
	tooltip("Is empty: " . isEmpty)
Return
>!.::
	MouseGetPos x, y 
	PixelGetColor color, %x%, %y%, RGB
	xs.Push(x)
	ys.Push(y)
	colors.Push(color)
	tooltip("Sequence added. Total: " . xs.maxIndex())
Return
>!,::
	xs.removeAt(xs.maxIndex())
	ys.removeAt(ys.maxIndex())
	colors.removeAt(colors.maxIndex())
	tooltip("Sequence removed. Total: " . (xs.maxIndex()+1))
Return
>!;::
	i := 1
	while i <= xs.MaxIndex() {
	   waitClick(xs[i], ys[i], colors[i])
	   i++
	}
	tooltip("Sequence executed")
Return