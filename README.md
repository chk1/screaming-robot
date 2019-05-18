# Screaming Robot Xiaomi/Rockrobo Edition

Let's your robot make a sound when bumping into things, Proof-of-Concept. Inspired by Michael Reeves' video on Youtube: [The Roomba That Screams When it Bumps Into Stuff](https://www.youtube.com/watch?v=mvz3LRK263E).

## Howto

First [root your vacuum](https://github.com/dgiese/dustcloud).

Connect via SSH or SCP and make the following changes:

In `/opt/rockrobo/cleaner/conf/ruby_chassis.cfg` comment out the last two drivers, `writelog` and `ruby_support`. Add a new driver below:

```
driver
(
  name "writelog"
  log_directory "/run/shm/derp"
  filename "test.log"
  requires ["bumper:0"]
  provides ["log:0"]
  alwayson 1
  autorecord 1 
)
```

Reboot your vacuum.

After that, transfer `bump.wav` and `logwatch.sh` to `/root` and run 
```
chmod u+x logwatch.sh
./logwatch.sh
```

Then drive your robot into walls.

## Resources

* dgiese/dustcloud: [Issue #11 Test Application](https://github.com/dgiese/dustcloud/issues/11)
* dgiese/dustcloud: [Interesting files](https://github.com/dgiese/dustcloud/blob/master/devices/xiaomi.vacuum/Interesting-files.md)
* Player documentation: [Writing configuration files](http://playerstage.sourceforge.net/wiki/Writing_configuration_files)
* Player documentation: [Data logging](http://playerstage.sourceforge.net/wiki/Data_logging)