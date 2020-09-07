@echo off
:again

ffmpeg ^
	-i "%~1" ^
	-i "%~p1cover.jpg" ^
	-map 1 ^
	-c:1 png ^
	-disposition:1 attached_pic ^
	-map 0 ^
	-c copy ^
	"%~p1%~n1_covered.mkv"
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
cls
echo [92mEncoding succesful. This window will close after 10 seconds.[0m
timeout /t 10