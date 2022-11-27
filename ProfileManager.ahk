#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

ProfileManager:={}
ProfileManager.Load:= Func("LoadProfile")
ProfileManager.Save:= Func("SaveProfile")
ProfileManager.Delete:= Func("DeleteProfile")

LoadProfile()
{

}

SaveProfile(ProfileName, Interval, Frequency, InputPoints)
{
msgbox, e
}

DeleteProfile()
{

}