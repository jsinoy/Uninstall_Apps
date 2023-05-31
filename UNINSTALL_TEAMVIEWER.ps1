﻿$appname = "TeamViewer"
$32bit = get-itemproperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, DisplayVersion, UninstallString, PSChildName | Where-Object { $_.DisplayName -match "^*$appname*"}
$64bit = get-itemproperty 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, DisplayVersion, UninstallString, PSChildName | Where-Object { $_.DisplayName -match "^*$appname*"}


if ($64bit -eq "" -or $64bit.count -eq 0) {

    switch ($32bit.DisplayName.count) {
        0 {Write-Host "Cannot find the uninstall string. $appname is not installed on this device!" -ForegroundColor Red}`
        1 {
            if ($32bit -match "msiexec.exe") {
            $32bit.UninstallString -replace 'msiexec.exe /i','msiexec.exe /x'
            }`
            else
            {
                cmd.exe /c $32bit.UninstallString /S
            }`
            }`
        default { Write-Host "Please Narrow Down Your Search" -ForegroundColor Red }`
    }`
}`
else {
 
    switch ($64bit.DisplayName.count) {
        0 {Write-Host "Cannot find the uninstall string. $appname not installed on this device!" -ForegroundColor Red}`
        1 {
            if ($64bit -match "msiexec.exe") {
                $64bit.UninstallString -replace 'msiexec.exe /i','msiexec.exe /x'
            }`
            else
            {
                cmd.exe /c $64bit.UninstallString /S
            }`
            }`
        default { Write-Host "Please Narrow Down Your Search" -ForegroundColor Red }`
    }`
}`

