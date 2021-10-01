# awk

Tested with `gawk` (GNU Awk).

## General

* Per default awk expects input on standard in
* Per default awk expects output on standard out
* Awk refers to each line as a `record` and each column as a `field`

## Print

| Syntax                       | Description |
| ---------------------------- | ----------- |
| `{ print }` / `{ print $0 }` | print everything |
| `{ print $1 }`               | print first field of every record |
| `{ print $2 }`               | print second field of every record |
| `{ print $1, $2 }`           | print first and second field of every record |
| `{ print $NF }`              | print last field of every record |

Examples:

```shell
# print standard input on standard output
$ echo "one two three" | awk '{ print }'
one two three

# print second field
$ echo "one two three" | awk '{ print $2 }'
two

# print first and second field
$ echo "
 one two three
 four five six" \
| awk '{ print $1, $2 }'
one two
four five
```
