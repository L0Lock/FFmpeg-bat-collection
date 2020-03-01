echo off
:again

ffmpeg.exe -i "%~1" -c:v libx264 -pix_fmt yuv420p -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -preset faster -tune fastdecode "%~p1%~n1_webfriendly.mp4"
if NOT ["%errorlevel%"]==["0"] pause
shift
if "%~1" == "" goto:eof
goto:again
