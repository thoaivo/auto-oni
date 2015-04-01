#include <Array.au3>
;Function section
Func Start_3G ()
	  If ProcessExists("DCom 3G.exe") Then
		 WinActivate("Viettel D-Com 3G")
		 MouseClick("left",400,300)
	  Else
		 Run("C:\Program Files\Viettel Group\Viettel D-Com 3G\D-Com 3G.exe")
		 Sleep(15000)
		 WinActivate("Viettel D-Com 3G")
		 MouseClick("left",400,300)
	  EndIf
EndFunc

Func Reset_3G ()
   Local $var = Ping("8.8.8.8")
   If @error = 0 Then
	  WinActivate("Viettel D-Com 3G")
	  MouseClick("left",400,300)
	  $ping = Ping("8.8.8.8")
	  If @error = 0 Then
		 MouseClick("left",332,374)
		 Sleep(500)
		 MouseClick("left",400,300)
	  EndIf
	  Sleep("5000")
	  MouseClick("left",400,300)
   Else
	  Start_3G()
   EndIf
EndFunc

Func Click_oni ()
   Send("http://www.oni.vn/J6ZP4")
   Sleep(500)
   Send("{ENTER}")
   Sleep(7000)
   MouseClick("left",755,505)
   Sleep(3000)
EndFunc

Func Main_Process()
   Run("C:\Program Files\Google\Chrome\Application\chrome.exe --incognito")
   WinWaitActive("New Tab - Google Chrome")
   Click_oni()
   ProcessClose("chrome.exe")
   Sleep(3000)
   Reset_3G()
EndFunc

;End function section

;start script
;;Prepare variable
$h = @HOUR
$m = @MIN
;Loop forever
While $h < 25
   Main_Process()
   $h = @HOUR
WEnd
