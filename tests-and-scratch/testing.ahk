one:= "u"
two:= "i"
three:= "o"
pressed:= 0
#Persistent  
 SetTimer, WatchLayer, 50
return

WatchLayer:
    GetKeyState state, f
    ; if (pressed = 1){
        if (state = "U"){
            one:= "u"
            two:= "i"
            three:= "o"
        }
    ; }
    ; else {
        if (state = "D"){
            one:= "j"
            two:= "k"
            three:= "l"
            KeyWait, f
        }
    ; }
    Return


j::
    Send %state%
Return
k::
    Send %two%
Return
l::
    Send %three%
Return

