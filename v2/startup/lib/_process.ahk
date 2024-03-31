killTask("Widgets")
killTask("WidgetService")
killTask("UltraViewer_Service")
killTask("jusched")
killTask("openvpn")
killTask("ONENOTEM")
killTask("ProtonVPN.WireGuardService")
killTask("ProtonVPNService")
killTask("SecurityHealthService")
killTask("mDNSResponder")
killTask("TabTip")
killTask("PresentationFontCache")
killTask("SearchIndexer")
killTask("ProtonVPNService")
killTask("UNCServer")
killTask("TvsuCommandLauncher")
killTask("NVDisplay.Container")
killTask("Tvsukernel") ;Lenovo system update
killTask("smartscreen") ;Lenovo system update
killTask("ProtonVPNService")
killTask("OfficeClickToRun")
killTask("spoolsv") ;Printer
killTask("BingChatInstaller") ;Microsoft bing
;AMD
killTask("CCC")
killTask("MOM")
;Google
killTask("GoogleCrashHandler")
killTask("GoogleCrashHandler64")
killTask("GoogleUpdate")
killTask("MicrosoftEdgeUpdate")
killTask("BraveUpdate")

lowPrio("TextInputHost")
lowPrio("MsMpEng")
lowPrio("dwm")
lowPrio("InputDirector")
lowPrio("InputDirectorSessionHelper")
lowPrio("OfficeClickToRun")
lowPrio("SearchHost")
lowPrio("StartMenuExperienceHost")

lowPrio(exeName) {
    Run("wmic process where name='" . exeName . ".exe' CALL setpriority 'idle'", , "Hide")
}
killTask(exeName) {
    Run("taskkill /f /im " . exeName . ".exe /t", , "Hide")
}