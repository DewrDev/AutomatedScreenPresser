#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

ScreenPresser:= {Width: 500, Height: 650}

Profiles:= Array("doodar", "thingy", "wotsit")

gui, Profiles:new, 
gui, font, cblack s25 bold
gui, add, text, % "x0 w" ScreenPresser.Width " center", PROFILES
gui, add, picture, % "h" (Height:=50) " y" 5 " w" (Width:=50) " x5 gNewProfile" , resource\gfx\AddButton.png
gui, add, picture, % "h" (Height:=50) " y" 5 " w" (Width:=50) " x" ((ScreenPresser.Width - Width)-5), resource\gfx\SettingsButton.png
gui, add, picture, % "h" (Height:=50) " y" 5 " w" (Width:=50) " xp" -Width-5 " gHelpPages" , resource\gfx\HelpButton.png
gui, add, text,% "x8 y+5 0x10 h1 w" ScreenPresser.Width-15 ;Divider
gui, font, norm s20

Loop, % Profiles.Length()
{
    gui, add, text, y+10 x25, % Profiles[A_Index]
    gui, add, picture, % "h" (Height:=45) " yp w" (Width:=45) " x" ( ( (ScreenPresser.Width - Width) -5)), resource\gfx\DeleteButton.png
    gui, add, picture, % "h" (Height) " yp w" (Width) " xp" - Width - 5, resource\gfx\EditButton.png
    gui, add, picture, % "h" (Height) " yp w" (Width) " xp" - Width - 5, resource\gfx\StartButton.png
    gui, add, text,% "x0 y+10 0x10 h1 w" ScreenPresser.Width+3 ;Divider
}

gui,show, % "w" ScreenPresser.Width " h" ScreenPresser.Height, Profiles

ProfilesGuiclose()
{
    exitapp
}

HelpPages()
{
    #include HelpPages.ahk
}

NewProfile()
{
    gui, Profiles:minimize
    ScreenConfigurator.BlankCanvas()
}