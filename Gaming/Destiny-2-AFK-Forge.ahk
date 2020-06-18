#MaxThreadsPerHotkey 3
^j::  ; Ctrl+J hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepCtrlJRunning  ; This means an underlying thread is already running the loop below.
{
    KeepCtrlJRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepCtrlJRunning := true
Loop
{
    ; The next four lines are the action you want to repeat (update them to suit your preferences):
	MouseMove, 640,580,100  ; Move to Open Director
	Sleep, 800
	Click
	Sleep, 3000
    if not KeepCtrlJRunning  ; The user signaled the loop to stop by pressing Ctrl+J again.
        break  ; Exit out of this loop.

	MouseMove, 630,430,100  ; Move to Earth
	Sleep, 800
	Click
	Sleep, 3000
    if not KeepCtrlJRunning  ; The user signaled the loop to stop by pressing Ctrl+J again.
        break  ; Exit out of this loop.

	MouseMove, 320,530,100  ; Move Mouse to lower right
	Sleep, 1000
	MouseMove, -140,100,100,R  ; Move back mouse to start acceleration of map
	Sleep, 1000
    if not KeepCtrlJRunning  ; The user signaled the loop to stop by pressing Ctrl+J again.
        break  ; Exit out of this loop.

	MouseMove, 250,-360,100,R  ;  Move back mouse to stop acceleration
	Sleep, 800
	Click
	Sleep, 3000
    if not KeepCtrlJRunning  ; The user signaled the loop to stop by pressing Ctrl+J again.
        break  ; Exit out of this loop.

	MouseMove, 1030,600,100  ; Move to Launch destination
	Sleep, 800
	Click
    if not KeepCtrlJRunning  ; The user signaled the loop to stop by pressing Ctrl+J again.
        break  ; Exit out of this loop.

	Sleep, 210000  ; Wait 3 minutes 30 seconds before starting over
    if not KeepCtrlJRunning  ; The user signaled the loop to stop by pressing Ctrl+J again.
        break  ; Exit out of this loop.
}

KeepCtrlJRunning := false  ; Reset in preparation for the next press of this hotkey.
return
