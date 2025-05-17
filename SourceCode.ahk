toggle := false
savedX := 0
savedY := 0
key := "f" ; Set your desired key here (e.g., "[", "F1", "LButton", etc.)

; Dynamically set up the hotkey
Hotkey, %key%, ToggleMouseClick
return

ToggleMouseClick:
if (!toggle) {
    MouseGetPos, savedX, savedY  ; Save original mouse position
    MouseMove, 1885, 21, 0
    DllCall("mouse_event", "UInt", 0x02, "UInt", 0, "UInt", 0, "UInt", 0, "UPtr", 0)  ; Hold down left mouse button
    SetTimer, LockMouse, 10  ; Start locking mouse position
    toggle := true
} else {
    SetTimer, LockMouse, Off  ; Stop locking mouse position
    MouseMove, %savedX%, %savedY%, 0  ; Move back to saved position
    DllCall("mouse_event", "UInt", 0x04, "UInt", 0, "UInt", 0, "UInt", 0, "UPtr", 0)  ; Release left mouse button
    toggle := false
}
return

LockMouse:
    MouseMove, 1885, 21, 0  ; Keep mouse locked at fixed position
return