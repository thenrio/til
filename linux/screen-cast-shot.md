

https://help.gnome.org/users/gnome-help/stable/screen-shot-record.html.en


on x11
------
https://www.howtogeek.com/446706/how-to-create-a-screencast-on-linux/

xrandr
-> 2560x1600
pulse audio input source
1

ffmpeg -video_size 2560x1600 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 output.mkv -async 1 -vsync 1

on wayland
----------
Using wf-recorder, on say, sway.

https://github.com/ammen99/wf-recorder
