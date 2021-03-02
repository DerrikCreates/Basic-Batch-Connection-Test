@echo WAIT FOR THIS WINDOW TO AUTOMATICALLY CLOSE (1-2m)
@echo off
set LOGFILE=ConnectionTestOutput.log
call :LOG > %LOGFILE%
exit /B

:LOG
echo Starting Test
echo %username%
tracert DOMAIN
@echo normal iperf3 Test
.\iperf3.exe -c DOMAIN
@echo Reverse iperf3 Test
.\iperf3.exe -c DOMAIN
.\speedtest.exe --accept-license
