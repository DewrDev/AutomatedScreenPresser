#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

HelpPages:= {Width: 500, Height: 650}

gui, HelpPages:new, 
gui, color, black

gui, font, cwhite s20 bold
gui, add, text, % "y0 x0 w" HelpPages.Width " center", INFO
gui, add, text,% "x8 y+5 0x10 h1 w" HelpPages.Width-15 ;Divider
gui, font, cwhite s16 norm
gui, add, text, y+10 x10, Hello I am text in the help pages wow



gui, add, button, % "h" (Height:=40) " w" (Width:=100) " y" (HelpPages.Height-Height)-10 " x" ((HelpPages.Width/2)-(Width/2) - (Width/2) - (Width/2)), BACK
gui, add, button, % "h" Height " w" Width " y" (HelpPages.Height-Height)-10 " x+5 gHelpPagesGUIClose", EXIT
gui, add, button, % "h" Height " w" Width " y" (HelpPages.Height-Height)-10 " x+5", NEXT
gui, show, % "w" HelpPages.Width " h" HelpPages.Height, New Profile
return

HelpPagesGUIClose:
gui, HelpPages:destroy
