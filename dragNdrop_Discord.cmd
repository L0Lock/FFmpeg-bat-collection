@echo off
cd /D %~p0
SET output=%~n1_8MB.mp4
set cmd="ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %1 "
FOR /F "tokens=*" %%i IN (' %cmd% ') DO SET seconds=%%i
echo aaaa
echo aaaa
SET /A "totalBitrate=64000/seconds"
SET overheadBitrate=100
SET audioBitrate=96
SET /A "videoBitrate=totalBitrate-audioBitrate-overheadBitrate"
ffmpeg -y -i %1 -c:v libx264 -b:v %videoBitrate%k -pass 1 -b:a %audioBitrate%k -f mp4 NUL && \
ffmpeg -i %1 -c:v libx264 -b:v %videoBitrate%k -pass 2 -b:a %audioBitrate%k "%output%"
del /q ffmpeg2pass-*.log ffmpeg2pass-*.mbtree
if NOT ["%errorlevel%"]==["0"] pause