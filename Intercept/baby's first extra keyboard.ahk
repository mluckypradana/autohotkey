#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance force
#if (getKeyState("F23", "P"))
F23::return
q::msgbox, you pressed Q on the extra keyboard
w::msgbox, you pressed %A_thishotkey% on the extra keyboard
e::tooltip, you pressed %A_thishotkey% on the extra keyboard
r::SoundBeep, 1000, 500
#if
;Done with F23