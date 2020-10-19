@echo off
REM --------------------------------------------------------
REM brodsky@splunk.com 18 October 2020
REM executes Eric Zimmerman's timeline retrieval utility and places output in a directory for the Splunk UF to pick up
REM --------------------------------------------------------

setlocal EnableDelayedExpansion

FOR /F "usebackq tokens=1,2 delims=," %%a in ("%SPLUNK_HOME%\etc\apps\TA-microsoft-wxtcmd\bin\timeline_list.cfg") DO (call :run_wxtcmd %%a %%b)

goto :cleanup

:run_wxtcmd

	"%SPLUNK_HOME%\etc\apps\TA-microsoft-wxtcmd\bin\wxtcmd.exe" -f %2 --csv "%SPLUNK_HOME%\etc\apps\TA-microsoft-wxtcmd\bin\output"
	copy "%SPLUNK_HOME%\etc\apps\TA-microsoft-wxtcmd\bin\output\*_Activity.csv" "%SPLUNK_HOME%\etc\apps\TA-microsoft-wxtcmd\bin\monitor\%1_timeline.csv"
	del "%SPLUNK_HOME%\etc\apps\TA-microsoft-wxtcmd\bin\output\*.csv"
	goto :EOF

:cleanup
	del SQL*.dll