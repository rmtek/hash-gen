
:: Copyright (C) 2025 Ronald Michelic - rmtek.net
:: All rights reserved.
:: Name: Hash-Gen
:: Description: This is an automatic drag and drop script for generating hashfiles.
:: Supported OS: Windows 8 / 10 / 11
:: Author: Ronald Michelic - rm@rmtek.net
:: Version: 1.0
:: Date: 2025-25-02
:: License: BSD 3 clause license
:: This script is licensed under the BSD-style license found in the LICENSE file in the root directory.

@echo off
setlocal enabledelayedexpansion

:: Terminal Title
title Hash-Gen Script v1.0
mode con: cols=145 lines=30

:: Color Text Environment
color 07
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "del=%%a")
cls

:: Variables Color Text
set InfoText_1=:CT 03 "                                                           Windows file hashing with Powershell"
set InfoText_line=                                                +---------------------------------------------------------+
set InfoText_2=:CT 06 "                                                             Automatic hash generating script"
set InfoText_Bottomline=                                                     +-----------------------------------------------+
set Status=:CT 07 "  Status ="
set FileOK=:CT 0A " Generate Hash"
set FileBAD=:CT 0C "    FAIL"
set PayPal_1=:CT 07 "  (1)"
set Pay=:CT 03 "  Pay"
set Pal=:CT 0B "Pal"
set mail_1=:CT 07 "                                                                   rm@"
set mail_2=:CT 04 "rm"
set mail_3=:CT 07 "tek.net"
cls

:: Terminal Output
:start
    echo.
    call %InfoText_1%
    echo.
    echo %InfoText_line%
    call %InfoText_2%
    echo.
    echo.
    echo.

:: Calculate Hash
if "%~1"=="" (
    echo   Drag and drop any file onto this script file to calculate multiple hash variants and save them to a single text file.
    echo   This script does not work on network shares — only on local drives.
    echo.
    echo.
    echo %InfoText_Bottomline%
    call %mail_1% & call %mail_2% & call %mail_3% & echo  - 2025
    echo.
    echo.
    echo   Press any key to exit..
    pause > NUL
    goto :EOF
    )

set "file=%~1"

:: Extract the filename (without path or extension)
for %%A in ("%file%") do set "filename=%%~nxA"
set "outputFile=%filename%_hashes.txt"

:: Status
    echo   Calculating hash variants for "%file%"
    echo.
    call %Status% & call %FileOK%
    echo.
    echo.

for %%a in (MD5 SHA1 SHA256 SHA512) do (
    for /f %%b in ('powershell -command "(Get-FileHash -Algorithm %%a '%file%').Hash"') do (
        set "hash[%%a]=%%b"
        )
    )

if defined hash[SHA256] (

    for %%a in (MD5 SHA1 SHA256 SHA512) do (
        if defined hash[%%a] (
            echo   %%a Hash: !hash[%%a]!
        )
    )

:: Save all hash values to a single text file
    echo   Calculated hash variants for "%filename%" > "!outputFile!"
    echo. >> "!outputFile!"
    for %%a in (MD5 SHA1 SHA256 SHA512) do (
        if defined hash[%%a] (
            echo   %%a Hash: !hash[%%a]! >> "!outputFile!"
        )
    )
    echo.
    echo   Hash variants saved to "!outputFile!"
    echo.

    ) else (
    echo   Unable to calculate hash variants for "%file%".
    pause
    )
	

:: End
    echo.
    echo.
    call %PayPal_1% & call %Pay% & call %Pal% & echo  Donation
    echo   (2)  Exit to CMD
    echo   (3)  Exit
    echo.
    echo %InfoText_Bottomline%
    call %mail_1% & call %mail_2% & call %mail_3% & echo  - 2025
    echo.


:Input
choice /c 123 /n /m "Enter your choice: "
set INPUT=%errorlevel%

if %INPUT% == 1 (
    goto Donation
    ) else if %INPUT% == 2 (
    goto ExitToCMD
    ) else if %INPUT% == 3 (
    goto Exit
    ) else (
    echo Invalid choice
    )


:Donation
    start "Donation" "https://www.paypal.com/donate/?hosted_button_id=U4MVM7GJ5XMDY"
    goto Input


:Exit
    echo.
    goto End


:ExitToCMD
    echo.
    echo.
    cmd /k
    echo.

:: Color Text Environment
:CT
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:End
endlocal
    goto :eof
    exit /b 0
