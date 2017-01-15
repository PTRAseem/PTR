@echo OFF

set arg1AsTitle=%1
set arg2AsTestcontainer=%2
set arg2AsResultFile=%3

Title %arg1AsTitle% - Started at: %time:~0,8%

setlocal enabledelayedexpansion

:again
rem if %1 is blank, we are finished
if not "%4" == "" (
	set "NUM=%4"
    set testCases=%testCases% /test:%4
    shift
    goto again)

@echo ON
	
mstest.exe /nologo /testcontainer:%arg2AsTestcontainer% /resultsfile:%arg2AsResultFile% %testCases%
