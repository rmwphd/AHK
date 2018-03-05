;; Sending logically consistent cut & paste to git bash and cmd

#IfWinActive, ahk_class mintty
{
     ^v::+Insert
     ^x::^Insert
}

#IfWinActive ahk_class ConsoleWindowClass
{
    ^v::SendInput , {Raw}%clipboard%
}