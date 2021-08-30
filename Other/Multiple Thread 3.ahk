global threads:=[]
global threadTotal:=9
global thread2:=false
global thread3:=false

#Include ../___Basic.ahk


!p::
	ExitApp
Return

>!k::
	startThreads()
Return
>!>+k::
	beep()
	stopThreads()
Return
startThreads(){
	beep()
	untapButtons()
	Loop, 3 {
		num :=	A_Index-1
		SendInput {Shift down}{%num%}
		Sleep 200
		SendInput {Shift up}
	}
	Send {Shift up}
	untapButtons()
}
send(input){
	send %input%
}
stopThreads(){
	Loop, 4 {
		threads[A_Index-1]:=false
	}
}
+0::startThread(0)
+1::startThread(1)
+3::
	beep()
	thread2:=true
	while(thread2){
		if(c(1501, 531, 0x272822))
			tooltip("Right")
	}
Return
+!3::thread3:=false

startThread(index){
	threads[index]:=true
	while(threads[index]){
		Switch index{
			Case 0:thread0()
			Case 1:thread1()
			Default:{
				tooltip(index)
			}
		}
	}
}
thread0(){
	move(747, 503)
	Sleep 1000
}
thread1(){
	move(1417, 500)
	Sleep 3000
}
;Regular click
!/::
	gosub, stoplabel
	valid:=true
	if valid
		this.ahkterminate()
	valid:=false
	if valid ? tooltip("True 2") : tooltip("False 2")

Return
stoplabel:
Return