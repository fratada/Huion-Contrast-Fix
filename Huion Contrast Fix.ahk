; Version 0.1.1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Screen

global DelayTimeLaunch := 1500 ; ms to wait after launch
global DelayTimeResize := 1500 ; ms to wait after resize
global DelayTimeClose := 3000 ; ms to wait BEFORE closing
global DelayTimeClick := 500 ; ms to wait after each click

DeleteLog()
ReadConfig()
LaunchControlPanel()
ResizeControlPanel()
FixScreen()

FixScreen()
{
    WriteDebug("Attempting screen fix")
    CoordMode, Mouse, Window
    MouseClick, Left, 100, 220, 1, 10
    Sleep, DelayTimeClick
    MouseClick, Left, 525, 250, 1, 10
    Sleep, DelayTimeClick
    MouseClickDrag, Left, 560, 640, 555, 640, 10
    Sleep, DelayTimeClick
    MouseClickDrag, Left, 555, 640, 560, 640, 10
    Sleep, DelayTimeClick
    MouseClick, Left, 600, 690, 1, 10
    WriteDebug("Script completed sucessfully!")
    WriteDebug("Closing NVIDIA Control Panel in 5 seconds")
    Sleep, DelayTimeClose
    WinClose, NVIDIA Control Panel
}

ReadConfig()
{
    if (!FileExist("huionfix.cfg"))
    {
        WriteDebug("huionfix.cfg not found, creating...")
        IniWriteH(DelayTimeClick, "iDelayTimeClick")
        IniWriteH(DelayTimeLaunch, "iDelayTimeLaunch")
        IniWriteH(DelayTimeResize, "iDelayTimeResize")
        IniWriteH(DelayTimeClose, "iDelayTimeClose")
        WriteDebug("huionfix.cfg populated with default values")
    } else {
        WriteDebug("Reading values from huionfix.cfg")
        DelayTimeLaunch := IniReadH("iDelayTimeLaunch", DelayTimeLaunch)
        DelayTimeResize := IniReadH("iDelayTimeResize", DelayTimeResize)
        DelayTimeClick := IniReadH("iDelayTimeClick", DelayTimeClick)
        DelayTimeClose := IniReadH("iDelayTimeClose", DelayTimeClose)
        if (DelayTimeClick or DelayTimeResize or DelayTimeClick or DelayTimeClose is not integer)
        {
            MsgBox, 0, Huion Fix, There was a configuration error. One or more integers in %A_ScriptDir%\huionfix.cfg is not set to an integer.
            WriteDebug("Program exited due to configuration error. One or more integers in " . A_ScriptDir . "\huionfix.cfg is not set to an integer.")
            Exit
        }
    }
}

IniWriteH(ByRef Value, ByRef Key)
{
    IniWrite, %Value%, huionfix.cfg, config, %Key%
}

IniReadH(ByRef Key, ByRef DefaultValue)
{
    IniRead, Result, huionfix.cfg, config, %Key%, %DefaultValue%
    return Result
}

ResizeControlPanel()
{
    WinMove, NVIDIA Control Panel, , 0, 0, 760, 720
    WinGetPos, X, Y, WIDTH, HEIGHT, NVIDIA Control Panel
    WriteDebug("[NVIDIA Control Panel]: W:" . WIDTH . ", H:" . HEIGHT . ", X:" . X . ", Y:" . Y)
    Sleep, DelayTimeResize
}

LaunchControlPanel()
{
    WriteDebug("Launching NVIDIA Control Panel")
    Run, "C:\Program Files\NVIDIA Corporation\Control Panel Client\nvcplui.exe"
    WinWait, NVIDIA Control Panel
    WinActivate Nvidia Control Panel
    Sleep, DelayTimeLaunch
}

DeleteLog()
{
    if FileExist("log.txt")
    {
        FileDelete, log.txt
        WriteDebug("Previous log file deleted")
    }
}

WriteDebug(ByRef DebugText)
{
	FormatTime, TimeString, T12, Time
	FileAppend,
	(
	[%TimeString%] %DebugText%`n
	), log.txt
}