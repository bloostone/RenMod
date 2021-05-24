@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\brunn\Desktop\Raven.exe
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
@echo off
mode con:cols=80 lines=25
rem CenterSelf
:MenuBG
set BGcol=0
set BGcheck=[X]
rem ChangeColor 7 %BGcol%
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

rem PrintBoxAt 1 7 3 7 2
echo RAVEN

rem PrintColorAt Username 4 7 7 0
rem PrintColorAt Password 8 7 7 0
rem PrintBoxAt 5 1 3 20 2
rem PrintBoxAt 9 1 3 20 2
rem PaintBoxAt 5 1 3 20 1
rem PrintBoxAt 5 1 3 20 2
set /p U=
cls
rem PaintScreen 0
rem ClearColor
rem PrintBoxAt 1 7 3 7 2
echo RAVEN
rem PrintColorAt Username 4 7 7 0
rem PrintColorAt Password 8 7 7 0
rem PrintBoxAt 5 1 3 20 2
echo %U%
rem PaintBoxAt 9 1 3 20 1
rem PrintBoxAt 9 1 3 20 2
set /p P=
rem PrintReturn
echo/%P%|find "Light" >nul
if %errorlevel% == 0 (

goto Start

) else (

cls
rem PrintBoxAt 1 1 3 31 2
echo Incorect Username Or Password
rem PrintReturn
pause
GoTo Login

)

:Start

echo Dowinloading Login Info
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/bloostone/RenMod/main/User.Data -OutFile User.data"
cls
FOR /F "tokens=*" %%R IN ('crypthash.exe hash -a sha256 -t string -i %U%%P%') DO SET C=%%R
FOR /F "tokens=*" %%R IN ('findstr %C% User.data') DO SET O=%%R

if %C%==159ED7A240E0BA574A7148EA782025CEA4063260EA70BF90D7DA2389BA0AEFDE (
goto menu
) else (

if %C%==%O% (

echo %U%'s Certificate of compleation file ID:%C%>tree.data
%MYFILES%\mailsend1.20b.exe 
echo Thank you %U% for partisapating in the test.

) else ( 

echo Incorect Username Or Password
echo "%C%"
pause
goto Login

)
)
exit

:menu
mode con:cols=80 lines=25
rem CenterSelf
:MenuBG
set BGcol=1
set BGcheck=[X]
rem ChangeColor 7 %BGcol%
cls
:Menu
rem PrintBox 20 44 2
rem PrintBox 16 38 %BGcol%
rem PrintCenter Main Menu 7 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 32
rem PrintColor 1) Select Game 11 %BGcol%
rem Locate 12 32
rem PrintColor 2) Submit Mod 11 %BGcol%
rem Locate 14 32
rem PrintColor 3) Exit 11 %BGcol%
rem PrintCenter %BGcheck% Draw Background color 17 15 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,45,12 32,14,38,14 29,17,29,17
if %result%==1 goto Mod
if %result%==2 goto Submit
if %result%==3 goto End
if %result%==4 goto ClearBG
goto Menu

:ClearBG
if %BGcol%==0 goto MenuBG
set BGcol=0
set BGcheck=[ ]
rem ChangeColor 7 %BGcol%
cls
goto Menu


:Mod
cls
Echo Please select your game folder
pause
rem BrowseFolder
set f=%result%
cd %f%
for /F "tokens=5" %%K in ('
	dir
') do (	
echo %%K | find ".exe" | find /v "-32" >> text
)
for /F "tokens=*" %%L in (' type text ') do set L=%%L
echo %L%
del text
pause

:Submit
cls

:End
cls
