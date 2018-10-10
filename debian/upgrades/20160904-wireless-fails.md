may be related (network manager)
https://bbs.archlinux.org/viewtopic.php?id=216366
https://bbs.archlinux.org/viewtopic.php?id=210868

and this one
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836351

     network-manager:amd64 (1.2.4-2, 1.4.0-3)

O1- downgrade using apt
see [there](https://hackedbellini.org/linux/downgrade-and-force-some-packages-on-debian-to-a-previous-version/)

steps are

add a source that has previous package (from [snapshot](http://snapshot.debian.org))
    found http://snapshot.debian.org/archive/debian/20160810T223243Z/pool/main/n/network-manager/

    add list


    run

        sudo apt-get update -o Acquire::Check-Valid-Until=false

pin package to desired version (see [pinning](http://jaqque.sbih.org/kplug/apt-pinning.html))

    pin preference

check?

		apt-cache policy network-manager
		network-manager:
			Installed: 1.4.0-3
			Candidate: 1.2.4-2
			Version table:
		*** 1.4.0-3 500
						500 http://ftp.fr.debian.org/debian unstable/main amd64 Packages
						100 /var/lib/dpkg/status
				1.2.4-2 1001
						500 http://snapshot.debian.org/archive/debian/20160810T223243Z unstable/main amd64 Packages


install?

		sudo apt-get install network-manager network-manager-gnome
		Reading package lists... Done
		Building dependency tree
		Reading state information... Done
		Some packages could not be installed. This may mean that you have
		requested an impossible situation or if you are using the unstable
		distribution that some required packages have not yet been created
		or been moved out of Incoming.
		The following information may help to resolve the situation:

		The following packages have unmet dependencies:
		network-manager-gnome : Depends: libnma0 (= 1.2.4-1) but 1.4.0-2 is to be installed
		E: Unable to correct problems, you have held broken packages.

nope...
not this day :)

O2- start wireless on command line and wait for resolution of network-manager-gnome

