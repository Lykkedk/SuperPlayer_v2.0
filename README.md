# SuperPlayer_v2.0 
*The guide is done, so please try it out and report back* 

## This guide is meant as an upgrade guide to my SuperPlayer to use newer versions of CamillaDSP. So i assume that you have an existing SuperPlayer working!?

The development on the Camilladsp goes fast, and some new stuff are nice to have.\
The newer versions of CamillaDSP gives the possibility to use a webinterface to control the filter's etc...

Let's go...

![C_DSP Logo](/C_DSP.png)

### Expand filesystem on piCorePlayer

What i did not mention in the original SuperPlayer howto, was that one have to be sure to expand the filesystem on the\
piCorePlayer (pCP) distribution.

You do it in the [main] panel on the webinterface http://192.168.1.95/cgi-bin/main.cgi (with correct IP ofcause)

![ResizeFS Logo](/ResizeFS.png)

### Let's go then... start with logging into your'e Raspberry Pi now

```ssh tc@192.168.1.95``` (with the right ip number
ofcause)\
Default password is: ```piCore```\
Killem' all : ```sudo killall squeezelite-custom```\
```sudo killall camilladsp```

### Install and load some compile & Python stuff

For the stuff to compile later, we need some thing's loaded, so execute the 4 commands below :\
```tce-load -wo compiletc.tcz```\
```tce-load -i compiletc.tcz```\
```tce-load -wo python3.6-dev```\
```tce-load -i python3.6-dev```\
The command tce-load -wo, downloads and saves the application as an ondemand item.\
Tce-load -i installs it. This way the applications are not loaded when the Pi boot's, but it's possible to load them manually. - Saving ram is good!

Next install Python's setuptool, so execute :\
```sudo -H pip3 install setuptools```

When this is done, try to do ```ls -all /usr/local/lib/python3.6/site-packages```
The output shows where all the Python stuff are located; this location/dir we have to make sure is persistent through reboot's.\
This is done by executing ```echo usr/local/lib/python3.6/site-packages >> /opt/.filetool.lst```\
If you execute ```cat /opt/.filetool.lst``` afterwards, you can see the line at the bottom of the list... Good then ;-)

Now execute ```sudo filetool.sh -b``` - Saves our stuff.

Now type and execute the following commands:\
```cd /home/tc/DSP_Engine```\
```mv camilladsp OLD_camilladsp``` Saves the old camilladsp engine.\
```rm camilladsp-linux-armv7.tar.gz``` Removes the old downloaded version if it's there. Nevermind if you got error file dosent exist, it's okay.\

```wget https://github.com/HEnquist/camilladsp/releases/download/v0.4.0-beta3/camilladsp-linux-armv7.tar.gz```\
```tar -xf camilladsp-linux-armv7.tar.gz```\
```chmod +x camilladsp```

```./camilladsp -V``` Should now show version CamillaDSP 0.4.0\
```rm camilladsp-linux-armv7.tar.gz```

```wget https://github.com/HEnquist/pycamilladsp/archive/v0.4.0.zip```\
```unzip v0.4.0.zip```\
```rm v0.4.0.zip```

```mkdir camillagui```\
```cd camillagui```\
```wget https://github.com/HEnquist/camillagui-backend/releases/download/v0.4.2/camillagui.zip```\
```unzip camillagui.zip```\
```rm camillagui.zip```

```cd /home/tc/DSP_Engine/pycamilladsp-0.4.0```\
```sudo -H pip3 install .```

```cd /home/tc/DSP_Engine```\
```sudo -H pip3 install aiohttp```

### Come on... take a short break! Coffee? Beer? ...

```cd /home/tc/DSP_Engine/camillagui```\
```nano config/camillagui.yml```

Edit the file so it look's like this :
```---
camilla_host: "0.0.0.0"
camilla_port: 3011
port: 5000
config_dir: "/home/tc/DSP_Engine/filters"
coeff_dir: "/home/tc/DSP_Engine/filters"
```
Save it when done with [ctrl] + [o], and exit nano with [ctrl] + [x]

Let's save it all again... ```sudo filetool.sh -b```\
```cd /home/tc/```

Now on your'e laptop or whatever git clone the SuperPlayer 2.\
```git clone https://github.com/Lykkedk/SuperPlayer_v2.0.git```

Then transfer the following 5 files to the pCP/SuperPlayer Raspberry pi (/home/tc directory) with SCP, midnight-commander or like.
```
StartServer.sh
exec_44100.py
exec_48000.py
exec_88200.py
exec_96000.py
```

The /home/tc directory should look like this now:
```tc@piCorePlayer:~$ ls -all /home/tc
total 72
drwxr-s---    5 tc       staff          440 Oct 11 13:15 ./
drwxrwxr-x    3 root     staff           60 Jan  6  2017 ../
drwxr-xr-x    2 tc       staff           40 Jun  6 17:29 .X.d/
-rw-r--r--    1 tc       staff          114 Jun  6 17:29 .alsaequal.presets
-rw-rw-r--    1 tc       staff         2579 Oct 11 13:16 .ash_history
-rw-r--r--    1 tc       staff         1016 Jun  6 17:29 .ashrc
drwxr-s---    3 tc       staff           60 Jan  6  2017 .local/
-rw-rw-r--    1 tc       staff          920 Jun  9  2019 .profile
-rwxr-xr-x    1 tc       staff         3387 Oct 11 11:24 CamillaDSP.sh
drwxr-sr-x    5 tc       staff          140 Oct 11 12:34 DSP_Engine/
-rw-r--r--    1 tc       staff          178 Oct 11 13:09 StartServer.sh
-rw-r--r--    1 tc       staff          221 Oct 11 13:06 exec_44100.py
-rw-r--r--    1 tc       staff          221 Oct 11 13:06 exec_48000.py
-rw-r--r--    1 tc       staff          221 Oct 11 13:06 exec_88200.py
-rw-r--r--    1 tc       staff          221 Oct 11 13:06 exec_96000.py
-rwxr-xr-x    1 tc       staff         6931 Oct 11 11:24 filter.sh
-rwxr-xr-x    1 tc       staff         2135 Jun  6 17:29 pcp-powerbutton.sh
-rwxr-xr-x    1 tc       staff          713 Jun  6 17:29 powerscript.sh
```

Now cd to the filter's directory ```/home/tc/DSP_Engine/filters```

### Be aware before doing the next command, preserve if you have some special exec's there!

Remove the old exec files\
```rm exec*```\
```cp /home/tc/exec* /home/tc/DSP_Engine/filters```\
```rm /home/tc/exec*```

### Finishing it all up

```cd /home/tc```

```chmod + x StartServer.sh```\
```echo /home/tc/StartServer.sh >> /opt/bootlocal.sh```\
The command ```cat /opt/bootlocal.sh``` should look like this:\
```
#!/bin/sh
# put other system startup commands here

GREEN="$(echo -e '\033[1;32m')"

echo
echo "${GREEN}Running bootlocal.sh..."

modprobe snd_aloop
/home/tc/CamillaDSP.sh start
sleep 1

#pCPstart------
/usr/local/etc/init.d/pcp_startup.sh 2>&1 | tee -a /var/log/pcp_boot.log
#pCPstop------
/home/tc/StartServer.sh

```

### If everything is well, we are ready to see if it's working

```sudo filetool.sh -b```
```sudo reboot```

### [X] your'e fingers and hope all is working

When the Pi is done rebooting, login to it like ```http://192.168.1.95:5000/gui/index.html```

I did a clean/fresh install where i installed the SuperPlayer (https://github.com/Lykkedk/SuperPlayer) and afterwards did the upgrade to SuperPlayer_v2.0 to test it on my testrig.
Everything is working as expected, so good luck.

Jesper (lykkedk at diyaudio.com)


