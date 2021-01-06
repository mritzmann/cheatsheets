# macOS

## Disable non-breaking space

Problem:

```shell
$ echo test | less
zsh: command not found:  less
```

Turns out: I often type the non-breaking space instead of a regular one.
This happens because `option`+`space` writes a non-breaking space.
Option is used in this case for writing `|`, so i release the option key too slow.

Solution:

```shell
$ mkdir -p ~/Library/KeyBindings/
$ cat ~/Library/KeyBindings/DefaultKeyBinding.dict
{
"~ " = ("insertText:", " ");
}
```

Afterwards, a restart of the affected application is necessary.

Source: https://superuser.com/a/142573
