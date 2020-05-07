@echo off
:again

ffmpeg ^
	-i "%~1" ^
	-c:v libx264 ^
	-pix_fmt yuv420p ^
	-vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" ^
	-preset faster ^
	-tune fastdecode ^
	"%~p1%~n1_webfriendly.mp4"
if NOT ["%errorlevel%"]==["0"] goto:error
echo [92m%~n1 Done![0m

shift
if "%~1" == "" goto:end
goto:again

:error

echo [93mThere was an error. Please check your input file or report an issue on github.com/L0Lock/FFmpeg-bat-collection/issues.[0m
pause
exit 0

:end

echo [92mEncoding succesful. This window will close after 10 seconds.[0m
timeout /t 10