echo off
:again

ffmpeg.exe -i "%~1" -c:v libx264 -preset faster -tune fastdecode "%~p1%~n1_mp4.mp4"
shift
if "%~1" == "" goto:eof
goto:again
