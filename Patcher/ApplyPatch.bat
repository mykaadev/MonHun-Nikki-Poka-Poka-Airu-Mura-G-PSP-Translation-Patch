@echo off
setlocal EnableExtensions

set "ROOT=%~dp0"
set "TOOLS=%ROOT%tools"
set "PATCH_DIR=%ROOT%patch"
set "GAME_DIR=%ROOT%GameToPatch"
set "OUTPUT_DIR=%ROOT%Output"

set "XDELTA_EXE=tools\xdelta3-3.2.0-windows-x86_64\xdelta3.exe"
set "PATCH=patch\PokaPoka_Ailu_Mura_G_EN_test.xdelta"
set "OUTPUT=Output\PokaPoka_Ailu_Mura_G_EN_patched.iso"

set "EXPECTED_CLEAN=3C6A83F437D74B836E9425C08B2AD2ACB18BEE1BB1B88819B7436A3F1B53F28F"
set "EXPECTED_PATCHED=D6C23863D368F27FD83F6647B0E5BEE7339AFDEA868C1D1D9D14779D5505ADC6"

if not exist "%GAME_DIR%" mkdir "%GAME_DIR%"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

pushd "%ROOT%"
if errorlevel 1 (
  echo ERROR: Could not enter patch folder:
  echo   %ROOT%
  pause
  exit /b 1
)

if not exist "%XDELTA_EXE%" (
  echo ERROR: xdelta3.exe was not found:
  echo   %ROOT%%XDELTA_EXE%
  pause
  exit /b 1
)

if not exist "%PATCH%" (
  echo ERROR: Patch file was not found:
  echo   %ROOT%%PATCH%
  pause
  exit /b 1
)

set "ISO="
for %%F in ("%GAME_DIR%\*.iso") do (
  if not defined ISO (
    set "ISO=GameToPatch\%%~nxF"
  ) else (
    echo ERROR: More than one ISO found in GameToPatch.
    echo Please keep only the clean ISO in:
    echo   %GAME_DIR%
    pause
    exit /b 1
  )
)

if not defined ISO (
  echo No ISO found.
  echo.
  echo Put your clean ISO here:
  echo   %GAME_DIR%
  echo.
  echo Then run ApplyPatch.bat again.
  pause
  exit /b 1
)

echo Clean ISO:
echo   %ROOT%%ISO%
echo.
echo Checking clean ISO SHA-256...
set "HASH_TARGET=%ROOT%%ISO%"
set "CLEAN_HASH="
for /f "usebackq delims=" %%H in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "try { (Get-FileHash -LiteralPath $env:HASH_TARGET -Algorithm SHA256).Hash } catch { exit 1 }"`) do set "CLEAN_HASH=%%H"

if not defined CLEAN_HASH (
  echo.
  echo ERROR: Could not read the clean ISO hash.
  echo Please move this patch folder to a shorter path, or make sure the ISO is not locked by another program.
  pause
  exit /b 1
)

if /i not "%CLEAN_HASH%"=="%EXPECTED_CLEAN%" (
  echo.
  echo ERROR: The ISO in GameToPatch does not match the expected clean ISO.
  echo Expected:
  echo   %EXPECTED_CLEAN%
  echo Found:
  echo   %CLEAN_HASH%
  echo.
  echo Please use a clean, unmodified ISO.
  pause
  exit /b 1
)

echo Applying xdelta patch...
set "ISO_FULL=%ROOT%%ISO%"
set "PATCH_FULL=%ROOT%%PATCH%"
set "XDELTA_FULL=%ROOT%%XDELTA_EXE%"
set "OUTPUT_FULL=%ROOT%%OUTPUT%"
set "TEMP_WORK=%TEMP%\PokaPokaAiluPatch_%RANDOM%%RANDOM%"
set "TEMP_XDELTA=%TEMP_WORK%\xdelta3.exe"
set "TEMP_ISO=%TEMP_WORK%\clean.iso"
set "TEMP_PATCH=%TEMP_WORK%\patch.xdelta"
set "TEMP_OUTPUT=%TEMP_WORK%\patched.iso"

mkdir "%TEMP_WORK%" >nul 2>nul
if errorlevel 1 (
  echo.
  echo ERROR: Could not create temp folder:
  echo   %TEMP_WORK%
  pause
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Copy-Item -LiteralPath $env:XDELTA_FULL -Destination $env:TEMP_XDELTA -Force; Copy-Item -LiteralPath $env:ISO_FULL -Destination $env:TEMP_ISO -Force; Copy-Item -LiteralPath $env:PATCH_FULL -Destination $env:TEMP_PATCH -Force"
if errorlevel 1 (
  echo.
  echo ERROR: Could not copy files to the temp patch folder.
  echo   %TEMP_WORK%
  pause
  exit /b 1
)

"%TEMP_XDELTA%" -d -f -s "%TEMP_ISO%" "%TEMP_PATCH%" "%TEMP_OUTPUT%"
if errorlevel 1 (
  echo.
  echo ERROR: Patch failed.
  rmdir /s /q "%TEMP_WORK%" >nul 2>nul
  pause
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Copy-Item -LiteralPath $env:TEMP_OUTPUT -Destination $env:OUTPUT_FULL -Force"
if errorlevel 1 (
  echo.
  echo ERROR: Could not copy the patched ISO to Output.
  echo   %OUTPUT_FULL%
  rmdir /s /q "%TEMP_WORK%" >nul 2>nul
  pause
  exit /b 1
)

rmdir /s /q "%TEMP_WORK%" >nul 2>nul

echo Checking patched ISO SHA-256...
set "HASH_TARGET=%ROOT%%OUTPUT%"
set "PATCHED_HASH="
for /f "usebackq delims=" %%H in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "try { (Get-FileHash -LiteralPath $env:HASH_TARGET -Algorithm SHA256).Hash } catch { exit 1 }"`) do set "PATCHED_HASH=%%H"

if not defined PATCHED_HASH (
  echo.
  echo ERROR: Could not read the patched ISO hash.
  pause
  exit /b 1
)

echo.
echo Output ISO:
echo   %ROOT%%OUTPUT%
echo.
echo Expected patched SHA-256:
echo   %EXPECTED_PATCHED%
echo Actual patched SHA-256:
echo   %PATCHED_HASH%
echo.

if /i "%PATCHED_HASH%"=="%EXPECTED_PATCHED%" (
  echo Success! The patched ISO is ready in Output.
) else (
  echo ERROR: Patched ISO hash does not match.
  pause
  exit /b 1
)

pause
