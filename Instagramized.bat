echo off
:again

:: To change the resolution, change the SquareSize value above (just after the =). Default is 600.
set SquareSize=600

ffmpeg.exe -i "%~1" ^
    -c:v libx264 -crf 23 -filter_complex "[0:v]split=2[blur][vid];[blur]scale=%SquareSize%:%SquareSize%:force_original_aspect_ratio=increase,crop=%SquareSize%:%SquareSize%,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[vid]scale=%SquareSize%:%SquareSize%:force_original_aspect_ratio=decrease[ov];[bg][ov]overlay=(W-w)/2:(H-h)/2"  -profile:v baseline -level 3.0 -pix_fmt yuv420p -preset faster -tune fastdecode ^
    -c:a aac -ac 2 -b:a 128k ^
    -movflags faststart ^
    "%~p1%~n1_Instagramized.mp4" -y

if NOT ["%errorlevel%"]==["0"] pause
shift
if "%~1" == "" goto:eof
goto:again