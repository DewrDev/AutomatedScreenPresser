#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

#include ProfileManager.ahk


gui, NewProfile:new, 

NewProfile:= {Width:400, Height:450}

gui, add, text, % "x0 y0 center w" NewProfile.Width, New Profile
gui, font, s15
gui, add, text,x5 y+10 , name:
gui, add, edit, x+3 yp vProfileNameBox, 
gui, add, text,x5 y+10, Input Interval(ms)
gui, add,edit, x+3 vIntervalBox
gui, add, updown

gui, add, text,x5 y+10, Input Frequency(minute)
gui, add,edit, x+3 w170 vFrequencyBox
gui, add, updown

gui, add, text, x5 y+10, Touch Point Count: 
gui, add, text, x+1 yp vTouchCount

gui, add, button, % "h" (Height:=40) " w" (Width:=100) " y" (NewProfile.Height-Height)-10 " x" ((NewProfile.Width/2)-(Width/2) - (Width/2)) " gEditCanvas", EDIT
gui, add, button, % "h" Height " w" Width " y" (NewProfile.Height-Height)-10 " x+5 gConfirmProfileSave", SAVE

gui, show, % "w" NewProfile.Width " h" NewProfile.Height, New Profile
Return

ConfirmProfileSave:
GuiControlGet, ProfileName,, ProfileNameBox
GuiControlGet, Interval,, IntervalBox
GuiControlGet, Frequency,, FrequencyBox
ProfileManager.Save(ProfileName, Interval, Frequency, InputPoints)
return

EditCanvas:
gui, NewProfile: hide
; ScreenConfigurator.BlankCanvas()
ScreenConfigurator.ShowCurrentCanvas()
return