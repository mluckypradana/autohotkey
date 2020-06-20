#Include Gdip.ahk

pToken := Gdip_Startup()
winName := "BlueStacks"
clientW := 868 ; set your client area width
clientH := 720 ; set your client area height
WinGetPos, x, y, w, h, %winName%
winBorder := (w-clientW)/2
x := x+winBorder
y := y+(h-clientH-winBorder)
snap := Gdip_BitmapFromScreen(x "|" y "|" clientW "|" clientH)
Gdip_SaveBitmapToFile(snap, "snap.png")
Gdip_DisposeImage(snap)
Gdip_ShutDown(pToken)
;Msgbox "Succedd"

#g:: Gosub, FromWindow

FromWindow:
InputBox, window , Window Title, Enter Window Title, , 300, 100,,,,,ahk_class Photoshop

;dat:= A_Now_Format(A_Now)
;file := folder_path "screenshot ”" window "” " A_Now_Format(A_Now) ".png"
file%index%:= folder_path "screenshot window.png"
ID:= WinExist(window)
msgbox %ID%
;IfWinExist, window 
;{
;    WinActivate
;}

y:=file%index%
ClipFromWindow(y,ID)
;Gosub, makeGUI
index+=1
return

ClipFromWindow(outfile, ID) {
pToken := Gdip_Startup()
pBitmap:=Gdip_BitmapFromHWND(ID)
Gdip_SaveBitmapToFile(pBitmap, outfile, 100)


Gdip_DisposeImage(pBitmap)
Gdip_Shutdown(pToken)
}


makeGUI:
;Gui,%index% : +LastFound +Resize +Minsize400x330 ; +AlwaysOnTop 
Gui,%index%: Color, 6B8590
Gui,%index%: Margin,0,0
Gui,%index%: Add, Picture, x10 y4 w16 h16 gSave Icon259 AltSubmit, shell32.dll ;

file_GUI:= file%index%
;MsgBox, , , % "makeGUI: " index " - " file1
Gui,%index%: Add, Picture, x0 y24 , %file_GUI%
Gui,%index%: Show,, Screenshots - Drozd
index+=1
return