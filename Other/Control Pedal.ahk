Global a := [0, 0]
Global b := [0, 0]
Global c := [0, 0]
Global d := [0, 0]
Global e := [0, 0]
Global f := [0, 0]
Global g := [0, 0]
Global h := [0, 0]
Global i := [0, 0]
Global j := [0, 0]
Global k := [0, 0]
Global l := [0, 0]
Global m := [0, 0]
Global n := [0, 0]
Global o := [0, 0]
Global p := [0, 0]
Global q := [0, 0]
Global r := [0, 0]
Global s := [0, 0]
Global t := [0, 0]
Global u := [0, 0]
Global v := [0, 0]
Global v := [0, 0]
Global w := [0, 0]
Global x := [0, 0]
Global y := [0, 0]
Global z := [0, 0]
Global space := [0, 0]
#Include ../___Basic.ahk

^Esc::ExitApp
save(array){
	SoundBeep 350, 50
	MouseGetPos x, y
	array[0] := x
	array[1] := y
}
clickSaved(array){
	x := array[0]
	y := array[1]
	click(x, y)
}

!a::save(a)
a::clickSaved(a)
!b::save(b)
b::clickSaved(b)
!c::save(c)
c::clickSaved(c)
!d::save(d)
d::clickSaved(d)
!e::save(e)
e::clickSaved(e)
!f::save(f)
f::clickSaved(f)
!g::save(g)
g::clickSaved(g)
!h::save(h)
h::clickSaved(h)
!i::save(i)
i::clickSaved(i)
!j::save(j)
j::clickSaved(j)
!k::save(k)
k::clickSaved(k)
!l::save(l)
l::clickSaved(l)
!m::save(m)
m::clickSaved(m)
!n::save(n)
n::clickSaved(n)
!o::save(o)
o::clickSaved(o)
!p::save(p)
p::clickSaved(p)
!q::save(q)
q::clickSaved(q)
!r::save(r)
r::clickSaved(r)
!s::save(s)
s::clickSaved(s)
!t::save(t)
t::clickSaved(t)
!u::save(u)
u::clickSaved(u)
!v::save(v)
v::clickSaved(v)
!w::save(w)
w::clickSaved(w)
!x::save(x)
x::clickSaved(x)
!y::save(y)
y::clickSaved(y)
!z::save(z)
z::clickSaved(z)
!space::save(space)
space::clickSaved(space)