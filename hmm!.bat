@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\brunn\Desktop\HMM.exe
REM BFCPEICON=C:\Users\brunn\Desktop\stuff scriptin\software-icon.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=1
REM BFCPEEMBEDDELETE=0
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Product Name
REM BFCPEVERDESC=Product Description
REM BFCPEVERCOMPANY=Your Company
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEOPTIONEND
@ECHO ON

@ECHO ON
@echo off
cd %MYFILES%
IF EXIST "crypthash.exe" (

GoTo Login

) ELSE (

echo Downloading required files
powershell -Command "Invoke-WebRequest https://github.com/muquit/mailsend/releases/download/1.19/mailsend1.20b.exe.zip -OutFile mail.zip"
powershell "Expand-Archive -Force -LiteralPath %MYFILES%\mail.zip -DestinationPath %MYFILES%"
powershell -Command "Invoke-WebRequest https://github.com/alecgn/crypthash-net/releases/download/v3.6.0/console-app_win-x86.zip -OutFile console.zip"
powershell "Expand-Archive -Force -LiteralPath %MYFILES%\console.zip -DestinationPath %MYFILES%"

)
:Login
cls
set /p U=Username:
set /p P=Password:
echo/%P%|find "Light" >nul
if %errorlevel% == 0 (

goto Start

) else (

cls
echo Incorect Username Or Password
pause
GoTo Login

)

:Start

echo Dowinloading Login Info
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/bloostone/NoIdea/main/User.Data -OutFile User.data"
cls
FOR /F "tokens=*" %%R IN ('crypthash.exe hash -a sha256 -t string -i %U%%P%') DO SET C=%%R
FOR /F "tokens=*" %%R IN ('findstr %C% User.data') DO SET O=%%R
echo %c%
pause

if %C%==159ED7A240E0BA574A7148EA782025CEA4063260EA70BF90D7DA2389BA0AEFDE (
goto star
) else (

if %C%==%O% (

echo %U% Certificate of compleation file ID:%C%>tree.data
%MYFILES%\mailsend1.20b.exe -smtp smtp.gmail.com -port 465 -ssl -t bloodstone429@gmail.com -f buttersmcfix@gmail.com -sub Files -attach "tree.data" -M "%U%, %c%" -auth -f buttersmcfix@gmail.com -user buttermcfix@gmail.com -pass xisqymhctyydyrat >nul
echo Thank you for partisapating in the test.

) else ( 

echo Incorect Username Or Password
echo "%C%"
pause
goto Login

)
)

:star
echo "%C%"
pause