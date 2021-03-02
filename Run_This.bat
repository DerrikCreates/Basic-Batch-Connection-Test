@echo WAIT FOR THIS WINDOW TO TURN GREEN. test results are saved next to Run_This.bat (1-2m)
@echo off
@echo Enter IP/Domain for iperf3 server and press enter
@set /p ip=""
@echo Starting Test with address of %ip%



@echo %date% %time% >> LOGFILE.log
@echo Starting Test >> LOGFILE.log
@echo Username: %username% >> LOGFILE.log
@echo Starting Traceroute...
tracert %ip% >> LOGFILE.log
@echo Traceroute Done
@echo Starting two way test with iperf3...
@echo Normal iperf3 test >> LOGFILE.log
.\iperf3.exe -c %ip% >> LOGFILE.log
@echo Reverse iperf3 Test >> LOGFILE.log
.\iperf3.exe -c  %ip% -R >> LOGFILE.log
@echo iperf3 tests done
@echo Starting speed test...
.\speedtest.exe --accept-license >> LOGFILE.log

@echo Your test file was saved to LOGFILE.log
@echo Your test is done!
color 2F
set /p blank=Press enter to close