sudo apt install ffmpeg
#ffmpeg -i [input_file] -ss [start_seconds] -t [duration_seconds] [output_file]
#use FFmpeg cut mp4 video without re-encoding
#Example:
#
#ffmpeg -i source.mp4 -ss 00:00:05 -t 00:00:10 -c copy cut_video.mp4
