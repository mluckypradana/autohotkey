CoordMode, mouse, screen ; does NOT use active window coords
CoordMode, Pixel, screen
SetMouseDelay -1
;SetKeyDelay 80
;https://gamefaqs.gamespot.com/arcade/564869-street-fighter-alpha-3/faqs/329

+z::
	;Hadouken QCF + P
	Send {k down}{l down}{k up}{e down}{l up}{e up}
Return
+x::
	;Shakunetsu Hadouken HCF + P
	Send {j down}{k down}{j up}{l down}{k up}{e down}{l up}{e up}
Return
+c::
	;;Hurricane/Cyclone Kick QCB + K
	Send {k down}{j down}{k up}{d down}{j up}{d up}
Return
+v::
	;Super hadoucen QCF, QCF + P
	Send {k down}{l down}{k up}{l up}
	Send {k down}{l down}{k up}{e down}{l up}{e up}
Return
+b::
	;Super Hurricane Kick QCB, QCB + K
	Send {k down}{j down}{k up}{j up}
	Send {k down}{j down}{k up}{d down}{j up}{d up}
Return
+n:: ;Hard
	;Metsu Shouryuuken (Z)  QCF, d, df + K
	Send {k down}{l down}{k up}{l up}
	Send {k down}{l down}{d down}{k up}{l up}{d up}
Return