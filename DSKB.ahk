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

WatchAxis2:
GetKeyState, JoyX, JoyX  ; Get position of X axis.
GetKeyState, JoyY, JoyY  ; Get position of Y axis.
KeyToHoldDownPrev2 = %KeyToHoldDown2%  ; Prev now holds the key that was down before (if any).

WatchAxis3:
GetKeyState, JoyZ, JoyZ  ; Get position of X axis.
GetKeyState, JoyR, JoyR  ; Get position of Y axis.
KeyToHoldDownPrev3 = %KeyToHoldDown3%  ; Prev now holds the key that was down before (if any).

;; Map: Write up a map so I can program the keys by real name (e.g., square, DLeft, R3)
Square = Joy1
Ex = Joy2
Circle = Joy3
Triangle = Joy4
L1 = Joy5
L2 = Joy7
R1 = Joy6
R2 = Joy8
L3 = Joy11
R3 = Joy12
share = Joy9
options = Joy10
PS = Joy13
pad = Joy14
;; Dpad is JoyPOV clockwise from 0 at Top to 90, 180, 270. Default is -1 
;; Lstick is JoyX, JoyY
;; Rstick is JoyZ, JoyR




;; Right-side face buttons

Square::
    Send E  ;; V
return
Ex::
    Send O  ;; J
return
Circle::
    Send N  ;; L
return
Triangle::
    Send I  ;; K
return

;; Left-side face buttons
            ;; Layer 2 keys
DRight = H  ;; X
DDown = A   ;; W
DLeft = T   ;; F
DUp = S     ;; B

;; Left Stick face "buttons"

JLRight = C
JLDown = D  ;; Q
JLLeft = R
JLUp = G

;; Left Stick face "buttons"

JRRight = P
JRDown = Y  ;; Z
JRLeft = M
JRUp = U

;; Shoulders

L1::
    Send BackSpace
return
L2::
    HOLD SHIFT
return
R1::
    Send Space
return
R2::
    SWITCH LAYERS
return

;; Rare face buttons

L3::
    Send something
return
R3::
    Send Enter
return
share::
    Send something
return
options::
    Send something
return
PS::
    Send something
return
pad::
    Send something
return


if POV < 0   ; No angle to report
    KeyToHoldDown =
else if POV between 2251 and 3150  ; 225 to 315 degrees: Left
    KeyToHoldDown = DLeft
else if POV between 4501 and 1350  ; 45 to 135 degrees: Right
    KeyToHoldDown = DRight
else if POV between 1351 and 2250  ; 135 to 225 degrees: Down
    KeyToHoldDown = DDown
else                               ; Everything else: Up
    KeyToHoldDown = DUp

if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev% up}  ; Release it.
if KeyToHoldDown   ; There is a key to press down.
    Send, {%KeyToHoldDown% down}  ; Press it down.
return

if JoyX > 70
    KeyToHoldDown2 = JLRight
else if JoyX < 30
    KeyToHoldDown2 = JLLeft
else if JoyY > 70
    KeyToHoldDown2 = JLDown
else if JoyY < 30
    KeyToHoldDown2 = JLUp
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


if JoyX > 70
    KeyToHoldDown3 = JRRight
else if JoyX < 30
    KeyToHoldDown3 = JRLeft
else if JoyY > 70
    KeyToHoldDown3 = JRDown
else if JoyY < 30
    KeyToHoldDown3 = JRUp
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