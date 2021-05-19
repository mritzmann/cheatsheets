# Benchmark

## Disk

Write Speed:

```shell
sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync
```

Read Speed:

* Reads the file written during the write test.
* The file may be read from the cache. Therefore execute [`/sbin/sysctl -w vm.drop_caches=3`](https://www.kernel.org/doc/Documentation/sysctl/vm.txt) first before testing.

```
dd if=tempfile of=/dev/null bs=1M count=1024
```

IOPS Write:

* Test write IOPS by performing sequential writes, using an I/O block size of 4 KB and an I/O depth of at least 64
* Set `$TEST_DIR` to a empty directory on the target disk

```shell
fio --name=write_iops --directory=$TEST_DIR --size=10G \
--time_based --runtime=60s --ramp_time=2s --ioengine=libaio --direct=1 \
--verify=0 --bs=4K --iodepth=64 --rw=randwrite --group_reporting=1
```

IOPS Read:

* Test read IOPS, using an I/O block size of 4 KB and an I/O depth of at least 64
* Set `$TEST_DIR` to a empty directory on the target disk

```shell
fio --name=read_iops --directory=$TEST_DIR --size=10G \
--time_based --runtime=60s --ramp_time=2s --ioengine=libaio --direct=1 \
--verify=0 --bs=4K --iodepth=64 --rw=randread --group_reporting=1
```

## MySQL

Requirements:
- MySQL Database with name `sbtest`

```shell
# prepare
sysbench /usr/share/sysbench/oltp_read_write.lua --db-driver=mysql --mysql-user=root  --tables=1 --table-size=25000000 --report-interval=10 --threads=128 prepare

# run
sysbench /usr/share/sysbench/oltp_read_write.lua  --db-driver=mysql --mysql-user=root  --tables=1 --table-size=25000000 --report-interval=10 --threads=128 run
```

## Source

* [Benchmarking persistent disk performance](https://cloud.google.com/compute/docs/disks/benchmarking-pd-performance)
