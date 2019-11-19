# ffmpeg Bat Collection

[![GitHub license](https://img.shields.io/github/license/L0Lock/ffmpeg-bat-collection)](https://github.com/L0Lock/FFmpeg-bat-collection/blob/master/LICENSE.sql)  [![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/H2H818FHX)

A collection of .bat files for some usefull ffmpeg conversions.

Bat files are supported in windows only.

## Installation

Bat files work on their own, but you need to have the latest versions of ffmpeg installed, as well as ffprobe and ffplay (those two are packed along ffmpeg.exe)

- [Download the lastest "static" ffmpeg pack](https://ffmpeg.zeranoe.com/builds/).

- Browse in the archive up to the `bin` subfolder containing ffmpeg, ffprobe and ffplay executables. Uncompress the `bin` folder (in this example we'll use `C:\ffmpeg\bin`

- Register ffmpeg, ffprobe & ffplay to environment variables
  **Through command lines:**
  
  - Hit the windows key, write down `cmd` and press <kbd>Enter</kbd>
  
  - enter the following command, line after line:
    
    ```
    set ffmpeg=C:\ffmpeg\bin
    set ffprobe=C:\ffmpeg\bin
    set ffplay=C:\ffmpeg\bin
    ```
  
  **Through user interface:**

- do the following:
  
  ```
  My Computer
  Environment variables
  Add
  Name: ffmpeg
  Value: C:\ffmpeg\bin
  Add
  Name: ffprobe
  Value: C:\ffmpeg\bin
  Add
  Name: ffplay
  Value: C:\ffmpeg\bin
  Ok
  Ok
  ```

## How to use

Each "dragNdrop" .bat file is simple to use : you drag an drop your input file on it, and it will process this file and output it in the same folder of the .bat file.

## Descriptions

<span class="file-descriptions"/>

#### [dragNdrop GIF 1fps](dragNdrop_GIF_1fps.bat)

Creates an animated GIF file playing one frame per second, from any video file.

#### [dragNdrop GIF 30fps](dragNdrop_GIF_30fps.bat)

Creates an animated GIF file playing 30 frames per second, from any video file.

#### [dragNdrop GIF 30fps w320px](dragNdrop_GIF_30fps_w320px.bat)

Creates an animated GIF file playing 30 frames per second, resized at 320 pixels wide (with the same ratio), from any video file.

#### [dragNdrop MP4](dragNdrop_MP4.bat)

Creates a standard MP4 file with fast h264 encoding. Good e.g. for quick previews of large files.

#### [dragNdrop MP4 web-friendly dividable size](dragNdrop_MP4_webfriendly_dividablesize.bat)

Creates a MP4 file made to be readable in most web services. While also making sure the size is dividable by 2 (otherwise some video files might not be readable in the Internet).

#### [dragNdrop Discord](dragNdrop_Discord.cmd)

Creates a video file readable by discord and within the 8MB file size limit. Note that it adapts the encoding quality depending of the video duration. The longer the video, the uglier it gets. Dont try to send your movies with that :wink: .

#### [Instagramized](Instagramized.bat)

Made for Instagram squares in mind, but can be used for anything. It does several things:

- ensure maximum compatibility for displaying videos on mobile devices  (including old ones) ;

- ensures compatibility for Instagram ;

- Resizes the video to fit it in a square while keeping the original aspect ratio ;

- Fills the gaps left by the original video's ration by a blurred background effect.

You can change the output resolution if you want. Just open the bat file in a text editor, and edit the `SquareSize` value at line 5. The default value is 600 (pixels), you can use any integrer value you want. Just note that the higher you set, the longer it will take (because there's more data to process, blur increase time exponentially according to resolution) and Instagram doesn't displays more than ~600 pixels a square anyway.

Example:

![example Instagram video](https://media.giphy.com/media/WryeoK4u8eNbK0MfHD/giphy.gif)
