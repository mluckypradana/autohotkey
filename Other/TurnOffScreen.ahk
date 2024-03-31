#persistent
SETTIMER, Check_Idle, 500
 
Check_Idle:
if A_TimeIdle > 100000
	;msgbox, the system has been idle for at least 30 seconds.
	SendMessage,0x112,0xF170,2,,Program Manager
else{
	
	Sleep 2000
}
return