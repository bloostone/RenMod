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

if %C%==A User (
goto star
) else (

if %C%==%O% (

echo %U% Certificate of compleation file ID:%C%>tree.data
:: %MYFILES%\mailsend1.20b.exe Fuck you you arn't getting my email!
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
