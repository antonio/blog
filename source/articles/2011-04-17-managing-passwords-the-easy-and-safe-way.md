---
date: '2011-04-17 17:30:00'
layout: post
slug: managing-passwords-the-easy-and-safe-way
status: publish
title: Managing passwords the easy (and safe) way
comments: true
categories:
- howto
- linux
- security
---

**The problem**

I used to have a standard password for the majority of my web accounts
(with the exception of my mail and bank accounts, of course).

You know, despite having always known that it is indeed a very, very,
very bad practice, I preferred to look the other way and accept the
danger, embracing the commodity of not having to remember a lot of
passwords. So, the other day it happened what was meant to happen, and
while I was login to my mail account a Pidgin window suddenly popped
up out of nowhere making my password not to be a secret
anymore. Actually my mail password was not the aforementioned standard
one, so replacing it was easy as cake, but the situation made me
thought about how difficult and boring, if possible at all, would be
to change the password of those accounts that share it.

Anyway, no harm had been done and it seemed like the perfect time for
me to query Google a little bit about how could I manage my passwords
more efficiently, looking for something that allows to:

* Easily store and retrieve a different password for each service, obviously.
* Easily manage my password keyring.
* Sync my passwords between all my computers.

**LastPass: a web app to rule them all**

[LastPass](http://www.lastpass.com) is a service that allows you to
store your passwords in an external and secure server and access them
using your browser, making them available in any computer you
have. The password database is signed and encrypted with a password of
your choice, making it impossible for another person to hack the
LastPass servers and gain access to your secret information.

LastPass can be used on any operating system, as there are not only
extensions for the most used web browsers (Internet Explorer, Mozilla
Firefox, Google Chrome and Opera) but it is also possible to access
your password vault from the LastPass website, though this is by far
not as powerful as using an official extension, which allows you to
automatically fill forms when you enter a stored site.

There are two interesting features included with the binary browser
extension, like a simple secure password generator. It is possible to
customize some basic options like the set of used characters and the
length of the new key. The
[One Time Password](http://helpdesk.lastpass.com/security-options/one-time-passwords/)
functionality makes it more secure to log-in on public computers that
we do not trust, as it will make potential key-loggers useless.

LastPass is available at no charge, but there is also the option to
subscribe (1$/month) to get access to the complete set of
features. The free version does not support mobile devices,
practically forcing you to subscribe if you own a smartphone,

There are a couple things I don't like about it, and the actual reason
why I am not finally using it:

* LastPass is a product thought for web applications accounts. Yes,
  you can store secure notes but that is not really a keyring to store
  passwords for shell accounts or VPN credentials, for example.
* Being a web application, if you are not able to connect to the
  Internet, you won't be able to log-in with the servers and therefore
  unable to retrieve any password.

All in all, LastPass is a great application and you should definitely
consider it if your intention is to use it basically to keep your web
accounts passwords safe and easy to reach and you don't care about
mobile devices support, which I guess fits the needs of most of the
people.

**Going offline**

Having tried (and liked) LastPass, I wanted to check for the existence
of a similar application but this time desktop based, so I would not
depend on an external service or Internet connection. I am a GNU/Linux
user with a Windows 7 installation for gaming, so a cross platform
solution would be awesome, but not mandatory.

I took a peek into the [ArchLinux](http://www.archlinux.org)
repositories, looking for packages with the keyword _password_ in
their descriptions. Some of them I knew from previous attempts of
installing and using a password manager like Gnome Revelation, which I
used to use until development stopped back in 2007.

I finally ended up installing KeepassX as it is supported by ArchLinux
developers (ie, not in the [AUR](http://aur.archlinux.org)) and has a
very interesting set of features.

**Keepass and KeepassX**

In order to talk about KeePassX, I should introduce you KeePass
before. [KeePass](http://www.keepass.info) is an open source Microsoft
Windows password manager written in the _.NET_ language, featuring
strong security and auto-type, the later meaning that your passwords
will be filled in forms by pressing a customizable key. Isn't that
cool?

KeePassX is the open source version of the former, fully compatible
with KeePass 1.x databases. Named KeePass/L in the beginning (_L_
standing for Linux), it was renamed once it became a cross platform
application (supporting Microsoft Windows and OS X as well).

KeePassX is a graphical application with minimal dependencies (Qt,
libxtst) that creates and manages an encrypted password database that
is stored as a single file in the system. The database uses a powerful
enough encryption so that it is virtually impossible to hack it
without knowing the password.

KeePassX is distributed as a _zip_ file for the Windows platform, an
installer for OS X and several different packages for Linux, though it
should be available in your distribution package system.

Once you install it, you just create a new database and start adding
passwords. Take your time, though, to configure the program a little
bit. My recommendation is to tune it so that it starts minimized and
locked, and to be sent to tray when the _close_ button is
pressed. That, as well as adding it to the list of programs executed
when your system starts, will make your passwords available within a
couple of clicks. Also, consider checking the _Automatically save
database after every change_ and the automatic locking options.

![Configuration settings](/images/2011/04/wpid-configuration-settings.png)

As you can see in the screenshot below once you find the password you
are looking for there are some shortcuts that make it easy to fill web
forms.

![Menu](/images/2011/04/menu.png)

The most powerful option is definitely _Perform Auto-Type_, which will
insert both the user name and password automatically (currently only
on Linux). There is even a way to configure a global shortcut key
under the settings that will perform the auto typing based on the
window title, even if KeePassX is minimized. It is possible to
configure both the window title and the auto-type sequence, as shown
in the following screenshot:

![KeepassX entry](/images/2011/04/keepassx-entry.png)

I find it a little bit annoying that the program lacks the option to
bring it to front with a key, as I find myself clicking more often
that I'd like. Anyway, that and the fact that it uses Qt and does not
fit my otherwise Gtk desktop are the only two cons I can point out.

A new version of KeePassX is on the works according to
[this post in the blog](http://www.keepassx.org/news/2010/09/242)
though it seems that the development is going at a slow pace. The most
interesting features of this new to-be version in my opinion are
auto-type for Windows and OS X and integration with various components
in Linux. If you are interested in how KeePassX v2 evolves, you can
watch the code repository [here](http://gitorious.org/keepassx).

**Synchronization**

Up to this point we have seen how to use KeePassX to manage a password
database in your system. Nowadays, this is not really useful as I
guess that the average Joe probably uses several computers during the
day. I, for example, currently own a desktop computer, a laptop and a
smartphone, but I frequently use my girlfriend's laptop as well, not
to mention my computer at the office. Anyway, it seems like it could
be definitely useful to sync my passwords database between all of them
instead of carrying a pendrive with me most of the time.

[Dropbox](http://www.dropbox.com) is, according to their site, "the
easiest way to store, sync, and, share files online", and it certainly
seems like it to me. Basically, after registering in the site you will
be granted with 2GB of space in the cloud that you can fill with
whatever you like (music, videos, documents, photos, you name
it). There are also paid plans that provide more space (50GB and
100GB), though I find them a little bit expensive.

Dropbox works by creating a folder in your hard disk that mirrors the
contents available in the cloud one. Synchronization is automatic, and
once you modify anything in the folder the change is replicated to the
other computers (or mobile devices). Finally, it is cross platform,
supporting the three major operating systems (Windows, Linux and OS
X).

You can get extra space for free by accomplishing some tasks like
twittering about Dropbox or linking it to your Facebook account. And
for any friend that you bring over to Dropbox you will get 250MB (so,
if you don't have an account already, click
[here](http://db.tt/puIUUiK) and increase my free space :D), up to a
limit of 8GB.

To get KeePassX and Dropbox to work together, simply place the
database in your Dropbox folder. Easy as pie.

**My phone wants some, too**

[KeePassDroid](http://www.keepassdroid.com) is an excellent Android
application available at no cost
[in the market](https://market.android.com/details?id=com.android.keepass)
that is able to read and write KeePass and KeePassX password
databases. By combining it with
[the official Dropbox Android application](https://market.android.com/details?id=com.dropbox.android)
you will never be locked out any website, as synchronization between
your computers and your phone is taken care of by the cloud based
service.

Its use is really straightforward, as you only need to select the
database file and type the master password to get the complete list of
credentials ordered by groups. You can search for a specific entry
using the menu button and copy the credentials to the clipboard,
making it really easy to login using the Android browser.

If I have to point out defects, I'd say that I find it a little bit
lacking in terms of user interface. Also, it would be awesome (though
I don't know if it is possible at all) if KeePassDroid was
automatically launched from the very same browser when a password
needs to be typed.

There are also alternatives for the iPhone like
[iKeePass](http://www.ikeepass.de) or
[MyKeePass](http://mykeepass.blogspot.com/), and also applications for
Windows Phone 7 ([7Pass](http://7pass.wordpress.com/)). Other mobile
systems like BlackBerry or Symbian also have applications able to
interact with KeePass databases (see
[http://www.keepass.info/download.html](http://www.keepass.info/download.html)
for an up-to-date list).

**Looks nice, but I am a terminal lover nerd**

For those of us out there command line lovers, there is a program
called [kpcli](http://kpcli.sourceforge.net/) which makes it possible
to interact with the password database, what can be useful on those
occassions you lack a graphical environment (say an ssh connection,
for example). In ArchLinux, kpcli is available
[in the AUR](http://aur.archlinux.org/packages.php?ID=45017).

**The extra mile: TrueCrypt**

And for the extra paranoid out there, what about getting enhanced
security by creating an encrypted volume in your Dropbox folder?
[TrueCrypt](http://www.truecrypt.org/) on-the-fly capabilities make it
possible to add an extra layer of security without a remarkable impact
in performance. A tutorial on how to perform this is out of the scope
of the post, but feel free to
[check this link out](https://wiki.archlinux.org/index.php/Truecrypt)
for more information on how it can be done.
