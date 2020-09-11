:: status = 0(default) -> "WeChat Files" already there
:: status = 1 -> "WeChat Files" never exists
@echo off
set "WeChat_Files_dir=C:\Users\%username%\Documents"
set "install_dir=C:\"Program Files (x86)"\Tencent\WeChat\WeChat.exe"
set "taskname=WeChat.exe"

tasklist|find /i "%taskname%" 
if ERRORLEVEL 1 (
	goto no
) else (
	goto yes
)

:no
if exist %WeChat_Files_dir% (
	cd %WeChat_Files_dir%
	if exist "WeChat Files" (
		rename "WeChat Files" "WeChat Files Backup"
		echo Rename Wechat Files to WeChat Files Backup
	) else ( 
		echo No WeChat Files. 
		echo Start WeChat and exit bat.
		start %install_dir%
		::pause 
		exit )
)
start %install_dir%
@ping 127.0.0.1 -n 3 > nul
::wait for 3 sec
if exist "WeChat Files" (
	rd /s/q "WeChat Files"
	rename "WeChat Files Backup" "WeChat Files"
)
::pause
exit

:yes
echo "Please close WeChat and run this bat again."
pause
exit