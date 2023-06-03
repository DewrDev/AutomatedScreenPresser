#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

class Profiles
{
    ProfileWindow()
    {
        global
        ScreenPresser:= {Width: 500, Height: 650}
        
        local premadeProfiles:= Array("doodar", "thingy", "wotsit")
        
        gui, Profiles:new, 
        gui, font, cblack s25 bold
        gui, add, text, % "x0 w" ScreenPresser.Width " center", PROFILES
        gui, add, picture, % "h" (Height:=50) " y" 5 " w" (Width:=50) " x5 gNewProfile" , resource\gfx\AddButton.png
        gui, add, picture, % "h" (Height:=50) " y" 5 " w" (Width:=50) " x" ((ScreenPresser.Width - Width)-5), resource\gfx\SettingsButton.png
        gui, add, picture, % "h" (Height:=50) " y" 5 " w" (Width:=50) " xp" -Width-5 " gHelpPages" , resource\gfx\HelpButton.png
        gui, add, text,% "x8 y+5 0x10 h1 w" ScreenPresser.Width-15 ;Divider
        gui, font, norm s20
        
        Loop, % premadeProfiles.Length()
        {
            gui, add, text, y+10 x25, % premadeProfiles[A_Index]
            gui, add, picture, % "h" (Height:=45) " yp w" (Width:=45) " x" ( ( (ScreenPresser.Width - Width) -5)), resource\gfx\DeleteButton.png
            gui, add, picture, % "h" (Height) " yp w" (Width) " xp" - Width - 5, resource\gfx\EditButton.png
            gui, add, picture, % "h" (Height) " yp w" (Width) " xp" - Width - 5, resource\gfx\StartButton.png
            gui, add, text,% "x0 y+10 0x10 h1 w" ScreenPresser.Width+3 ;Divider
        }
        gui,show, % "w" ScreenPresser.Width " h" ScreenPresser.Height, Profiles
    }

    NewProfile()
    {
        static
        gui, NewProfile:new, 
        gui, NewProfile:default
        NewProfileWindow:= {Width:400, Height:450}

        gui, add, text, % "x0 y0 center w" NewProfileWindow.Width, New Profile
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

        gui, add, button, % "h" (Height:=40) " w" (Width:=100) " y" (NewProfileWindow.Height-Height)-10 " x" ((NewProfileWindow.Width/2)-(Width/2) - (Width/2)) " gEditCanvas", EDIT
        gui, add, button, % "h" Height " w" Width " y" (NewProfileWindow.Height-Height)-10 " x+5 gConfirmProfileSave", SAVE

        gui, show, % "w" NewProfileWindow.Width " h" NewProfileWindow.Height, New Profile
    }
}

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

ConfirmProfileSave()
{
    GuiControlGet, ProfileName,, ProfileNameBox
    GuiControlGet, Interval,, IntervalBox
    GuiControlGet, Frequency,, FrequencyBox
    ProfileManager.SaveProfile(ProfileName, Interval, Frequency, InputPoints)
}

EditCanvas()
{
    gui, NewProfile: hide
    ScreenConfigurator.ShowCurrentCanvas()
}
