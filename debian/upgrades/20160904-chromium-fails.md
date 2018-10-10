
53.0.2785.89-1 crashes on each tab

http://www.eenyhelp.com/bug-836611-chromium-crash-after-upgrade-52-0-2743-116-2-53-0-2785-89-1-help-216137392.html
suggest downgrading to 52.0.2743.116-2

* current unstable does not have 52.0.2743.116-2
* testing has it
* got package in cache ...

O1- install package from cache: ok

    /var/cache/apt/archives $ sudo dpkg -i chromium_52.0.2743.116-2_amd64.deb chromium-l10n_52.0.2743.116-2_all.deb

O2- pin it to testing and apt-get install it ?
does not know how to do that yet...
