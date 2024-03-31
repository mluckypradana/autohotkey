; CapsLock + 1: Activate or open Vs COde window
CapsLock & 1:: ActivateOrOpenWindow("Visual Studio Code", "C:\Users\Lenovo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk")

; CapsLock + w: Activate or open WhatsApp window1
CapsLock & w:: ActivateOrOpenWindow("WhatsApp", "C:\Program Files\WindowsApps\5319275A.51895FA4EA97F_2.2405.6.0_x64__cv1g1gvanyjgm\WhatsApp.exe")

; CapsLock + d: Activate or open TickTick window
CapsLock & d:: ActivateOrOpenWindow("TickTick", "C:\Program Files (x86)\TickTick\TickTick.exe")

; CapsLock + a: Activate or open Microsoft Edge window
CapsLock & a:: ActivateOrOpenWindow("Microsoft Edge", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")

; CapsLock + s: Activate or open OneNote window
CapsLock & s:: ActivateOrOpenWindow("OneNote", "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE")

; CapsLock + z: Activate or open NOtepdad window
CapsLock & z:: ActivateOrOpenWindow("Notepad", "Notepad.exe")

; CapsLock + e: Activate or open GPT and Bard window
CapsLock & e:: {
    ActivateOrOpenWindow("GPT", '"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=jckaldkomadaenmmgladeopgmfbahfjm')
    ActivateOrOpenWindow("Bard", '"C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=nohacooabmgpjcdeajcfjgkpfibiffjf')
}

; CapsLock + x: Activate or open Command Prompt window
CapsLock & x:: {
    GroupAdd "Prompt", "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
    vWinList := WinGetList("ahk_group Prompt")
    windowActive := false
    for vWin in vWinList {
        WinActivate("ahk_id " vWin)
        windowActive := true
    }
    if !windowActive {
        Run "cmd", "C:\Users\Lenovo"
    }
}

; CapsLock + `: Activate or open Explorer window
; CapsLock + `, Activate all Explorer windows within current desktop
CapsLock & `:: {
    GroupAdd "Explorer", "ahk_class ExploreWClass"
    GroupAdd "Explorer", "ahk_class CabinetWClass"
    vWinList := WinGetList("ahk_group Explorer")
    for vWin in vWinList
        WinActivate("ahk_id " vWin)
}

; CapsLock + c: Activate or open Spotify window
CapsLock & c:: ActivateOrOpenWindow("Spotify", '"C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe"  --profile-directory=Default --app-id=pjibgclleladliembfgfagdaldikeohf --app-url=https://open.spotify.com/?utm_source=pwa_install --app-launch-source=4')

ActivateOrOpenWindow(title, executable) {
    if WinExist(title)
        WinActivate
    Else
        Run(executable)
}