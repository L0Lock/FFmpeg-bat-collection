@echo off
:again

ffmpeg.exe -i "%~1" ^
	"%~p1%~n1_ImgSeq_PNG/frame_%%04d.png"
if NOT ["%errorlevel%"]==["0"] goto:error

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