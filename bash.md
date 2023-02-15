# Bash

## Best Practice for Scripts

* Use `[[` instead of `[` for if / while statements
  * Because `[[` is a bash built-in, `[` is not
  * More powerfull than `[` or `test`
* Quote variable accesses with double-quotes
* Redirect error messages to stderr. Example:
```shell
echo 'error message' >&2
```

Template / usefule defaults for bash scripts:

```bash
#!/usr/bin/env bash

# exit when a command fails
set -o errexit

# exit when accessing an unset variable
set -o nounset

# exit if one command in a pipeline fails
set -o pipefail

# debugg script with 'TRACE=1 ./script.sh'
if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi
```

See also: https://sharats.me/posts/shell-script-best-practices/

## Variablen

Default setzen:

```shell
${VAR1:-"Hello World"}
```
```shell
VAR1=${VAR1:="Hello World"}
```

Substring:

```shell
VAR1=user:diretory

# remove substring beforce ":"
VAR2=${VAR1#*:}

# remove substring after ":"
VAR2=${VAR1%:*}
```

## Test Operators

```
-e      file exists
-f      file is a regular file (not a directory or device file)
-s      file is not zero size
-d      file is a directory
-h/-l   file is a symbolic link
-S      file is a socket
-r      file has read permission (for the user running the test)
-w      file has write permission (for the user running the test)
-x      file has execute permission (for the user running the test)
-O      you are owner of file
```

More: https://tldp.org/LDP/abs/html/fto.html

## Redirections

| File Descriptor | Purpose              | Example                                          |
| :-------------- | :------------------- | :----------------------------------------------- |
| `0`             | Standard input       |                                                  |
| `1`             | Standard output      | `command 1> output.txt` / `command > output.txt` |
| `2`             | Standard error       | `command 2> output.txt`                          |
| `1` & `2`       | Redirect both        | `command &> output.txt`                          |
| `1` & terminal  | to file and terminal | `command 2>&1 \| tee out.log`                    |

More: https://www.gnu.org/software/bash/manual/html_node/Redirections.html

## Compare

| Expresion             | Purpose            | Return `0` if                                |
| :-------------------- | :----------------- | :------------------------------------------- |
| `[ $var1 -eq $var2 ]` | equal              | `$var1` is equal to `$var2`                  |
| `[ $var1 -ne $var2 ]` | not equal          | `$var1` is not equal to `$var2`              |
| `[ $var1 -lt $var2 ]` | less than          | `$var1` is less then `$var2`                 |
| `[ $var1 -gt $var2 ]` | greater than       | `$var1` is greater then `$var2`              |
| `[ $var1 -le $var2 ]` | less equal         | `$var1` is less or equal then `$var2`        |
| `[ $var1 -ge $var2 ]` | greater equal      | `$var1` is greater or equal then `$var2`   |

## If and Else

```bash
if test-command; then
  command
fi
```

```bash
if test-command; then
  command
else
  command
fi
```

```bash
if test-command; then
  command
elif test-command; then
  command
fi
```

## While

```bash
count=3
while [ $count -gt 0 ]
do
  echo $count
  let count=$count-1
done
```

## For

Contains all arguments

* `$*`: As single string
* `$@`: As array

```bash
for variable in string1 string2 string3
do
  echo $variable
done
```

## Case

```bash
case $variable in
  a|-a|--all)  echo all files ;;
  n|-n|--new)  echo new file ;;
  * )          echo not available
esac
```

## Arrays

Variable that contains multiple values.

### Create Array

```bash
arr1=(A B C)
      ▲ ▲ ▲
      │ │ │
      │ │ Index 2
      │ Index 1
      Index 0
```

or:

```bash
declare -a aar2
arr2[0]=A
arr2[1]=B
arr2[2]=C
```

### Extend Array

```bash
arr1+=(D E F)
```

### Access Array

```bash
# echo value in index 0
echo ${Lebensmittel[0]}

# echo all values
echo ${Lebensmittel[@]}
```

### Special Functions

```bash
# count all values
echo ${#arr1[@]}
```

```bash
# length of the fourth value
echo ${#arr1[4]}
```

### Associative Array

* Key=Value instead of Index=Value
* Declare with `-A`, instead of `-a`
* Works with Bash 4 or newer

```bash
declare -A aar3
aar3[key]=value
echo ${arr1[key]}
```
