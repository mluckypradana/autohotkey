#NoTrayIcon

SetCapsLockState, AlwaysOff

CapsLock & i::Send {Up}
CapsLock & k::Send {Down}
CapsLock & j::Send {Left}
CapsLock & l::Send {Right}
CapsLock & h::Send {PgUp}
CapsLock & n::Send {PgDn}
CapsLock & u::Send {Home}
CapsLock & o::Send {End}
CapsLock & y::Send {Insert}
CapsLock & z::Send {Insert}
CapsLock & m::Send {Del}

CapsLock::
  state := GetKeyState("Capslock", "T")
  if state
    SetCapsLockState, AlwaysOff
  else
    SetCapsLockState, AlwaysOn
return