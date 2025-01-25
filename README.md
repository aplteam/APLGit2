# APLGit2

## Overview

`APLGit2` includes a concise set of user commands and functions to assist APL programmers in managing Git projects effectively.

`APLGit2` runs on Windows, Linux, and macOS.

## Philosophy

Experience shows that attempting to support all Git commands within APL often leads to complications.  

For example, the Git command `checkout` should not be performed within an APL session.  

More complex operations like `Merge`, `Push`, and `Pull` can encounter issues even when executed correctly. When they do, you may find yourself stuck mid-operation, unsure of the progress made.

Therefore, `APLGit2` offers only a limited number of useful commands from within APL for project management. For anything else, we recommend using Git Bash. `APLGit2` simplifies this process by providing the command `]APLGit2.OpenGitShell`, which opens a Git Bash session in the current project (if there is only one open) or in a specified/selected project.

Consequently, most commands focus on providing information about the project or its components.

Noticeable exceptions are the methods `Add` and `Commit`. Note that `Add` can be executed implicitly when performing `Commit`; see the relevant section for details.

~~We strongly recommend using the Git Bash for anything beyond that.~~  
We strongly advise using Git Bash for anything beyond these basic commands. This approach offers two key benefits:

1. Most online Git resources and examples focus on Git Bash.
2. For exceptional problems or tasks, Git Bash is indispensable, so familiarising yourself with it is advantageous.

## API

All functions are also available via an API, located in `⎕SE.APLGit2`. However, the API calls are more basic.  

For instance, the `Commit` API function solely executes `git commit`.  

In contrast, the corresponding user command checks if the project has uncommitted changes and prompts the user to run `git add .` first. It also opens an editor for composing a commit message if the `-m=` option is omitted.

## Preconditions

* Git Bash must be installed and accessible via the `%PATH%` environment variable.
* The Git configuration parameters `user.name` and `user.email` must be set.

One function, `GetTagOfLatestRelease`, requires hosting your project on GitHub.  

All other commands work independently of the hosting platform.

## APLGit2 and Cider

`]APLGit2.*` works particularly well with [Cider](https://github.com/aplteam/Cider "Link to Cider on GitHub"), though this is not mandatory.  

* If a single Cider project is open, APLGit2 will act on that project if no folder is specified.
* If multiple Cider projects are open, the user is prompted to choose which project to act on.
For projects not managed by Cider, you must specify a folder as a user command argument.

Note that `APLGit2` works only **locally** and does **not** accept URLs pointing to GitHub.

## Installation

APLGit2 can be installed as a Tatin package:



```
]Tatin.InstallPackages [tatin]aplgit2 [MyUCMDs]
```

This command makes `APLGit2` user commands available but does not load the API.  

Running any `APLGit2` user command automatically loads the API into `⎕SE`. For example, executing `]APLGIT2.Version` will accomplish this.

If you want the API to be available from the start, refer to the article [Dyalog User Commands](https://aplwiki.com/wiki/Dyalog_User_Commands "Link to the APL wiki").

## Commands and API functions

User commands start with `]`, while API functions do not.


```
 ]Add                    Execute the Git "Add" commands with the -A flag on "."
 ]AddGitIgnore           Adds a file `.gitignore` to a path with defaults useful for APLers
 ]ChangeLog              Takes an APL name and lists all commits the object was part of          
 ]Commit                 Performs a commit on the current branch                                
 ]CompareCommits         Takes two hashes and compares all changes between them
 ]Diff                   Returns files in the working directory that are different from HEAD
  EstablishProject       Works out the project to act on
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
 ]Squash                 Squashes some commits; The user will be questioned which ones
 ]Status                 Reports all untracked files and/or all uncommitted changes
 ]Version                APLGit2's version: returns name, version number & version date
```


Note that `CurrentBranch` is provided as an API function but not as a user command.  

This is because it is frequently used internally, and user commands like `]ListBranches` and `]Status` already display the current branch.

