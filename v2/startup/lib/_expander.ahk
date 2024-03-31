Global iniFilename
Global myGui
initVars()
:*?:;*:: {
    SendInput "" ;  ; Send back the original ;
    SendInput "{Right}{Right}"  ; Move the cursor past the first ;
    SendInput "{Space}%ExpandText(clipboard)%"
    clipboard := ""  ; Clear the clipboard
    Return
}

:*?::con:: {
    IB := InputBox(get("context"), "Set context", "")
    if IB.Result != "Cancel"
        set("context", IB.value)
}
:*?:;con:: {
    SendEvent(get("context"))
}
:*?:;uni:: {
    SendEvent(get("uni"))
}
:*?:;input:: {
    myGui := Gui(, "Simple Input Example")
    myGui.Add("Text", , "First name:")
    myGui.Add("Text", , "Last name:")
    myGui.Add("Edit", "vFirstName ym")  ; The ym option starts a new column of controls.
    myGui.Add("Edit", "vLastName")
    MyDDL := myGui.Add("DropDownList", "vDropdown", ["Red", "Green", "Blue"])
    MyDDL.ToolTip := "Choose a color from the drop-down list."
    myGui.Add("Text", "ym", "Remark")
    myGui.Add("Button", "default xs", "OK").OnEvent("Click", setvar)
    myGui.Show()
}

:*?:;get:: {
    Global myGui
    myGui := Gui(, "Set Variable")
    myGui.Add("Text", , "Key: ")
    myGui.Add("Edit", "vKey ym")  ; The ym option starts a new column of controls.
    myGui.Add("Button", "default xs", "OK").OnEvent("Click", getvar)
    myGui.Show()
}

:*?:;set:: {
    Global myGui
    myGui := Gui(, "Set Variable")
    myGui.Add("Text", , "Key: ")
    myGui.Add("Text", , "Value:")
    myGui.Add("Edit", "vKey ym")  ; The ym option starts a new column of controls.
    myGui.Add("Edit", "vValue")
    myGui.Add("Button", "default xs", "OK").OnEvent("Click", setvar)
    myGui.Show()
}

setvar(*) {
    Global myGui
    Saved := myGui.Submit()
    set(Saved.key, Saved.value)
}
getvar(*) {
    Global myGui
    Saved := myGui.Submit()
    Send(get(Saved.key))
}

initVars() {
    Global iniFilename
    scriptPath := SubStr(A_ScriptFullPath, 1, StrLen(A_ScriptFullPath) - StrLen(A_ScriptName))
    iniFilename := scriptPath . "\Variables.ini"
    If !FileExist(iniFilename) {
        FileAppend "", iniFilename, "CP0"
        set("myVariable", "default value")
        set("context", "default context")
    }
}
get(key) {
    try {
        return IniRead(iniFilename, "General", key)
    } catch (Error as e) {
        return ""
    }
}

; Set a value in the .ini file
set(key, value) {
    ;Add extra char "{" when contains "#"
    if (InStr(value, "#"))
        value := StrReplace(value, "#", "{#}")
    IniWrite(value, iniFilename, "General", key)
}