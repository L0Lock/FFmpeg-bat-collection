@echo off
setlocal enabledelayedexpansion

REM Check if two files are dragged onto the batch file
if "%~2"=="" (
    echo Please drag and drop two video files onto this batch file.
    pause
    exit /b
)

REM Get the first dropped file
set "file1=%~1"
REM Get the second dropped file
set "file2=%~2"

REM Determine which file comes first alphabetically
if /i "%file1%" gtr "%file2%" (
    set "left=%file2%"
    set "right=%file1%"
) else (
    set "left=%file1%"
    set "right=%file2%"
)

REM Run ffmpeg command with determined filenames and text overlays for side-by-side video
ffmpeg -i "%left%" -i "%right%" -filter_complex "[0:v]drawtext=text='Before':fontfile=C\:/Windows/Fonts/arial.ttf:fontsize=36:fontcolor=white:box=1:boxcolor=black@0.2:boxborderw=5:x=(w-text_w)/2:y=10,split[left][text1];[1:v]drawtext=text='After':fontfile=C\:/Windows/Fonts/arial.ttf:fontsize=36:fontcolor=white:box=1:boxcolor=black@0.2:boxborderw=5:x=(w-text_w)/2:y=10,split[right][text2];[left][text1]overlay=0:H-h[base1];[right][text2]overlay=W-w:H-h[base2];[base1][base2]hstack,format=yuv420p" -c:v libx264 -crf 18 output_side_by_side.mp4

REM Run ffmpeg command to create a second output with subtraction blending mode
ffmpeg -i "%left%" -i "%right%" -filter_complex "[1:v][0:v]blend=all_mode=overlay,format=yuv420p" -c:v libx264 -crf 18 output_overlay.mp4

pause
