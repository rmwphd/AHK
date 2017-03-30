;; Sending logically consistent copy & paste to git bash

#IfWinActive, ahk_class mintty
{
     ^v::+Insert
     ^c::^Insert
}
