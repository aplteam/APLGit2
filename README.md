# APLGit2

## Overview

`APLGit2` provides a concise set of user commands and functions that help APL programmers manage Git projects effectively.

It runs on Windows, Linux and macOS.

## Philosophy

Experience shows that supporting *all* Git commands from within APL is partly impossible, and otherwise apt to cause complications.

For example, commands that interact with the user — like `Add -i` — cannot be called from APL at all.

Complex operations like `Merge`, `Push` and `Pull` can run into trouble even when executed correctly. When they do, you may find yourself stuck mid-operation, unsure of the progress made.

`APLGit2` therefore offers only a limited set of commands, chosen for their usefulness in day-to-day project management. For everything else we recommend Git Bash, and `APLGit2` makes that easy with `]APLGit2.OpenGitShell`: it opens a Git Bash session in the current project (if just one is open) or in a specified or selected project.

Consequently most commands focus on reporting information about a project or its components.

The notable exceptions are `Add` and `Commit`. Note that `Add` can be carried out implicitly as part of `Commit`; see the relevant section for details.

We strongly advise using Git Bash for anything beyond these basic commands. That offers two key benefits:

1. Most Git resources and examples you will find online assume Git Bash.
2. For exceptional problems or tasks Git Bash is indispensable, so familiarising yourself with it is an investment that pays off.

## API

All functions are also available via an API in `⎕SE.APLGit2`, though the API calls are more basic.

For instance, the `Commit` API function simply executes `git commit`. The corresponding user command, by contrast, checks whether the project has uncommitted changes and offers to run `git add .` first; it also opens an editor for composing a commit message if the `-m=` option is omitted.

## Preconditions

* Git Bash must be installed and reachable via the `PATH` environment variable.
* The Git configuration parameters `user.name` and `user.email` must be set.

One function, `GetTagOfLatestRelease`, requires the project to be hosted on GitHub. All other commands work independently of the hosting platform.

## APLGit2 and Cider

`]APLGit2.*` works particularly well with [Cider](https://github.com/aplteam/Cider "Link to Cider on GitHub"), though Cider is not a requirement.

* If a single Cider project is open, `APLGit2` acts on that project when no folder is specified.
* If several Cider projects are open, you are prompted to choose which one to act on.

For projects not managed by Cider you must specify a folder as an argument to the user command.

Note that `APLGit2` works **locally** only: it does **not** accept URLs pointing to GitHub.

## APLGit2 and acre

`]APLGit2` cooperates with the project manager [acre](https://github.com/the-carlisle-group/acre-desktop) in the same way it cooperates with Cider, so everything said above applies to acre as well.

## Installation

`APLGit2` can be installed as a Tatin package:

```
]Tatin.InstallPackages [tatin]aplgit2 [MyUCMDs]
```

This makes the `APLGit2` user commands available but does not load the API.

Running any `APLGit2` user command loads the API into `⎕SE` automatically — executing `]APLGit2.Version` is enough.

If you want the API to be available from the start, refer to the [Dyalog User Commands](https://aplwiki.com/wiki/Dyalog_User_Commands "Link to the APL wiki") article on the APL wiki.

## Commands and API functions

Names marked with `]` are available as user commands; the others are API functions only.

```
 ]Add                     Executes the Git "Add" command
 ]AddGitIgnore            Adds a .gitignore file with defaults useful for APLers
 ]ChangeLog               Takes an APL name and lists all commits the object was part of
 ]CloneRepo               Clones a repository, by default from GitHub into the current dir
 ]Commit                  Performs a commit on the current branch
 ]CompareCommits          Takes two hashes and compares all changes between them
  CurrentBranch           Reports the current branch
 ]Diff                    Returns files in the working directory that differ from HEAD
  EstablishProject        Works out the project to act on
 ]FetchFromIndex          Fetches file(s) from the index that were modified or deleted
 ]GetLastCommit           Reports the latest commit
  GetPathFromProject      Gets the path on disk where the given project lives
  GetProjectFromPath      Gets the path in the workspace from a project's disk path
 ]GetTagOfLatestRelease   Returns the tag of the latest release
 ]Init                    Initialises a project with Git, including .gitignore & .gitattributes
 ]IsDirty                 Are there any uncommitted changes?
  IsGitInstalled          Checks whether Git is installed and returns 1 in case it is
 ]IsGitProject            Returns "yes" or "no", depending on whether there is a ./.git folder
 ]ListBranches            Lists all branches for a Git-managed project
 ]Log                     Returns the log of commits
  Methods                 Like Public, plus the comment in the first line
 ]NoOfUntrackedFiles      Returns the number of untracked files in a project or folder
 ]OpenGitShell            Opens a Git shell for a Git-managed project
 ]Push                    Pushes the current branch
 ]RefLog                  Prints a log of all references to the session
 ]Repack                  Optimises Git's internal storage, saving space & speeding things up
 ]ShowLastVersionInIndex  Shows the last version of an APL object in the index
 ]Squash                  Squashes some commits; the user is asked which ones
 ]StashApply              Applies the last or the given stash, keeps it in the stash cache
 ]StashClear              Drops all saved stashes from the stash cache
 ]StashDrop               Drops the given stash (default: latest) from the stash cache
 ]StashList               Prints a list with all currently saved stashes
 ]StashListContent        Lists the contents (tracked and untracked files) of a stash
 ]StashPop                Applies a given stash and removes it from the stash cache
 ]StashPush               Saves modifications as a new stash entry and rolls them back
 ]Status                  Reports all untracked files and/or all uncommitted changes
 ]Version                 APLGit2's version: name, version number and version date
```

Two names in that list are asymmetric:

* `CurrentBranch` is an API function but not a user command. It is used internally a great deal, and user commands like `]ListBranches` and `]Status` already report the current branch anyway.
* `]CloneRepo` is a user command only: cloning is interactive by nature, so there is no API function for it.
