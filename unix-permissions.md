# Unix Permissions

## Reading permissions

- `r`: read
- `w`: write
- `x`: execute

|        | user | group |  all |
| ------ | ---- | ----- | ---- |
| binary |    6 |     4 |    4 |
| bits   |  110 |   110 |  100 |
| human  |  rwx |   rwx |  rwx |

## Octal permissions

| octal |	binary	| human-readable |
| ----- | ------- | -------------- |
| 0	    | 000     |	---            |
| 1	    | 001	    |	--x            |
| 2	    | 010	    |	-w-            |
| 3	    | 011	    |	-wx            |
| 4	    | 100	    |	r--            |
| 5	    | 101	    |	r-x            |
| 6	    | 110	    |	rw-            |
| 7	    | 111	    |	rwx            |

## SetUid and SetGid

If setuid is set, the executable will executed with the user who owns the executable. Example: If `/usr/bin/vi` belongs to the `root` user and setuid is set, `/usr/bin/vi` will be executed as `root` even if executed by a non-root user. Same for setgid, but for groups.

Setuid:

```shell
# add
chmod u+s /path/to/executable

# remove
chmod u-s /path/to/executable
```

Setgid:

```shell
# add
chmod g+s /path/to/executable

# remove
chmod g-s /path/to/executable
```
