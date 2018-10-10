easy when has net https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=808077 

wtf chromium browser ?
I have

		/var/log/apt $ dpkg -l chromium*
		Desired=Unknown/Install/Remove/Purge/Hold
		| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
		|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
		||/ Name                              Version               Architecture          Description
		+++-=================================-=====================-=====================-========================================================================
		ii  chromium                          47.0.2526.80-2        amd64                 web browser
		ii  chromium-l10n                     47.0.2526.80-2        all                   web browser - language packs


and https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1379590.html
a resolution is 

    apt-get install chromium-l10n 

