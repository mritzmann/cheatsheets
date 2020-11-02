# Benchmark

## Disk

Write test.

```shell
sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync
```

Read test.

* Reads the file written during the write test.
* The file may be read from the cache. Therefore execute [`/sbin/sysctl -w vm.drop_caches=3`](https://www.kernel.org/doc/Documentation/sysctl/vm.txt) first before testing.

```
dd if=tempfile of=/dev/null bs=1M count=1024
```
