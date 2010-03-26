@echo off
setlocal
if /i [%1]==[debug] (echo *** Running in debug mode) else (
   set _opt=/s
   echo.
   echo. If there are problems try:
   echo.
   echo.    %0 debug
   echo.
   )

echo.
pushd %~dp0
echo +++ Registering mapbook DLLs...
%WINDIR%\system32\regsvr32 %_opt% ".\chase_binaries\DSMapBookPrj.dll"
%WINDIR%\system32\regsvr32 %_opt% ".\chase_binaries\DSMapBookUIPrj.dll"

echo +++ Adding mapbook registry keys...
if DEFINED ProgramFiles(x86) (
   %WINDIR%\regedit %_opt% ".\chase_binaries\register_component_category_x64.reg"
   ) else (
   %WINDIR%\regedit %_opt% ".\chase_binaries\register_component_category.reg"
   )

echo.
popd
pause
endlocal
