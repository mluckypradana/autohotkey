
SetBatchLines, -1

#Include Gdip.ahk  ;http://www.autohotkey.com/forum/topic32238.html

If !pToken := Gdip_Startup()
{
    MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
    ExitApp
}


Gui, +hwndhwnd
Gui, color,red
Gui, show,w200 h200 x200 y200
sleep 5000  ;you can use this time to make it inactive or move another window over it

x:=100
y:=100

ID:= WinExist(window)

pBitmap:=Gdip_BitmapFromHWND(hwnd)
ARGB := GDIP_GetPixel(pBitmap, x, y)

setformat,integer,hex
ARGB +=0

msgbox %ARGB%

GDIP_DisposeImage(pBitMap)
GDIP_Shutdown(pToken)
exitapp
return