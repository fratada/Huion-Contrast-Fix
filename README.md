# Huion Kamvas GT-191 Contrast Fix v0.1

## IMPORTANT INFO
- Only works on Windows
- Only tested on Windows 10 Professional 64-bit
- Only works with NVIDIA graphics cards
- Only tested on a regular 1920x1080 display


## HOW TO USE
#### BINARY
1. Click "Clone or download" button on upper right hand side of the page
2. Click "Download ZIP"
3. Download and open the file
4. Drag and drop "bin" directory to wherever you wish
3. Open the "bin" directory you just created and then open Huion Contrast Fix.exe

#### SOURCE
1. [Download AutoHotKey](https://autohotkey.com/download/)
2. Run Huion Contrast Fix.ahk


## IT DOESN'T WORK FOR ME
There are certain elements that are out of my control when it comes to making a script like this work.
For example, I don't know your screen resolution, font settings, window themes, etc.
**If you want to make this work for yourself you can fix it yourself. AutoHotKey is very simple!** I will be adding a tutorial section onto the end of this once I have the time. But with a little bit of googling you can change where the cursor goes.


## CONFIGURATION
The configuration file `huionfix.cfg` is very easy to use. It is simply the time in milliseconds to wait for each action. This is included to aid slower computers, so that the program can wait a few seconds to catch up.

`iDelayTimeClick` - Adds a delay after each click. The program only clicks a total of 5 times
`iDelayTimeLaunch` - Adds a delay after the NVIDIA Control Panel launches. **THE PROGRAM ALREADY WAITS FOR THE CONTROL PANEL TO OPEN. THIS IS AN ADDITIONAL WAITING PERIOD AFTER IT OPENS.**
`iDelayTimeResize` - Adds a delay after resizing and moving the window
`iDelayTimeClose` - Adds a delay **BEFORE** closing the program

[Milliseconds to seconds converter](https://www.timecalculator.net/milliseconds-to-seconds)


## Modification Tutorial
#### WIP
