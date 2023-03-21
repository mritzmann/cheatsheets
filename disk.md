# Linux Disk Management

## Resize Online

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

## Mount new Disk

Show all disk and partitions:

```shell
fdisk -l
```

Create partition:

```shell
fdisk <path-to-device>
fdisk /dev/sdb
```

Create Filesystem:

```shell
mkfs.ext4 /dev/sdb1
```

Mount filesystem:

```shell
mount /dev/sdb1 /mnt
```

## Create RAM Disk

Create & mount `tmpfs`-RAM-disk:

```shell
mkdir /mnt/ramdisk
mount -t tmpfs -o size=210G tmpfs /mnt/ramdisk
```

## Load / Utilization

I/O monitor:

```shell
iotop
```

```shell
pidstat -dl 20
```
