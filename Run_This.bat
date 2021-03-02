@echo WAIT FOR THIS WINDOW TO AUTOMATICALLY CLOSE (1-2m)
@echo off
@echo Enter IP/Domain
set /p ip=""
set LOGFILE=ConnectionTestOutput.log
call :LOG > %LOGFILE%
exit /B

:LOG
echo Starting Test
echo Username: %username% 
tracert %ip%
@echo normal iperf3 Test
.\iperf3.exe -c %ip%
@echo Reverse iperf3 Test
.\iperf3.exe -c %ip%
.\speedtest.exe --accept-license
