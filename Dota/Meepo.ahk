SetKeyDelay, -1

;Ultimate
Space & c::
	Send scqx
	Sleep 700
	poof()
Return

Space & w::
	poof()
Return

poof(){
	Send w
	Send {tab}w
	Send {tab}w
	Send {tab}w
	Send {tab}w
	Send {F1}7
}
;TODO Fountain