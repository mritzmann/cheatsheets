# sleep

Wait until:

```shell
sleep $(($(date -f - +%s- <<< $'16:26\nnow')0)) && command...
```
