@echo off
title Splatoon2 Personnal Cover by Pyrrah
:: Program banner
call :banner
call :c 0B "This batch help you to configure your Teensy++ 2.0 card."
call :c 0B "Before the process lanching, we will check all installed tools. Press any key to continue."
pause
cls
call :banner
call :c 0B "[...Starting to check tools...]"

:: START check tools
:: Check if python, avr-size are installed on your computer. If not, please refer on the REAME file.
set /A check=1
if exist ./SplatPost/image.data (
    echo  [OK] File "image.data" founded.
	for /f "tokens=1-2" %%i in ('identify -ping -format "%%w %%h"./SplatPost/image.data') do set W=%%i & set H=%%j
	echo width: %W%
	echo height: %H%
) else (
    echo  [NOK] File "image.data" not found. Please create with GIMP and put your file on the SplatPost directory.
	set /A check=0
)
python --version >nul 2>&1 && (
    echo  [OK] Python installed.
) || (
    echo  [NOK] Python isn't found. Please install last official version on https://www.python.org/downloads/.
	set /A check=0
)
avr-gcc --version >nul 2>&1 && (
	echo  [OK] AVR-GCC installed.
) || (
	echo  [NOK] AVR-GCC not found. Please install Arduino IDE on https://www.arduino.cc/en/software.
	set /A check=0
)
avr-size --version >nul 2>&1 && (
	echo  [OK] AVR-size installed.
) || (
	echo  [NOK] AVR-size not found. Please install Arduino IDE on https://www.arduino.cc/en/software.
	set /A check=0
)
if /I "%check%" EQU "0" call :c 0C "ERROR - Please fix errors and restart batch." && cmd /k
call :c 0A " [OK] Check tools finished"
echo .
:: END check tools

:: START processing image.data, Joystick.hex and push to card
call :c 0B "[...Executing necessary commands for SplatPost Printer. Please wait...]"
cd SplatPost
python bin2c.py image.data > image.c
make
call :c 0E " [CAUTION] Please press on reset button on your Teensy++ 2.0 card to load the new HEX!"
teensy_loader_cli -mmcu=at90usb1286 -wv Joystick.hex
call :c 0A " [OK] Congratulation, your installation is finished."
cmd /k
:: END processing

:banner
call :c 0D "+-------------------------+"
call :c 0D " Splatoon2 Personnal Cover"
call :c 0D "+-------------------------+"
goto :eof

:c
set "cdo=%cd%"
cd "%tmp%"
for /f "delims=." %%a in ('"prompt $H. & for %%b in (1) do rem"') do set "bs=%%a"
echo;%bs%>%2 & @findstr /v /a:%1 /r "^$" %2 nul & del %2 2>&1
cd "%cdo%"
goto :eof