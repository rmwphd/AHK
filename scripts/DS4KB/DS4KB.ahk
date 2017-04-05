;; Building a controller keyboard!
;; Need to build a key diagram....
;; Author: Reed Williams rmwphd@gmail.com
;;
;; Letter frequency, English: etaoi nshrd lcumw fgypb vkjxqz 
;; Letter frequency, alt:     etaon rishd lfcmu gypwb vkjxqz 
;; Bigram frequency: th he an re er in on at nd st es en of te ed or ti hi as to 
;; Trigram freq, crypto: the, and, tha, ent, ing, ion, tio, for
;; 

#Persistent  ; Keep this script running until the user explicitly exits it.
 SetTimer, WatchPOV, 1
 SetTimer, WatchAxis2, 1
 SetTimer, WatchAxis3, 1
 SetTimer, WatchLayer, 1
return

#include workmanesque.ahk

;; DPad Stuff ~~~~~~~~~~~~~~~~

WatchPOV:
    GetKeyState, POV, JoyPOV  ; Get position of the POV control.
    KeyToHoldDownPrev = %KeyToHoldDown%  ; Prev now holds the key that was down before (if any).

    if POV < 0   ; No angle to report
        KeyToHoldDown =
    else if POV > 31500                 ; 315 to 360 degrees: Forward
        KeyToHoldDown = %DpU%           ; DPad Up
    else if POV between 0 and 4500      ; 0 to 45 degrees: Forward
        KeyToHoldDown = %DpU%           ; DPad Up
    else if POV between 4501 and 13500  ; 45 to 135 degrees: Right
        KeyToHoldDown = %DpR%           ; DPad Right
    else if POV between 13501 and 22500 ; 135 to 225 degrees: Down
        KeyToHoldDown = %DpD%           ; DPad Down
    else                                ; 225 to 315 degrees: Left
        KeyToHoldDown = %DpL%           ; DPad Left

    if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
        return 

    SetKeyDelay -1                      ; Avoid delays between keystrokes.
    if KeyToHoldDownPrev                ; There is a previous key to release.
        Send, {%KeyToHoldDownPrev% up}  ; Release it.
    if KeyToHoldDown                    ; There is a key to press down.
        Send, {%KeyToHoldDown% down}    ; Press it down.
    return


;; Left Stick stuff ~~~~~~~~~~~~~~~

WatchAxis2:
    GetKeyState, joyx, JoyX  ; Get position of X axis.
    GetKeyState, joyy, JoyY  ; Get position of Y axis.
    KeyToHoldDownPrev2 = %KeyToHoldDown2% 

    if JoyX > 70
        KeyToHoldDown2 = %LSR%      ; LStick Right
    else if JoyX < 30
        KeyToHoldDown2 = %LSL%      ; LStick Left
    else if JoyY > 70
        KeyToHoldDown2 = %LSD%      ; LStick Down
    else if JoyY < 30
        KeyToHoldDown2 = %LSU%      ; LStick Up
    else
        KeyToHoldDown2 =

    if KeyToHoldDown2 = %KeyToHoldDownPrev2% 
        return  

    if KeyToHoldDownPrev2   
        Send, {%KeyToHoldDownPrev2% up}
    if KeyToHoldDown2   
        Send, {%KeyToHoldDown2% down}
    return


;; Right Stick stuff ~~~~~~~~~~~~~~~

WatchAxis3:
    GetKeyState, joyz, JoyZ  
    GetKeyState, joyr, JoyR  
    KeyToHoldDownPrev3 = %KeyToHoldDown3%  

    if JoyZ > 70
        KeyToHoldDown3 = %RSR%      ; RStick Right
    else if JoyZ < 30
        KeyToHoldDown3 = %RSL%      ; RStick Left
    else if JoyR > 70
        KeyToHoldDown3 = %RSD%      ; RStick Down
    else if JoyR < 30
        KeyToHoldDown3 = %RSU%      ; RStick Up
    else
        KeyToHoldDown3 =

    if KeyToHoldDown3 = %KeyToHoldDownPrev3% 
        return 

    if KeyToHoldDownPrev3  
        Send, {%KeyToHoldDownPrev3% up}  
    if KeyToHoldDown3  
        Send, {%KeyToHoldDown3% down} 
    return


;; Right-side face buttons ~~~~~~~~~~~~~~~~

Joy1::              ; Square
    Send %Squ%
return
Joy2::              ; Ex
    Send %Exx%  ;; j
return
Joy3::              ; Circle
    Send %Cir%  ;; l
return
Joy4::              ; Triangle
    Send %Tri%  ;; k
return 

;; Shoulders ~~~~~~~~~~~~~~~~~~~~~~~~~

; Joy5:: BackSpace
Joy5::Gosub bksp              ; L1

bksp: ; prior behavior was annoyingly unpredictable
SendInput {BackSpace down}   ; Press the button down.
SendInput {BackSpace up}
Sleep, 100
; SetTimer, WaitForJoy5, 50  ; Reduce the number 30 to 20 or 10 to send keys faster. Increase it to send slower.
return

; WaitForJoy5:
; if not GetKeyState("Joy5")  ; The button has been released.
; {
;     SetTimer, WaitForJoy5, off  ; Stop monitoring the button.
;     return
; }
; SendInput {BackSpace down}  ; Send another keystroke.
; return

Joy7::              ; L2
  Send {Shift Down}
  KeyWait, Joy7
  Send {Shift Up}
return

Joy6:: 
    Send %R1%
Return

;Joy8:: ; R2
WatchLayer: 
    if GetKeyState("Joy8")
    {           ;; If pressed, activate Layer 1 functionality!
        Gosub, layer1
    }
    else
    {           ;; When released, restore normal Layer 0 operation
        Gosub, layer0
    }

Return

;; Rare face buttons ~~~~~~~~~~~~~~~~

Joy11::           ; L3
    SendInput `,
return
Joy12::             ; R3
    SendInput {Enter}
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


