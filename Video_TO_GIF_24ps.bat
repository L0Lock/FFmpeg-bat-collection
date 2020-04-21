echo lol
:again

mkdir frames
ffmpeg.exe -i "%~1" -y -filter_complex "[0:v] palettegen" "frames/palette.png"
ffmpeg -i "%~1" "frames/ffout%%03d.png"
ffmpeg.exe -framerate 24 -i "frames/ffout%%03d.png" -i "frames/palette.png" -filter_complex "[0:v][1:v] paletteuse" -r 24 "%~p1%~n1_gif24.gif"
rmdir frames /s /q
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
echo [92mEncoding succesful. This window will close after 10 seconds.[0m
timeout /t 10