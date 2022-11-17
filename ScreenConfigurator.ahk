#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

global ScreenConfiguratorPID:= DllCall("GetCurrentProcessId")

gui, Canvas:new, +LastFound -SysMenu -border -0xC00000
Gui, Color , 000000

SysGet, Monitor, monitor
WinSet, Trans, 50

Gui, show,x0 y0 w%MonitorRight% h%MonitorBottom%


Return

~LButton::
MouseGetPos, OutputVarX, OutputVarY, OutputVarWin
WinGet, WinPID, PID, ahk_ID %OutputVarWin%
if (WinPID = ScreenConfiguratorPID)
{
    Gui, Canvas:add, button,% "h25 w25 x" (OutputVarX-12.5) " y" (OutputVarY-12.5)
}
return

CanvasGuiClose:
Exitapp