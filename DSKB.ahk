;; Just playing with AutoHotKey ideas for a controller keyboard
;;
;;

;#NoTrayIcon

#Persistent  ; Keep this script running until the user explicitly exits it.
 SetTimer, WatchPOV, 5
 SetTimer, WatchAxis2, 5
 SetTimer, WatchAxis3, 5
return

WatchPOV:
GetKeyState, POV, JoyPOV  ; Get position of the POV control.
KeyToHoldDownPrev = %KeyToHoldDown%  ; Prev now holds the key that was down before (if any).

; Some joysticks might have a smooth/continous POV rather than one in fixed increments.
; To support them all, use a range:
if POV < 0   ; No angle to report
    KeyToHoldDown =
else if POV > 31500                 ; 315 to 360 degrees: Forward
    KeyToHoldDown = s
else if POV between 0 and 4500      ; 0 to 45 degrees: Forward
    KeyToHoldDown = s
else if POV between 4501 and 13500  ; 45 to 135 degrees: Right
    KeyToHoldDown = a
else if POV between 13501 and 22500 ; 135 to 225 degrees: Down
    KeyToHoldDown = h
else                                ; 225 to 315 degrees: Left
    KeyToHoldDown = t

if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev% up}  ; Release it.
if KeyToHoldDown   ; There is a key to press down.
    Send, {%KeyToHoldDown% down}  ; Press it down.
return

WatchAxis2:
GetKeyState, joyx, JoyX  ; Get position of X axis.
GetKeyState, joyy, JoyY  ; Get position of Y axis.
KeyToHoldDownPrev2 = %KeyToHoldDown2%  ; Prev now holds the key that was down before (if any).

if JoyX > 70
    KeyToHoldDown2 = c
else if JoyX < 30
    KeyToHoldDown2 = r
else if JoyY > 70
    KeyToHoldDown2 = d
else if JoyY < 30
    KeyToHoldDown2 = g
else
    KeyToHoldDown2 =

if KeyToHoldDown2 = %KeyToHoldDownPrev2%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev2   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev2% up}  ; Release it.
if KeyToHoldDown2   ; There is a key to press down.
    Send, {%KeyToHoldDown2% down}  ; Press it down.
return

WatchAxis3:
GetKeyState, joyz, JoyZ  ; Get position of X axis.
GetKeyState, joyr, JoyR  ; Get position of Y axis.
KeyToHoldDownPrev3 = %KeyToHoldDown3%  ; Prev now holds the key that was down before (if any).

if JoyZ > 70
    KeyToHoldDown3 = p
else if JoyZ < 30
    KeyToHoldDown3 = m
else if JoyR > 70
    KeyToHoldDown3 = y
else if JoyR < 30
    KeyToHoldDown3 = u
else
    KeyToHoldDown3 =

if KeyToHoldDown3 = %KeyToHoldDownPrev3%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev3   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev3% up}  ; Release it.
if KeyToHoldDown3   ; There is a key to press down.
    Send, {%KeyToHoldDown3% down}  ; Press it down.
return


;; Right-side face buttons

Joy1:: ; Square
    Send e  ;; v
return
Joy2:: ; Ex
    Send o  ;; j
return
Joy3:: ; Circle
    Send n  ;; l
return
Joy4:: ; Triangle
    Send i  ;; k
return 

;; Shoulders

; Joy5:: BackSpace
Joy5::
Send {BackSpace down}   ; Press the button down.
SetTimer, WaitForJoy5, 250  ; Reduce the number 30 to 20 or 10 to send keys faster. Increase it to send slower.
return

WaitForJoy5:
if not GetKeyState("Joy5")  ; The button has been released.
{
    Send {BackSpace up}  ; Release the key.
    SetTimer, WaitForJoy5, off  ; Stop monitoring the button.
    return
}
Send {BackSpace down}  ; Send another keystroke.
return

Joy7:: 
  Send {Shift Down}
  KeyWait, Joy7
  Send {Shift Up}
return
Joy6:: Space

;Joy8:: ;layer swap


;; Rare face buttons

; L3::
;     ;;Send something
; return
Joy12:: 
    Send {Enter}
return

; share::
;     ;;Send something
; return
; options::
;     ;;Send something
; return
; PS::
;     ;;Send something
; return
; pad::
;     ;;Send something
; return
