;; Modified by Reed in 2017
;;
;; Emulate_Scrolling_Middle_Button.ahk
;; Author: Erik Elmore <erik@ironsavior.net>
;; Version: 1.1 (Aug 16, 2005)
;;
;; Enables you to use any key with cursor movement
;; to emulate a scrolling middle button.  While
;; the TriggerKey is held down, you may move the
;; mouse cursor up and down to send scroll wheel
;; events.  If the cursor does not move by the
;; time the TriggerKey is released, then a middle
;; button click is generated.  I wrote this for my
;; 4-button Logitech Marble Mouse (trackball),  
;; which has no middle button or scroll wheel.
;;

;; Configuration

;#NoTrayIcon

;; Higher numbers mean less sensitivity
esmb_Threshold = 9

;; This key/Button activates scrolling
esmb_TriggerKey = RButton

;; End of configuration

#Persistent
CoordMode, Mouse, Screen
Hotkey, %esmb_TriggerKey%, esmb_TriggerKeyDown
HotKey, %esmb_TriggerKey% Up, esmb_TriggerKeyUp
esmb_KeyDown = n
SetTimer, esmb_CheckForScrollEventAndExecute, 10
return

esmb_TriggerKeyDown:
  esmb_Moved = n
  esmb_FirstIteration = y
  esmb_KeyDown = y
  MouseGetPos, esmb_OrigX, esmb_OrigY
  esmb_AccumulatedDistance = 0
return

esmb_TriggerKeyUp:
  esmb_KeyDown = n
  ;; Send a right-click if we did not scroll
  if esmb_Moved = n
    MouseClick, Right
return

esmb_CheckForScrollEventAndExecute:
  if esmb_KeyDown = n
    return
  
  MouseGetPos,, esmb_NewY
  esmb_Distance := esmb_NewY - esmb_OrigY
  if esmb_Distance
    esmb_Moved = y

  esmb_AccumulatedDistance := (esmb_AccumulatedDistance + esmb_Distance)
  esmb_Ticks := (esmb_AccumulatedDistance // esmb_Threshold) ; floor divide
  esmb_AccumulatedDistance := (esmb_AccumulatedDistance - (esmb_Ticks * esmb_Threshold))
  esmb_WheelDirection := "WheelDown"
  if (esmb_Ticks < 0) {
    esmb_WheelDirection := "WheelUp"
    esmb_Ticks := (-1 * esmb_Ticks)
  }

  ;; Do not send clicks on the first iteration
  if esmb_FirstIteration = y
    esmb_FirstIteration = n
  else {
    Loop % esmb_Ticks {
      MouseClick, %esmb_WheelDirection%
    }
  }

  MouseMove,esmb_OrigX,esmb_OrigY,0
return