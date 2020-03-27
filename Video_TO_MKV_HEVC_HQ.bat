echo off
:again

ffmpeg.exe -i "%~1" -c:v libx265 -preset medium -tune zerolatency -crf 20 -profile:v main10 -pix_fmt yuv420p -c:a aac -q:a 5 "%~p1%~n1_MKV_HEVC_HQ.mkv"

shift
if "%~1" == "" goto:eof
goto:again
