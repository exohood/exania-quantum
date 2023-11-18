@ECHO OFF

pushd %~dp0

REM Command file for Quantum documentation

if "%EXOBUILD%" == "" (
	set EXOBUILD=exobuild-build
)
set SOURCEDIR=source
set BUILDDIR=build

if "%1" == "" goto help

%EXOBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'EXO-build' command was not found. Make sure you have Exobuild
	echo.installed, then set the EXOBUILD environment variable to point
	echo.to the full path of the 'EXO-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Exobuild installed, grab it from
	echo.https://exania.ai/
	exit /b 1
)

%EXOBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %EXOBUILDPTS% %O%
goto end

:help
%EXOBUILD% -M help %SOURCEDIR% %BUILDDIR% %EXOOPTS% %O%

:end
popd
