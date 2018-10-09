override?
https://joeyh.name/blog/entry/debhelper_dh_overrides/

manual is in maint-guide package (/usr/share/doc/maint-guide).

dis dbgsym package.
===================
hierarchy looks like

  dh_strip
  dh_gencontrol
  dh_builddeb

>  dh_builddeb simply calls dpkg-deb(1) to build a Debian package or packages.  It will also build dbgsym packages when dh_strip(1) and
>        dh_gencontrol(1) have prepared them.
