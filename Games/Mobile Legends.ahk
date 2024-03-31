

!p::ExitApp
;Wait
!1::
	openChat()
	Send 4
Return
;Enemy missing
!2::
	openChat()
	Send {F2}
Return
;Split push
!3::
	openChat()
	Send {F3}
Return
;Well played
!4::
	openChat()
	Send {F4}
Return
;Ult ready
!5::
	openChat()
	Send {F1}
Return
;Def
!`::
	openChat()
	Send x
Return
!6::
	openChat()
	Send {F6}
Return
openChat(){
	Send {F4}
}
#Include ../___Functions.ahk
