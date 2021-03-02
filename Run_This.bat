@echo WAIT FOR THIS WINDOW TO AUTOMATICALLY CLOSE (1-2m)
@echo off
@echo Enter IP/Domain and press enter
@set /p ip=""
@echo Starting Test with address of %ip%
set LOGFILE=ConnectionTestOutput.log



@echo Starting Test >> LOGFILE
@echo Username: %username% >> LOGFILE
@echo Starting Traceroute...
tracert %ip% >> LOGFILE
@echo Traceroute Done
@echo Starting two way test with iperf3...
@echo normal iperf3 Test >> LOGFILE
.\iperf3.exe -c %ip% >> LOGFILE
@echo Reverse iperf3 Test >> LOGFILE
.\iperf3.exe -c %ip% >> LOGFILE
@echo iperf3 tests done
@echo Starting speed test...
.\speedtest.exe --accept-license >> LOGFILE


set /p empty=Your test is done! File saved to LOGFILE.log
set /p Press enter to close