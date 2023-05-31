@Echo Off
CLS
TITLE Find and Uninstall Bad SoftWare
setlocal ENABLEDELAYEDEXPANSION
setlocal ENABLEEXTENSIONS
:Part1
SET "BAD=µTorrent.exe"
SET "Z="
For /f "delims=" %%A IN ('Dir /B /S "C:\*uTorrent.exe" 2^>NUL') Do Set Z=%%A
IF DEFINED Z (
GoTo :Part2
) Else (
GoTo :Part2
)
GoTo :Part2
:Part2
IF DEFINED Z (
"!Z!" /UNINSTALL /S >nul 2>&1
GoTo :Part1
) ELSE (
GoTo :Part3
)
GoTo :Part3
:Part3
SET "Z="
For /F "delims=" %%A IN ('Dir /B /S "C:\*Torrent*" 2^>NUL') Do Set Z=%%A
IF DEFINED Z (
Del /F /S /Q "!Z!" >nul 2>&1
RD /S /Q "!Z!" >nul 2>&1
GoTo :Part3
) Else (
GoTo :Part4
)
GoTo :Part4
:Part4
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\users\*.TMP*" 2^>NUL') Do (
Del /F /S /Q "%%A" >nul 2>&1
)
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\Windows\*.TMP*" 2^>NUL') Do (
Del /F /S /Q "%%A" >nul 2>&1
)
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\*.TMP*" 2^>NUL') Do (
Del /F /S /Q "%%A" >nul 2>&1
)
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\Windows\Temp\*.*" 2^>NUL') DO (
Del /F /S /Q "%%A" >nul 2>&1
RD /S /Q "C:\Windows\Temp\" >nul 2>&1
)
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\Windows\Prefetch\*.*" 2^>NUL') DO (
Del /F /S /Q "%%A" >nul 2>&1
RD /S /Q "C:\Windows\Prefetch\" >nul 2>&1
)
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S ^"C:\Users\%username%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*^" 2^>NUL') DO (
Del /F /S /Q "%%A" >nul 2>&1
RD /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Temporary Internet Files\" >nul 2>&1
)
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\%temp%" 2^>NUL') DO (
Del /F /S /Q "%%A" >nul 2>&1
RD /S /Q "C:\TEMP\" >nul 2>&1
)
ChDir /D C:\
DEL /F /S /Q %temp%\ >nul 2>&1
ChDir /D C:\
For /F "delims=" %%A IN ('Dir /B /S "C:\*.TMP*" 2^>NUL') DO (
Del /F /S /Q "%%A" >nul 2>&1
)
ChDir /D C:\
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 >nul 2>&1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2 >nul 2>&1
:Part5
SET "R="
For /F "delims=" %%B IN ('Dir /B /S "C:\$Recycle.Bin\*" 2^>NUL') Do Set R=%%B
IF DEFINED R (
Del /F /S /Q "!R!" >nul 2>&1
RD /S /Q "!R!" >nul 2>&1
GoTo :Part5
) Else (
GoTo :Part6
)
:Part6
Set "RegKey=HKCR"
Set "SearchWord=*Torrent*"
For /F "tokens=*" %%A In ('REG QUERY "%RegKey%" /F "%SearchWord%" /S ^| Find /I "Key" ^| Sort') Do (
For /F "tokens=* delims= " %%B In ("%%A") Do Set "Name=%%B"
Set "Name=!Name!"
For /F "delims=@" %%B In ("!Name!") Do (
    REG DELETE "!Name!" /F >nul 2>&1
)
)
GoTo :Part7
:Part7
Set "RegKey=HKCU"
Set "SearchWord=*Torrent*"
For /F "tokens=*" %%A In ('REG QUERY "%RegKey%" /F "%SearchWord%" /S ^| Find /I "Key" ^| Sort') Do (
For /F "tokens=* delims= " %%B In ("%%A") Do Set "Name=%%B"
Set "Name=!Name!"
For /F "delims=@" %%B In ("!Name!") Do (
    REG DELETE "!Name!" /F >nul 2>&1
)
)
GoTo :Part8
:Part8
Set "RegKey=HKLM"
Set "SearchWord=*Torrent*"
For /F "tokens=*" %%A In ('REG QUERY "%RegKey%" /F "%SearchWord%" /S ^| Find /I "Key" ^| Sort') Do (
For /F "tokens=* delims= " %%B In ("%%A") Do Set "Name=%%B"
Set "Name=!Name!"
For /F "delims=@" %%B In ("!Name!") Do (
    REG DELETE "!Name!" /F >nul 2>&1
)
)
GoTo :Part9
:Part9
Set "RegKey=HKU"
Set "SearchWord=*Torrent*"
For /F "tokens=*" %%A In ('REG QUERY "%RegKey%" /F "%SearchWord%" /S ^| Find /I "Key" ^| Sort') Do (
For /F "tokens=* delims= " %%B In ("%%A") Do Set "Name=%%B"
Set "Name=!Name!"
For /F "delims=@" %%B In ("!Name!") Do (
    REG DELETE "!Name!" /F >nul 2>&1
)
)
GoTo :Part10
:Part10
Set "RegKey=HKCC"
Set "SearchWord=*Torrent*"
For /F "tokens=*" %%A In ('REG QUERY "%RegKey%" /F "%SearchWord%" /S ^| Find /I "Key" ^| Sort') Do (
For /F "tokens=* delims= " %%B In ("%%A") Do Set "Name=%%B"
Set "Name=!Name!"
For /F "delims=@" %%B In ("!Name!") Do (
    REG DELETE "!Name!" /F >nul 2>&1
)
)
GoTo :Part11
:Part11
ENDLocal
Exit /b %errorlevel%
END