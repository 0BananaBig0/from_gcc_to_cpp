<!-- vim-markdown-toc GFM -->

- [Git](#git)
  - [Perface](#perface)
  - [Create and Initialize a Repository](#create-and-initialize-a-repository)
    - [Code](#code)
    - [The Workflow of `git add TargetList` and `git commit -m "Your comments"`](#the-workflow-of-git-add-targetlist-and-git-commit--m-your-comments)
      - [The Workflow](#the-workflow)
      - [Explanation](#explanation)
  - [Check the Usage of `git`](#check-the-usage-of-git)
  - [Add Files to a Branch](#add-files-to-a-branch)
  - [Delete Files of a Branch](#delete-files-of-a-branch)
  - [Check the Status](#check-the-status)
  - [Check the Log](#check-the-log)
  - [Check Who Modified the File](#check-who-modified-the-file)
  - [Discard Current Modifications](#discard-current-modifications)
  - [Restore Local Files Before Using `git add` or `git rm` to Stage Deletions](#restore-local-files-before-using-git-add-or-git-rm-to-stage-deletions)
  - [Restore Local Files After Using `git add` or `git rm` to Stage Deletions](#restore-local-files-after-using-git-add-or-git-rm-to-stage-deletions)
  - [Check the Differences After Using `git add` or `git rm`, but Before `git commit`](#check-the-differences-after-using-git-add-or-git-rm-but-before-git-commit)
  - [Check the Differences Between the CommitHash and the Current Working Directory](#check-the-differences-between-the-commithash-and-the-current-working-directory)
  - [Check the Differences Between the CommitHashes](#check-the-differences-between-the-commithashes)
  - [Check the Differences Between the CommitHashes](#check-the-differences-between-the-commithashes-1)
  - [Check the Revision History](#check-the-revision-history)
  - [Revert to the Previous Version While Keeping Current Modifications](#revert-to-the-previous-version-while-keeping-current-modifications)
  - [Revert to the Previous Version and Discard Current Modifications](#revert-to-the-previous-version-and-discard-current-modifications)
  - [Link the Local Repository to a Remote Repository](#link-the-local-repository-to-a-remote-repository)
  - [Clone a Remote Repository](#clone-a-remote-repository)
  - [Update the Local Repository form a Remote Repository](#update-the-local-repository-form-a-remote-repository)
  - [Push the Local Repository to the Remote Repository](#push-the-local-repository-to-the-remote-repository)
  - [Check Branches](#check-branches)
  - [Create a New Branch and Switch to The New Branch](#create-a-new-branch-and-switch-to-the-new-branch)
  - [Merge Another Branch into the Current Branch](#merge-another-branch-into-the-current-branch)
  - [Delete a Branch](#delete-a-branch)
  - [Stash Current Changes, Show Stashed Changes, Restore Previous Changes and Clear Stashes](#stash-current-changes-show-stashed-changes-restore-previous-changes-and-clear-stashes)
  - [Copy the Specific Modification from Another Branch to the Current Branch](#copy-the-specific-modification-from-another-branch-to-the-current-branch)
  - [Push the Current Branch to The Remote Repository](#push-the-current-branch-to-the-remote-repository)
  - [Reorganize the Commit History](#reorganize-the-commit-history)
  - [Show Tags](#show-tags)
  - [Tag a CommitHash](#tag-a-commithash)
  - [Push the Tag to Remote](#push-the-tag-to-remote)
  - [Delete a Tag](#delete-a-tag)
  - [Delete Untracked Files](#delete-untracked-files)

<!-- vim-markdown-toc -->

## Git

### Perface

1. This file lists only common Git commands.
2. For a deeper understanding of Git, you should learn from a comprehensive Git
   tutorial.
3. [Git Handbook (Official)](https://docs.github.com/en/get-started).
4. [Pro Git Book (Free)](https://git-scm.com/book/en/v2).
5. By asking ChatGPT questions like "Is there any Git tutorial?", you can get
   more answers.

### Create and Initialize a Repository

#### Code

```SH
cd ~
mkdir repository_name
cd repository_name
git init
### Edit lots of files.
git add TargetList
git commit -m "Your comments"
```

#### The Workflow of `git add TargetList` and `git commit -m "Your comments"`

##### The Workflow

```mermaid
flowchart LR
    A[Working Directory] -->|git add TargetList| B[Staging Area #40;Index#41;]
    B -->|git commit -m #quot;Your comments#quot;| C[Current Branch]
    D[Head] --> C
    E[origin] --> G[Remote]
    F --> |git push| G
    B --> |git checkout -- TargetList| A
    C --> |git reset CommitHash| B
    C --> |git reset CommitHash --hard: First| B
    B --> |git reset CommitHash --hard: Second| A
    G --> |git fetch| F
    G --> |git clone/pull: First| F
    F --> |git clone/pull: Second| A
    subgraph F[Repository]
        B
        C
        D
        E
    end
```

##### Explanation

1. Working directory:
   - This is the directory where you work on your project.
   - Typically, it serves as the root directory and often contains a `.git`
     directory, which primarily includes the config file, the staging area,
     branches, and the head.
   - You can use the `exa` command to explore its tree structure.
2. Stage:
   - After executing the `git add TargetList` command, all changes to the files
     in `TargetList` are submitted to the staging area.
3. Current branch:
   - This refers to the branch you are currently working on in your project.
4. origin
   - origin is the default name given to a remote repository when you first
     clone a repository or add a remote with the command
     `git remote add origin TheRemoteRepositoryLink`
   - It is a shorthand alias used to refer to that remote repository, making it
     easier to work with Git commands without typing the full URL each time.
5. master:
   - It is typically the name of the main branch in your local repository.
   - It represents the latest commit on that branch. When you switch to the
     master branch, HEAD points to master.
6. HEAD:
   - It is a pointer that refers to the current commit in your local repository.
   - It indicates where you are in the commit history.
   - When you make new commits, HEAD moves forward to point to the latest
     commit.
7. origin/master:(Notes 4 and 5)
   - It is a remote-tracking branch that represents the state of the master
     branch on the remote repository (usually named origin).
   - It reflects the last known state of the master branch on the remote when
     you last fetched or pulled changes.
   - It doesn't change unless you explicitly fetch or pull.
8. origin/HEAD:(Notes 4 and 6)
   - It is a symbolic reference that points to the default branch of the origin
     remote repository, often pointing to origin/master.
   - It helps Git determine which branch to track for new clones of the
     repository.

### Check the Usage of `git`

```SH
git --help
git help TargetCommand(Optional)
git help -a
git help -g
```

### Add Files to a Branch

```SH
git add TargetList
git commit -m "Your comments"
```

### Delete Files of a Branch

```SH
# `git add` is also used to stage file deletions if you have deleted files in your local repository.
git add TargetList
git commit -m "Your comments"
```

```SH
# `git rm` does not require file deletions in your local repository.
git rm TargetList
git commit -m "Your comments"
```

```SH
git rm TargetList -r # if TargetList includes folders.
git commit -m "Your comments"
```

### Check the Status

```SH
git status
```

### Check the Log

```SH
git log -Number(How many, Optional) BranchName(Optional)
```

### Check Who Modified the File

```SH
git blame Target
```

### Discard Current Modifications

```SH
git checkout -- TargetList
```

### Restore Local Files Before Using `git add` or `git rm` to Stage Deletions

```SH
git restore TargetList # Used when local files are deleted.
```

### Restore Local Files After Using `git add` or `git rm` to Stage Deletions

```SH
git log -Number(How many, Optional)
git reset CommitHash(A sequence of number) TargetList(Optional)
git restore TargetList
```

```SH
git log -Number(How many, Optional)
git restore --source=CommitHash(A sequence of number) -- TargetList
```

```SH
git log -Number(How many, Optional)
git reset CommitHash(A sequence of number) TargetList(Optional)
git checkout -- TargetList
```

```SH
git log -Number(How many, Optional)
git checkout CommitHash(A sequence of number) -- TargetList
```

### Check the Differences After Using `git add` or `git rm`, but Before `git commit`

```SH
# Check the differences between Stage and the last commit
git diff --cached TargetList(Optional)
```

```SH
# Check the differences between Stage and the last commit
git diff --staged TargetList(Optional)
```

### Check the Differences Between the CommitHash and the Current Working Directory

```SH
git log -Number(How many, Optional)
# If not fill the CommitHash, check the differences between the last
# CommitHash and the current Working Directory
git diff CommitHash(A sequence of number, Optional) TargetList(Optional)
```

### Check the Differences Between the CommitHashes

```SH
git log -Number(How many, Optional)
# CommitHashA is treated as the original by git diff.
# CommitHashB is thought as the modified one by git diff.
git diff CommitHashA CommitHashB TargetList(Optional)
```

### Check the Differences Between the CommitHashes

```SH
# BranchNameA is treated as the original by git diff.
# BranchNameB is thought as the modified one by git diff.
# If not fill BranchNameB, the current branch is thought as BranchNameB.
git diff BranchNameA BranchNameB(Optional) TargetList(Optional)
```

### Check the Revision History

```SH
git log -Number(How many, Optional)
git show CommitHashList(Optional) TargetList(Optional) BranchName(Optional)
```

```SH
git show -Number(How many, Optional) TargetList(Optional)
```

```SH
git show --name-only -Number(How many, Optional) TargetList(Optional)
```

### Revert to the Previous Version While Keeping Current Modifications

```SH
git log -Number(How many, Optional)
git reset CommitHash(A sequence of number) TargetList(Optional)
```

### Revert to the Previous Version and Discard Current Modifications

```SH
git log -Number(How many, Optional)
git reset --hard CommitHash(A sequence of number)
```

### Link the Local Repository to a Remote Repository

```SH
git remote add origin TheRemoteRepositoryLink # Connect the local repository to the remote one.
git remote -v # Verify the remote link.
git push -u origin CurrentBranch # Push local changes to the remote.
```

### Clone a Remote Repository

```SH
git clone TheRemoteRepositoryLink
```

```SH
// If the remote repository is too large to clone successfully, use the following commands.
git clone TheRemoteRepositoryLink --depth 1
cd TheRemoteRepositoryName
git fetch --unshallow
```

### Update the Local Repository form a Remote Repository

```SH
git pull
```

### Push the Local Repository to the Remote Repository

```SH
git push
```

```SH
git push -f # Force
```

### Check Branches

```SH
git branch
```

### Create a New Branch and Switch to The New Branch

```SH
# Old method
git checkout -b ANewBranch # Create and swithc
```

```SH
# Old method
git branch ANewBranch # Create
git checkout ANewBranch # Switch
```

```SH
# New method
git switch -c ANewBranch # Create and swithc
```

```SH
# New method
git branch ANewBranch # Create
git switch ANewBranch # Switch
```

### Merge Another Branch into the Current Branch

```SH
git merge AnotherBranch
```

```SH
git merge --no-ff -m "Your comments" AnotherBranch # Ban fast-forward
# In Git, "fast-forward" is a type of merge operation that happens when there is no divergent history
# between the current branch and the branch you're merging.
```

### Delete a Branch

```SH
git branch -d ABranch
```

```SH
git branch -D ABranch # Force.
```

### Stash Current Changes, Show Stashed Changes, Restore Previous Changes and Clear Stashes

```SH
git stash # Stash current changes.
```

```SH
git stash list # List all stashes.
# The larger the `StashNumber`, the earlier the stash.
```

```SH
git stash show # Show a summary of the changes in the most recent stash.
git stash show -p #  Shows the full diff of the changes in the most recent stash.
git stash list # List all stashes.
git stash show stash@{StashNumber} # Show a summary of the changes in the specific stash.
git stash show -p stash@{StashNumber} #  Shows the full diff of the changes in the specific stash.
# The larger the `StashNumber`, the earlier the stash.
```

```SH
# The structure of the stash is a stack.
git stash pop # Restore the recent stash and delete it in the stash.
```

```SH
git stash list # List all stashes.
git stash apply stash@{StashNumber}(Optional) # Restore the specific stash.
git stash drop stash@{StashNumber}(Optional) # Delete it in the stash.
# The larger the `StashNumber`, the earlier the stash.
```

```SH
git stash clear # Clear all stashes.
```

### Copy the Specific Modification from Another Branch to the Current Branch

```SH
git switch AnotherBranch
git log # Find the specific Modification
git switch CurrentBranch
git cherry-pick CommitHash
```

### Push the Current Branch to The Remote Repository

```SH
git push origin CurrentBranch
```

### Reorganize the Commit History

```SH
git rebase
```

### Show Tags

```SH
git tag # Check tags
```

```SH
git tag -l Pattern # Check tags matching the Pattern
```

### Tag a CommitHash

```SH
git tag TagName/VersionName CommitHash(Optional) -m Comment(Optional)
# If you tag CommitHash with TagName, TagName can replace CommitHash in git commands that require it.
```

### Push the Tag to Remote

```SH
git push origin TagName # Push the specified TagName to Remote
```

```SH
git push origin --tags # Push all tags to Remote
```

### Delete a Tag

```SH
git tag -d TagName # Delete local TagName
git push origin --delete TagName # Delete remote TagName
```

### Delete Untracked Files

```SH
git clean -dn
git clean -df
```
