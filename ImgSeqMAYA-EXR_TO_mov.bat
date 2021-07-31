rem @echo off
ffmpeg ^
	-framerate 24 ^
	-start_number 1 ^
	-i "frame_%%04d.exr" ^
	-c:v libx264 -pix_fmt yuv420p -crf 23 ^
	-vf "eq=gamma=2" ^
	-preset faster ^
	-tune fastdecode ^
	"%~p1%~n1ImgSeqEXR.mov"
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