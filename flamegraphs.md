# CPU Flame Graphs

Determining why CPUs are busy.

## Setup

```shell
git clone https://github.com/brendangregg/FlameGraph
cd FlameGraph
```

```shell
# for perf
apt-get install --yes perf

# for dtrace
apt-get install --yes systemtap-sdt-dev
```

## Examples

Flame Graph supports multiple CPU profilers.

## Perf

```shell
perf record --freq 99 --all-cpus -g -- sleep 5
perf script | ./stackcollapse-perf.pl > out.perf-folded
./flamegraph.pl out.perf-folded > perf.svg
```

## Sources

* https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html
* https://github.com/brendangregg/FlameGraph
