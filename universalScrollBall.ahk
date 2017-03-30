;; Further Modified by Reed in 2017
;; based on 
;; Emulate_Scrolling_Middle_Button.ahk
;; Author: Erik Elmore <erik@ironsavior.net>
;; Version: 1.1 (Aug 16, 2005)
;;

;; Higher numbers mean less sensitivity
esmb_Threshold = 9

;; This key/Button activates scrolling
esmb_TriggerKey = RButton

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
  esmb_AccumulatedDistanceX = 0
  esmb_AccumulatedDistanceY = 0
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
  
  MouseGetPos,esmb_NewX, esmb_NewY
  esmb_DistanceY := esmb_NewY - esmb_OrigY
  esmb_DistanceX := esmb_NewX - esmb_OrigX
  if esmb_DistanceY
    esmb_Moved = y
  else if esmb_DistanceX
    esmb_Moved = y

  esmb_AccumulatedDistanceY := (esmb_AccumulatedDistanceY + esmb_DistanceY)
  esmb_TicksY := (esmb_AccumulatedDistanceY // esmb_Threshold) ; floor divide
  esmb_AccumulatedDistanceY := (esmb_AccumulatedDistanceY - (esmb_TicksY * esmb_Threshold))
  esmb_WheelDirectionY := "WheelDown"
  if (esmb_TicksY < 0) {
    esmb_WheelDirectionY := "WheelUp"
    esmb_TicksY := (-1 * esmb_TicksY)
  }
  esmb_AccumulatedDistanceX := (esmb_AccumulatedDistanceX + esmb_DistanceX)
  esmb_TicksX := (esmb_AccumulatedDistanceX // esmb_Threshold) ; floor divide
  esmb_AccumulatedDistanceX := (esmb_AccumulatedDistanceX - (esmb_TicksX * esmb_Threshold))
  esmb_WheelDirectionX := "WheelRight"
  if (esmb_TicksX < 0) {
    esmb_WheelDirectionX := "WheelLeft"
    esmb_TicksX := (-1 * esmb_TicksX)
  }


  ;; Do not send clicks on the first iteration
  if esmb_FirstIteration = y
    esmb_FirstIteration = n
  else {
    Loop % esmb_TicksY {
      MouseClick, %esmb_WheelDirectionY%
    }
    Loop % esmb_TicksX {
      MouseClick, %esmb_WheelDirectionX%
    }
  }

  MouseMove,esmb_OrigX,esmb_OrigY,0
return