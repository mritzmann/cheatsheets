# Git - Version Control System

## Create a new branch from unstaged changes

```shell
git switch --create 75-yaml-toplevel
```

## Squash multiple commits into one

Useful before merging a pull request to keep the history clean and readable.

Select the number of commits you want to merge:

```shell
git rebase --interactive HEAD~N
```

You will then get an overview of the selected commits and their description. Change `pick` to `squash` (or `s` for short).
For the first commit, we leave `pick`. Example:

```
pick f173a63 add some files
squash b35b89a add some more files
squash 7bb6a9d fix typo
squash 56435dd git ci
```

Save and exit the editor. After that you can write the new commit message and also save and exit.
