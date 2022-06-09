# Bash

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

| File Descriptor | Purpose         | Example                                          |
| --------------- | --------------- | ------------------------------------------------ |
| 0               | Standard input  |                                                  |
| 1               | Standard output | `command 1> output.txt` / `command > output.txt` |
| 2               | Standard error  | `command 2> output.txt`                          |

* Redirect standard and error output: `command &> output.txt`
* Redirect to terminal and file: `command 2>&1 | tee out.log`

More: https://www.gnu.org/software/bash/manual/html_node/Redirections.html

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
