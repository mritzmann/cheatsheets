# Linux Disk Management

Rescan devices:

```shell
echo 1 > /sys/block/sda/device/rescan
```

Rescan partitions:

```shell
partprobe
```

Resize LVM:

```shell
pvresize /dev/sda2
vgdisplay
lvextend -l +100%FREE /dev/vg0/lvvvvroot
```

Resize Btrfs:

```shell
btrfs filesystem resize max /
```
