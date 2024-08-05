# APLGit2

## Overview

`APLGit2` comes with a small set of user commands and functions designed to support the APL programmer while working on projects managed by Git. 

`APLGit2` runs on Windows, Linux and Mac OS.

## Philosophy

Experience tells us that trying to support all sorts of Git commands from within APL is a recipe for trouble. For example, the Git command "checkout" should not be performed from within an APL session. 

More complex stuff like `Merge`, `Push` and `Pull` can quickly run into a problem without the user doing anything wrong, and when they do, you are stuck in the middle of something within the call that executed a Git command, leaving you in the dark about how far things got.

Therefore, `APLGit2` offers only a limited number of useful commands from within APL while working on a project. For anything else we suggest using GitBash. `APLGit2` makes this easy because `]APLGit2.OpenGitShell` opens a Git Bash within the current project (if there is just one open) or in the specified/selected project.

As a result, most commands provide information about the given project or an object within that project.

Noticeable exceptions are the methods `Add` and `Commit`. Note that you can execute `Add` implicitly when executing `Commit`; see there.

We strongly recommend using the Git Bash for anything beyond that. This approach has two significant advantages:

1. Pretty much all help available on the Internet will provide solutions and examples for the Git Bash
2. For exceptional problems / tasks you have to use the Git Bash anyway, so getting used to it has merits


## API
All functions are also available via an API which lives in `⎕SE.APLGit2`. However, the API calls are more basic. 

For example, the  `Commit` API function just does that: executing `git commit`. On the other hand, the user command first checks whether the project is currently dirty, and if it is, it asks the user whether `git add .` should be executed first. Also, it opens an edit window for the user to create a message in case the `-m=` option is not set.


## Preconditions

* The Git bash must be installed and available on the environment variable `%PATH%`
* The Git config parameters `user.name` and `user.email` must be set

One function relies on you hosting your project(s) on GitHub: `GetTagOfLatestRelease`

All other commands are agnostic in this respect.


## APLGit2 and Cider

`]APLGit2.*` works particularly well in conjunction with [Cider](https://github.com/aplteam/Cider "Link to Cider on GitHub"), though this is not a requirement. 

* If a single Cider project is open, APLGit2 will always act on that project if no folder is specified
* If multiple Cider projects are open, the user is asked which project to act on

However, with a project not managed by Cider, you must always specify a folder, either as an argument of a user command or by calling `]APLGit2.SetDefaultProject`. 

Note that `APLGit2` works only **locally**. It does **not** accept a URL pointing to GitHub.


## Installation

APLGit2 can be installed as a Tatin package:

```
]Tatin.InstallPackages [tatin]aplgit2 [MyUCMDs]
```

This will make the user commands of `APLGit2` available, but it will not establish the API. However, executing any of its user commands will force `APLGit2` to load the API into `⎕SE`. For that, executing `]APLGIT2.Version` will do.

If you want the API to be available right from the start then please consult the article [Dyalog User Commands](https://aplwiki.com/wiki/Dyalog_User_Commands "Link to the APL wiki").


## Commands and API functions

User commands start with an `]`, API function don't.

```
 ]Add                    Execute the Git "Add" commands with the -A flag on "."
 ]AddGitIgnore           Adds a file `.gitignore` to a path with defaults useful for APLers
 ]ChangeLog              Takes an APL name and lists all commits the object was part of          
 ]Commit                 Performs a commit on the current branch                                
 ]CompareCommits         Takes two hashes and compares all changes between them
 ]Diff                   Returns files in the working directory that are different from HEAD
  EstablishProject       Works out the project to act on
 ]GetDefaultProject      Returns the default project, if any
  GetPathFromProjec      Get the path on disk where the project specified lived
  GetProjectFromPath     Get the path in the workspace from the disk path of a project
 ]GetDefaultProject      Returns namespace and folder of the current default project, if any     
 ]GetTagOfLatestRelease  Returns the tag of the latest release
 ]Init                   Initialises project with Git, including .gitignore & .gitattributes
 ]IsDirty                Are there any uncommited changes?
 ]IsGitProject           Returns "yes" or "no" depending on whether there is a ./.git folder    
  IsGitInstalled         Checks whether Git is installed and retuns 1 in case it is
 ]ListBranches           Lists all branches for a Git-managed project                            
 ]Log                    Returns the log of commits.\\
  Methods                Like `Public` plus comment in first line
 ]NoOfUntrackedFiles     Returns the number of untracked files in a project or folder
 ]OpenGitShell           Opens a Git shell for a Git-managed project                             
 ]RefLog                 Prints a log of all references to the session
 ]SetDefaultProject      Specifies the project to be used in case no project is specified   
 ]Squash                 Squashes some commits; The user will be questioned which ones
 ]Status                 Reports all untracked files and/or all uncommitted changes
 ]Version                APLGit2's version: returns name, version number & version date
```

Note that `CurrentBranch` is available as an API function but not as a user command. This is because internally it is often needed, but there is hardly any need for a user command, in particular because the command `]ListBranches` and `]Status` both report the current branch anyway.


