#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

global ScreenConfiguratorPID:= DllCall("GetCurrentProcessId")

gui, Canvas:new, +LastFound -SysMenu -border -0xC00000 +HWNDCanvasHWND
Gui, Color , 000000

SysGet, Monitor, monitor
WinSet, Trans, 50

Gui, show,x0 y0 w%MonitorRight% h%MonitorBottom%

global  CanvasControl:= {Height:100, Width:200}
gui, CanvasControl:new, +AlwaysOnTop
gui, add, text,% "x0 y0 w" CanvasControl.Width " center", Control
gui, add, button,, Save
gui, add, button,, Undo
gui, add, button,, Redo
gui, add, button,gCanvasHotkeys, Hotkeys
gui, show, % "w" CanvasControl.Width
Return

~LButton::
CoordMode, Mouse , Screen
MouseGetPos, OutputVarX, OutputVarY, OutputVarWin
WinGet, WinCanvas, ID, ahk_ID %OutputVarWin%
if (WinCanvas = CanvasHWND)
{
    Gui, Canvas:add, button,% "h25 w25 x" (OutputVarX-12.5) " y" (OutputVarY-12.5)
}
return

CanvasGuiClose:
Exitapp
CanvasControlGuiClose:
Exitapp

