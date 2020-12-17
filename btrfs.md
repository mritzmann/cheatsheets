# Btrfs

## Diff between Snapshots

> This tool can show you what folders have the most changed data between snapshots

https://github.com/rkapl/btsdu

```shell
apt install -y cargo
cargo install btsdu
~/.cargo/bin/btsdu -p /snapshot/20201126-0357-day /snapshot/20201127-0357-day
```

## Send and Receive

Push snapshot to another host:

```shell
btrfs send /path/to/snapshot | ssh root@srv01.example.com "btrfs receive /path/to/snapshot"
```

Pull snapshot from another host:

```shell
ssh root@srv01.example.com "btrfs send /path/to/snapshot" | btrfs receive /path/to/snapshot
```
