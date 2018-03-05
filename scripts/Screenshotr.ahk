;; Just a function to handle screenshots

+#p::
  Send {PrintScreen}
  Run C:\Program Files\IrfanView\i_view64.exe
  sleep, 300
  Send ^v
return