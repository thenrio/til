awful

[see there](http://askubuntu.com/questions/613087/gnome-terminal-is-getting-environment-variables-that-other-terminals-dont)

> It is gnome-terminal itself that sets these variables. 
> The relevant code resides in gnome-terminal's source, src/terminal-util.c, method terminal_util_add_proxy_env(). 
> The values are taken from Gnome's settings, and the feature serves the purpose to have Gnome's proxy settings take effect on as many apps/utilities as possible, including console ones.
