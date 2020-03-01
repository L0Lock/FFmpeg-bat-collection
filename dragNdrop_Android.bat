echo off
:again

ffmpeg.exe -i "%~1" -c:v libx265 -preset faster -tune fastdecode -c:a aac -movflags faststart "%~p1%~n1_androided.mp4"
shift
if "%~1" == "" goto:eof
goto:again
