# Z Shell (zsh)

## Perfomance Profiling

Allows to find out why ZSH starts slowly. To do this, edit the `$HOME/.zshrc` file as follows:

- First line: `zmodload zsh/zprof`
- Last line: `zprof`

Then open a new ZSH session. Result:

```
num  calls                time                       self            name
-----------------------------------------------------------------------------------
 1)    1         367.05   367.05   95.86%    203.58   203.58   53.17%  nvm_auto
 2)    2         163.48    81.74   42.69%     80.52    40.26   21.03%  nvm
 3)    1          62.24    62.24   16.25%     47.57    47.57   12.42%  nvm_ensure_version_installed
 4)    1          20.65    20.65    5.39%     20.58    20.58    5.37%  nvm_die_on_prefix
 5)    1          14.67    14.67    3.83%     14.67    14.67    3.83%  nvm_is_version_installed
 6)    1           9.39     9.39    2.45%      9.39     9.39    2.45%  compinit
 7)    1           2.63     2.63    0.69%      2.63     2.63    0.69%  (anon)
 8)    1           2.09     2.09    0.55%      2.09     2.09    0.55%  update_terminalapp_cwd
 9)   17           0.74     0.04    0.19%      0.74     0.04    0.19%  compdef
10)    1           0.48     0.48    0.13%      0.48     0.48    0.13%  colors
11)    3           0.22     0.07    0.06%      0.22     0.07    0.06%  is-at-least
12)    3           0.11     0.04    0.03%      0.11     0.04    0.03%  add-zsh-hook
13)    1           0.07     0.07    0.02%      0.07     0.07    0.02%  nvm_has
14)    4           0.07     0.02    0.02%      0.07     0.02    0.02%  nvm_npmrc_bad_news_bears
15)    4           0.05     0.01    0.01%      0.05     0.01    0.01%  is_plugin
16)    1           0.08     0.08    0.02%      0.04     0.04    0.01%  complete
17)    3           0.03     0.01    0.01%      0.03     0.01    0.01%  is_theme
18)    2           0.02     0.01    0.01%      0.02     0.01    0.01%  bashcompinit
19)    2           0.02     0.01    0.00%      0.02     0.01    0.00%  env_default
20)    1           0.01     0.01    0.00%      0.01     0.01    0.00%  detect-clipboard
21)    1         367.07   367.07   95.86%      0.01     0.01    0.00%  nvm_process_parameters
22)    1           0.01     0.01    0.00%      0.01     0.01    0.00%  nvm_is_zsh
```

In this case, nvm is the culprit. It is recommended to load nvm only if needed. In my case I solved this with a function.

```shell
function init_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
```
