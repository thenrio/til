hdmi to vga
===========

see http://www.makeuseof.com/tag/three-ways-to-display-your-raspberry-pi-on-a-monitor-or-tv/

here are the lines I uncommented

    grep ^hdmi /media/usb0/config.txt 
    hdmi_force_hotplug=1
    hdmi_group=1
    hdmi_mode=1

