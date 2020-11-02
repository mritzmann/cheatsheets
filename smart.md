# S.M.A.R.T. Test

Request a new short test. The test is executed in the background.

```shell
smartctl -t short /dev/sda
```

Wait a few minutes. Afterwards you can view the last self test.

```shell
smartctl -H /dev/sda
```

## Man Page

```
-t TEST, --test=TEST
       Executes TEST immediately.  The ´-C´ option can be used in conjunction with this option to run the
       short or long (and also for ATA devices, selective  or  conveyance)  self-tests  in  captive  mode
       (known as "foreground mode" for SCSI devices).  Note that only one test type can be run at a time,
       so only one test type should be specified per command line.  Note  also  that  if  a  computer  is
       shutdown  or power cycled during a self-test, no harm should result.  The self-test will either be
       aborted or will resume automatically.
```

```
-H, --health
       Check: Ask the device to report its SMART health status  or  pending  TapeAlert  messages.   SMART
       status is based on information that it has gathered from online and offline tests, which were used
       to determine/update its SMART vendor-specific Attribute values. TapeAlert status  is  obtained  by
       reading the TapeAlert log page.

       If the device reports failing health status, this means either that the device has already failed,
       or that it is predicting its own failure within the next 24 hours.  If this happens, use the  ´-a´
       option  to  get  more information, and get your data off the disk and to someplace safe as soon as
       you can.
```
