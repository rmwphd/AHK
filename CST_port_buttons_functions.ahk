;;
;; This is just for letting me play with the function of the
;; two "bonus" buttons for the CST lasertrack 
;; 

;#NoTrayIcon

XButton2::
  Send #+e
return

XButton1::
  Run C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe
  sleep, 1000
  Send cd{space}Util{tab}\met{tab}{enter}meteor{enter}
return