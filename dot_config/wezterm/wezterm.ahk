#SingleInstance Force


#Space::ToggleWindowVisibility("org.wezfurlong.wezterm", "wezterm-gui.exe")
ToggleWindowVisibility(cls, exe) {
  DetectHiddenWindows(true)

  if WinExist("ahk_class" cls) {
    if WinActive("ahk_class" cls) {
      WinHide("ahk_class" cls)
      Send("!{Tab}")
    } else {
      WinMaximize("ahk_class" cls)
      WinShow("ahk_class" cls)
      WinActivate("ahk_class" cls)
    }
  } else {
    Run(exe)
  }

  DetectHiddenWindows(false)
}
