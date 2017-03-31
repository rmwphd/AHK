;; XKCD-inspired scrollwheel-through-time AHK script
;; Author: Reed Williams rmwphd@gmail.com
;;

; Alt+scrolling gives the effect.
!WheelDown::
    Send ^z
return

!WheelUp::
    Send ^y
return

; Replace the ! with another modifier if you prefer:
; ! = Alt
; ^ = Ctrl
; + = Shift

; or replace the HotKey with a pair of keys, e.g.:
; t & WheelDown:: 
; to make t and scroll your hotkey for this action.