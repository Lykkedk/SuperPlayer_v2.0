# SuperPlayer_v2.0 
*The guide is not done yet, so please don't use it* 

## This guide is meant as an upgrade guide to my SuperPlayer to use newer versions of CamillaDSP

The development on the Camilladsp goes fast, and some new stuff are nice to have.\
The newer versions of CamillaDSP gives the possibility to use a webinterface to control the filter's etc...

Let's go...

![C_DSP Logo](/C_DSP.png)

### Expand filesystem on piCorePlayer

What i did not mention in the original SuperPlayer howto, was that one have to be sure to expand the filesystem on the\
piCorePlayer (pCP) distribution.

You do it in the [main] panel on the webinterface http://192.168.1.95/cgi-bin/main.cgi (with correct IP ofcause)

![ResizeFS Logo](/ResizeFS.png)

### Let's start with logging into our Raspberry Pi

```ssh tc@192.168.1.95``` (with the right ip number
ofcause)\
Default password is: ```piCore``` 

### Expand filesystem on piCorePlayer

For the stuff to compile later, we need some thing's loaded, so execute the 4 commands below :\
```tce-load -wo compiletc.tcz```\
```tce-load -i compiletc.tcz```\
```tce-load -wo python3.6-dev```\
```tce-load -i python3.6-dev```\
The command tce-load -wo, downloads and saves the application as an ondemand item.\
Tce-load -i installs it. This way the applications are not loaded when the Pi boot's, but it's possible to load them manually. - Saving ram is good!

Next install Python's setuptool, so execute :\
```sudo -H pip3 install setuptools```


```tce-load -i python3.6-dev```




