TL;DR was wayland, use and configure libinput

/var/log/apt $ xinput --list
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ xwayland-pointer:13                     	id=6	[slave  pointer  (2)]
⎜   ↳ xwayland-relative-pointer:13            	id=7	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ xwayland-keyboard:13                    	id=8	[slave  keyboard (3)]

former github.com/p2rkw/xf86-input-mtrack is not used...
