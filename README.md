# SuperPlayer_v2.0 
*The guide is not done yet, so please don't use it* 

## This guide is meant as an upgrade guide to my SuperPlayer to use newer versions of CamillaDSP

The development on the Camilladsp goes fast, and some new stuff are nice to have.\
The newer versions of CamillaDSP gives the possibility to use a webinterface to control the filter's etc...

Let's go...

![C_DSP Logo](/C_DSP.png)

### Let's start with logging into our Raspberry Pi

```ssh tc@192.168.1.95``` (with the right ip number
ofcause)\
Default password is: ```piCore``` 

For the stuff to compile later, we need some thing's loaded, so execute the 4 commands below :\
```tce-load -wo compiletc.tcz``` - Download and set as ondemand on piCore\
```tce-load -i compiletc.tcz``` - Install on session only\
```tce-load -wo python3.6-dev```\
```tce-load -i python3.6-dev```

Next install Python's setuptool, so execute :\
```sudo -H pip3 install setuptools```\


```tce-load -i python3.6-dev```




