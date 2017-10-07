# docker-filebot-rpi

Docker image to run filebot on a raspberry PI (tested on a rpi-3 but it should work on all of them)

### Steps

Install docker:

`apt-get install docker.io`

Build this image

`docker build filebot-rpi .`

Enjoy

```
$ docker run filebot-rpi -script "fn:sysinfo"
FileBot 4.7.7 (r4678)
JNA Native: 4.0.0
MediaInfo: 0.7.70
Apache Commons VFS: [zip, rar]
Oct 07, 2017 4:51:03 AM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
Chromaprint: java.io.IOException: Cannot run program "fpcalc": error=2, No such file or directory
Extended Attributes: OK
Unicode Filesystem: OK
Script Bundle: 2017-05-15 (r500)
Groovy: 2.4.7                                                                                                                                                                                                                                 JRE: OpenJDK Runtime Environment 1.8.0_131
JVM: 32-bit OpenJDK Zero VM
CPU/MEM: 4 Core / 224 MB Max Memory / 15 MB Used Memory
OS: Linux (arm)
Package: IPKG
uname: Linux b0c80312a2f5 4.9.41-v7+ #1023 SMP Tue Aug 8 16:00:15 BST 2017 armv7l GNU/Linux

------------------- UPDATE AVAILABLE: FileBot 4.7.9 (r4984) --------------------
```
