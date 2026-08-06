@echo off
setlocal

set "PROJECT_ROOT=%~dp0.."
set "HARMONY_PROJECT=%PROJECT_ROOT%\harmony"
set "DEVECO_ROOT=C:\Program Files\Huawei\DevEco Studio"
set "DEVECO_SDK_HOME=%DEVECO_ROOT%\sdk"
set "JAVA_HOME=%DEVECO_ROOT%\jbr"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "HVIGOR=%DEVECO_ROOT%\tools\hvigor\bin\hvigorw.bat"

if not exist "%HVIGOR%" (
  echo [Olivia] DevEco Studio was not found at the default location.
  exit /b 1
)

pushd "%HARMONY_PROJECT%"
call "%HVIGOR%" assembleHap --mode module -p module=entry@default -p product=default -p buildMode=debug --no-daemon
set "BUILD_EXIT_CODE=%ERRORLEVEL%"
popd

if not "%BUILD_EXIT_CODE%"=="0" (
  echo [Olivia] HAP build failed with exit code %BUILD_EXIT_CODE%.
  exit /b %BUILD_EXIT_CODE%
)

echo [Olivia] HAP build completed successfully.
exit /b 0
