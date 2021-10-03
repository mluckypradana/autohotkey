:R*?:ddd::
FormatTime, CurrentDateTime,, yyyyMMdd
SendInput %CurrentDateTime%
return
:R*?:xxx::
FormatTime, CurrentDateTime,, yyMMddHHmmss
SendInput %CurrentDateTime%
return
:R*?:aaa::
FormatTime, CurrentDateTime,, yyMMdd
SendInput %CurrentDateTime%
return
:R*?:jjd::
FormatTime, CurrentDateTime,, dd-MM-yy
SendInput %CurrentDateTime%
return
:R*?:yyy::
FormatTime, CurrentDateTime,, dd-MM-yy HH:mm
SendInput %CurrentDateTime%
return

:R*?:kkk::
Mousemove 0, 0
return				