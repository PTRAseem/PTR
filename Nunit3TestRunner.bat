@echo OFF

set arg1AsTitle=%1
set arg2AsTestcontainer=%2
set arg2AsResultFile=%3

Title %arg1AsTitle% - Started at: %time:~0,8%

setlocal EnableDelayedExpansion

:Again
rem if %4 is blank, we are finished

set testName=%4
set testName=%testName%TestCaseIsTerminatedHere
set testName=%testName:(=%
set testName=%testName:)=%
set testName=%testName:,=%
set testName=%testName:.=%

if "%testName%" == "TestCaseIsTerminatedHere" GOTO Continue

set "NUM=%4"

set formattedTestCaseName=%4
set formattedTestCaseName=%formattedTestCaseName:~1,-1%
set formattedTestCaseName=%formattedTestCaseName:\"=\\"%
set formattedTestCaseName=%formattedTestCaseName:"=\"%

set testCases=%testCases% --test="%formattedTestCaseName%",
shift
goto Again

:Continue

@echo ON
	
nunit3-console.exe %arg2AsTestcontainer% /result:%arg2AsResultFile% %testCases%
