; Compiler: 
; &"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"

SetCapsLockState, AlwaysOff
#if GetKeyState("CapsLock","P")
; backspace to delete
BackSpace::Delete

; wasd bindings
w::up
a::left
s::down
d::right


; home end
q::Home
e::End

; tab navigation 
j::Send ^+{Tab}
z::Send ^+{Tab}

k::Send ^{Tab}
c::Send ^{Tab}

; f keys
1::F1
2::F2
3::F3
4::F4
5::F5
6::F6
7::F7
8::F8
9::F9
0::F10
-::F11
=::F12

; bind x to shift + f10
x::Send +{F10}

; map [ to caps lock
[::CapsLock

; map / to `
/::`

#if


; permanently remap these keys
; bind ` to esc
`::Esc
; bind esc to `
Esc::`

; leave this commented out 240319 since it was causing problems over RDP
; bind right ctrl to right win key
;RCtrl::RWin
; right alt to right control
;RAlt::RCtrl
