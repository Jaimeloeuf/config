# Using Commit Ranges with Git Log
## Diff between current branch and master:
- git diff master

## Diff between two branches, e.g. master and staging:
- git diff master..staging

## Show only files that are different between the two branches (without changes themselves)
- git diff --name-status master..staging
- git diff --name-status master...staging

# Using Commit Ranges with Git Log
## show all of commits that B has that A doesn't have
- git log A..B

## show both "the commits that A has and that B doesn't have" and "the commits that B has that A doesn't have"
- In other words, it will filter out all of the commits that both A and B share, only showing commits that they don't both share.
    - git log A...B
- You can make the triple-dot commit range ... in a log command with the --left-right option to show which commits belong to which branch:
    - git log --oneline --decorate --left-right --graph master...origin/master