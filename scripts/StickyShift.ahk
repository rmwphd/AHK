;  Sticky Shift with 5-seconds timeout
; courtesy Gogo on AHK forums Posted 17 September 2012



; LShift::
;   Send {LShift down}
;   Input key, M V L1 T5, {F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12} {Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{PrintScreen}{Pause}{AppsKey}
;   Send {LShift up}
;   return

; This is a good template for stickying things, but there's unexpected
; locking behavior when you hold the key down... Maybe...:

; GetKeyState, shiftyl, LShift
; if shiftyl = U
; {
;     LShift Up::
;     Send {LShift down}
;     Input key, M V L1 T5, {F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12} {Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{PrintScreen}{Pause}{AppsKey}
;     Send {LShift up}
;     return
; }


; Didn't fix it. 


; From Xorxpto:

*$Shift::
key = 0
Input, key, L1 M
SendInput {Shift Down}{%key%}{Shift Up}
return

; I wonder what it does if you hold down shift...
