# Regex

`.` (dot) Atom matches with any character.

`^` (caret) Atom matches with the beginning of a line.

`$` (dollar sign) Atom matches with the end of a line.

`{1,30}` String must be 1 to 30 characters long. Example: `^[a-z]{1,3}$` (`abc` is valid, `abcd` not)

## Bracket Expressions

`[0-9]` Matches digits from 0 to 9.

`[a-z]` Matches any lowercase letter.

`[A-Z]` Matches any uppercase letter.

`[A-Za-z0-9]` Combinations are also possible.

Bracket expression lists also accept classes instead of just single characters and ranges. Traditional character classes are:

`[:alnum:]` Represents an alphanumeric character.

`[:alpha:]` Represents an alphabetic character.

`[:ascii:]` Represents a character that fits into the ASCII character set.

`[:blank:]` Represents a blank character, that is, a space or a tab.

`[:cntrl:]` Represents a control character.

`[:digit:]` Represents a digit (0 through 9).

`[:graph:]` Represents any printable character except space.

`[:lower:]` Represents a lowercase character.

`[:print:]` Represents any printable character including space.

`[:punct:]` Represents any printable character which is not a space or an alphanumeric character.

`[:space:]` Represents white-space characters: space, form-feed (`\f`), newline (`\n`), carriage return (`\r`), horizontal tab (`\t`), and vertical tab (`\v`).

`[:upper:]` Represents an uppercase letter.

`[:xdigit:]` Represents hexadecimal digits (0 through F).

## Useful tools

* [regex.help](https://regex.help/) - generate a matching pattern
