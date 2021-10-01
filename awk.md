# awk

Tested with `gawk` (GNU Awk).

## General

* Per default awk expects input on standard in
* Per default awk expects output on standard out
* Awk refers to each line as a `record` and each column as a `field`

## Print

| Syntax                                   | Description                                  |
| ---------------------------------------- | -------------------------------------------- |
| `{ print }` / `{ print $0 }`             | print everything                             |
| `{ print $1 }`                           | print first field of every record            |
| `{ print $2 }`                           | print second field of every record           |
| `{ print $1, $2 }`                       | print first and second field of every record |
| `{ print $NF }` (NF = number of fields)  | print last field of every record             |
| `{ print NF }` (NF = number of fields)   | count and print number of fields             |
| `{ print NR }` (NR = number of records)  | print number of the record / line number     |

Examples:

```shell
# print standard input on standard output
$ echo "one two three" | awk '{ print }'
one two three

# read from file
$ awk '{ print }' file.tsv
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

## Field Seperators

* The default field seperator is a white space
* You can change the field separator with `-F`

Examples:

```shell
# use whitespace per default
$ echo "one two three" | awk '{ print $2 }'
two

# use , as field seperator
$ echo "one,two,three" | awk -F ',' '{ print $2 }'
two

# use tabs as field seperator
awk -F '\t' '{ print $6 }' bookreviews.tsv
The Hitchhikers Guide to the Galaxy
```

## Resources

* [Understanding AWK](https://earthly.dev/blog/awk-examples/)
