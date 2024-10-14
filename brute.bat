@echo off
setlocal enabledelayedexpansion

:: Ask for the user to input the password
set /p userPassword="Enter the password: "

:: Set the file that contains possible passwords
set passwordFile=password.txt

:: Check if the password exists in the file
set found=0
for /f "tokens=*" %%i in (%passwordFile%) do (
    echo Attempting: %%i
    if "%%i"=="%userPassword%" (
        set found=1
        echo Password found!
        goto :end
    )
)

:: If the password is not found
if !found! equ 0 (
    echo Password not found.
)

:end
pause
