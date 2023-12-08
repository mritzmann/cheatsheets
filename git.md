# Git - Version Control System

## Create a new branch from unstaged changes

```shell
git checkout -b feature-branch

# git v2.23 or newer
git switch --create feature-branch
```

## Restore file from commit

```shell
git restore --source=50f5bffc787d52a927d7680e3c6b9abed2a75d09 --worktree modules/clamav/manifests/init.pp
```

* `--source`/`-W`: Commit ID
* `--worktree`/`-s`: Do not add to Staging-Area

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
