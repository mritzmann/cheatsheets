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
