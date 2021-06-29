# GIT

## Git Stash

```
git stash list
git stash save "comment"
git stash pop
```

Command `git stash pop` will remove the most recent stash from the list

Aslso you can specifie and pop any stash in the list:

```
git stash pop stash@{1}
```

Also _apply_ is similar to pop but without dropping from the list of stashes

```
git stash apply
```
