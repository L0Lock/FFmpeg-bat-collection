echo lol
:again

mkdir frames
ffmpeg.exe -i "%~1" -y -filter_complex "[0:v] palettegen" "frames/palette.png"
ffmpeg -i "%~1" "frames/ffout%%03d.png"
ffmpeg.exe -framerate 24 -i "frames/ffout%%03d.png" -i "frames/palette.png" -filter_complex "[0:v][1:v] paletteuse" -r 24 "%~p1%~n1.gif"
rmdir frames /s /q
shift
if "%~1" == "" goto:eof
goto:again
