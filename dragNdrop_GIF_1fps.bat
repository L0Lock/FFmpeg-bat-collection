echo off
:again

ffmpeg.exe -i "%~1" -y -filter_complex "[0:v] palettegen" palette.png
mkdir frames
ffmpeg -i "%~1" "frames/ffout%%03d.png"
ffmpeg.exe -framerate 1 -i "frames/ffout%%03d.png" -i palette.png -filter_complex "[0:v][1:v] paletteuse" -r 1 "%~p1%~n1.gif"
rmdir frames /s /q
shift
if "%~1" == "" goto:eof
goto:again
