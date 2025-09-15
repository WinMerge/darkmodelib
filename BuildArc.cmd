1cd /d "%~dp0"

set DISTDIR=.\Dist
set path="%ProgramFiles%\7-zip";"%ProgramFiles(x86)%\7-zip";%path%

if "%1" == "" (
  call :BuildArc x86 || goto :eof
  call :BuildArc x64 || goto :eof
  call :BuildArc ARM64 || goto :eof
) else (
  call :BuildArc %1 || goto :eof
)

goto :eof

:BuildArc

mkdir "%DISTDIR%\%1\darkmodelib" 2> NUL

copy Build\%1\Release\darkmodelib\darkmode.dll "%DISTDIR%\%1\darkmodelib\"
call :GET_DLL_VERSION %~dp0Build\%1\Release\darkmodelib\darkmode.dll
copy LICENSE.md "%DISTDIR%\%1\darkmodelib\"

7z.exe a -tzip "%DISTDIR%\darkmodelib-%DLL_VERSION%-%1.zip" "%DISTDIR%\%1\darkmodelib\"

goto :eof

:GET_DLL_VERSION

SET EXE_PATH=%1
WMIC Path CIM_DataFile WHERE Name='%EXE_PATH:\=\\%' Get Version | findstr /v Version > _tmp_.txt
set /P DLL_VERSIONTMP=<_tmp_.txt
set DLL_VERSION=%DLL_VERSIONTMP: =%
del _tmp_.txt
goto :eof
