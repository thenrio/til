
```
sudo apt-get install libgnome-keyring-dev
cd /usr/share/doc/git/contrib/credential/gnome-keyring
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
```


* http://stackoverflow.com/questions/13385690/how-to-use-git-with-gnome-keyring-integration
* http://blog.iqandreas.com/git/storing-https-authentication-in-ubuntu-and-arch-linux/
