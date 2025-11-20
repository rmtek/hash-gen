:: =========================================================================================================
::  Hash-Gen – Windows File Hashing Utility
:: ---------------------------------------------------------------------------------------------------------
::  Version:      1.0.1
::  Author:       Ronald Michelic (rmtek.net)
::  Contact:      rm@rmtek.net
::  Created:      2025-02-25
::  License:      BSD 3-Clause License
::
::  Description:
::      Automatic drag-and-drop hashing tool for:
::      • Windows 8 / 10 / 11
::      • Windows Server 2019 / 2022 / 2025
::
::      Features:
::      ✓ Supports multiple files at once
::      ✓ Generates: MD5, SHA1, SHA256, SHA512
::      ✓ Saves results to per-file *_hashes.txt
::      ✓ Works fully offline (no external dependencies)
::      ✓ PowerShell-based hashing for maximum reliability
::
::      Notes:
::      • Does not support network drives
::      • Designed for portable use (USB-safe)
::
:: =========================================================================================================

@echo off
setlocal enabledelayedexpansion

:: ---------------------------------------------------------------------------
:: Terminal Title & Window
:: ---------------------------------------------------------------------------
title Hash-Gen Script v1.0.1
mode con: cols=145 lines=30

:: ---------------------------------------------------------------------------
:: Color Text Environment (unchanged visual style)
:: ---------------------------------------------------------------------------
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

:: Algorithms (Zentrale Definition)
set "Algorithms=MD5 SHA1 SHA256 SHA512"

:: ---------------------------------------------------------------------------
:: Start Screen
:: ---------------------------------------------------------------------------
:start
    echo.
    call %InfoText_1%
    echo.
    echo %InfoText_line%
    call %InfoText_2%
    echo.
    echo.
    echo.

:: ---------------------------------------------------------------------------
:: Check for PowerShell availability
:: ---------------------------------------------------------------------------
where powershell >NUL 2>&1
if errorlevel 1 (
    echo   PowerShell could not be found on this system.
    echo   Please ensure PowerShell is installed and available in PATH.
    echo.
    echo %InfoText_Bottomline%
    call %mail_1% & call %mail_2% & call %mail_3% & echo  - 2025
    echo.
    echo   Press any key to exit..
    pause >NUL
    goto End
)

:: ---------------------------------------------------------------------------
:: No arguments? Show usage and exit
:: ---------------------------------------------------------------------------
if "%~1"=="" (
    echo   Drag and drop one or more files onto this script file to calculate
    echo   multiple hash variants and save them to a text file for each file.
    echo.
    echo   This script does not work on network shares — only on local drives.
    echo.
    echo %InfoText_Bottomline%
    call %mail_1% & call %mail_2% & call %mail_3% & echo  - 2025
    echo.
    echo   Press any key to exit..
    pause >NUL
    goto End
)

:: ---------------------------------------------------------------------------
:: Process all files passed as arguments (supports multi-file drag & drop)
:: ---------------------------------------------------------------------------
for %%F in (%*) do (
    call :ProcessFile "%%~fF"
    echo.
)

goto ShowMenu

:: ---------------------------------------------------------------------------
:: Process a single file
:: ---------------------------------------------------------------------------
:ProcessFile
set "file=%~1"

if not exist "%file%" (
    echo   The file "%file%" does not exist or is not accessible.
    goto :EOF
)

:: Block network shares explicitly (as per Notes)
if "%file:~0,2%"=="\\" (
    echo   Network paths are not supported: "%file%"
    goto :EOF
)

:: Extract filename (name and extension) and directory
for %%A in ("%file%") do (
    set "filename=%%~nxA"
    set "fileDir=%%~dpA"
)

:: Output file in same directory as the source file
set "outputFile=%fileDir%%filename%_hashes.txt"

:: Clear any previous hash values
for %%A in (%Algorithms%) do (
    set "hash[%%A]="
)

:: Status
echo   Calculating hash variants for "%file%"
echo.
call %Status% & call %FileOK%
echo.
echo.

:: Hash calculation via PowerShell
for %%A in (%Algorithms%) do (
    for /f %%B in ('
        powershell -NoProfile -command "(Get-FileHash -Algorithm %%A '%file%').Hash"
    ') do (
        set "hash[%%A]=%%B"
    )
)

:: Check if hashing succeeded
if defined hash[SHA256] (

    for %%A in (%Algorithms%) do (
        if defined hash[%%A] (
            echo   %%A Hash: !hash[%%A]!
        )
    )

    > "!outputFile!" (
        echo   Calculated hash variants for "!filename!"
        echo.
        for %%A in (%Algorithms%) do (
            if defined hash[%%A] (
                echo   %%A Hash: !hash[%%A]!
            )
        )
    )

    echo.
    echo   Hash variants saved to "!outputFile!"
    echo.

) else (
    echo   Unable to calculate hash variants for "%file%".
)

goto :EOF

:: ---------------------------------------------------------------------------
:: Menu & End Section
:: ---------------------------------------------------------------------------
:ShowMenu
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
set "INPUT=%errorlevel%"

if "%INPUT%"=="1" (
    goto Donation
) else if "%INPUT%"=="2" (
    goto ExitToCMD
) else if "%INPUT%"=="3" (
    goto Exit
) else (
    echo Invalid choice
    goto Input
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
    goto End

:: ---------------------------------------------------------------------------
:: Color Text Environment (unchanged)
:: ---------------------------------------------------------------------------
:CT
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:: ---------------------------------------------------------------------------
:: Clean End
:: ---------------------------------------------------------------------------
:End
endlocal
exit /b 0
