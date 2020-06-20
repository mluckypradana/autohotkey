setmousedelay -1
active:=true
attack:=true
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false

Escape::
	ExitApp
Return

m::
loop
{
   if getkeystate("m", "p") ;if a button is Physically held down by the user.
    {
      Click, R, Down
    }
  else
    {
      Click, R, Up
      break
    }
}
return