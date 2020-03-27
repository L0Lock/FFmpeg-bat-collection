echo off
:again

ffmpeg.exe -i "%~1" -c:v libaom-av1 -crf 21 -strict experimental "%~p1%~n1_AV1.mkv"

shift
if "%~1" == "" goto:eof
goto:again
