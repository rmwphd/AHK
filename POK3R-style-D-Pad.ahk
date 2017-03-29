;;
;; POK3R-style-D-Pad.ahk
;; Author: Reed Williams rmwphd@gmail.com
;; Version: 1.0 (Feb 9, 2017)
;;
;; Turns your CapsLock key into a modifier for
;; i, j, k, l and perhaps others to enable 
;; functionality equivalent to the Poker 3 
;; 60% mech keyboard.

$*Capslock:: ; when capslock is pressed create an invisible window
press :=  ; clear press variable
Gui, 99:+ToolWindow
Gui, 99:Show,NoActivate x-1 w1 , Capslock Is Down
keywait, Capslock
Gui, 99:Destroy ; destroy window when capslock is released
if (press = "" ){ ; if a hotkey was not pressed, toggle CAPSLOCK
    
    SetCapsLockState, % (State:=!State) ? "On" : "Off"

}    
return

#IfWinExist Capslock Is Down  ; enable the following hotkeys while invisible Capslock window exists


    i::
    Send {Up}
    press = true ; set press to true so that capslock is not toggled
    return

    j::
    Send {Left}
    press = true ; set press to true so that capslock is not toggled
    return

    k::
    Send {Down}
    press = true ; set press to true so that capslock is not toggled
    return

    l::
    Send {Right}
    press = true ; set press to true so that capslock is not toggled
    return

#IfWinExist