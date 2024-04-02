; Initialize the toggle variable
toggle := 0

; Define the hotkey combination (CapsLock + Z)
CapsLock & z::
    ; Toggle the state
    toggle := !toggle
return

; Define the "F" key behavior
*f::
    if (toggle) {
        Click ; Perform the left click
    } else {
        Send, {f}
    }
return

; Define the "D" key behavior
*d::
    if (toggle) {
        Click, right ; Perform the right click
    } else {
        Send, {d}
    }
return

; Define the "E" key behavior
*e::
    if (toggle) {
        Click, middle ; Perform the middle click
    } else {
        Send, {e}
    }
return
