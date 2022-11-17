#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent 
#SingleInstance Ignore
global version:="0.0.0.1alpha"
;@Ahk2Exe-Let vn=%A_PriorLine~U)^(.+"){1}(.+)".*$~$2% ; Keep these lines together
;@Ahk2Exe-Let cy=DewrCorp ; Company Name`
;@Ahk2Exe-Let var = ScreenPresser ; Program name
;@Ahk2Exe-UpdateManifest ,My Name, 1.6.7.8
;@Ahk2Exe-SetName %U_var~\s.+$%               ; Drops 1st space and after in 'var'
;@Ahk2Exe-SetDescription 
;@Ahk2Exe-SetVersion %U_vn%
;@Ahk2Exe-SetOrigFilename Dewr's TesterTerminalTool.ahk
;@Ahk2Exe-SetCompanyName %U_cy%
;@Ahk2Exe-UseResourceLang 0x340A
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines, -1
global PID:= DllCall("GetCurrentProcessId")
