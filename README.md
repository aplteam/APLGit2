# APLGit2


## Overview

`APLGit2` comes with a small set of functions designed to support the APL programmer while working on projects that are managed by Git. 

## Philosophy

Experience tells that trying to support all sorts of Git commands from within APL is a recipe for trouble. For example, the Git command "checkout" should not be performed from within an APL session. 

More complex stuff like `Merge`, `Push` and `Pull` can easily run into a problem without the user doing anything wrong, and when you are then stuck in the middle of something within the call that executed a Git command, well, good luck.

For that reason `APLGit2` offers only a pretty limited number of commands that are useful from within APL while working on a project. For anything else we suggest to use GitBash. `APLGit2` makes this easy because `]APLGit2.OpenGitShell` opens a Git Bash within the current project (if there is just one open) or in the specified/selected project.

As a result most of the commands just provide information about the given project, or an object within that project.

Noticeable exceptions are the methods `Add` and `Commit`. Note that you can execute `Add` implicitly when executing `Commit`; see there.

All functions are also available via an API which lives in `⎕SE.APLGit2`. However, the API calls are more basic. 

For example, the  `Commit` API function just does that: executing `git commit`. The user command on the other hand first checks whether the project is currently dirty, and if it is it asks the user whether `git add .` should be executed first. Also, it opens an edit window for the user to create a message in case the `-m=` option was not set.

## Installation

Download a release and put the contents of the ZIP file into one of the folders Dyalog APL scans for user commands.

For details refer to the Dyalog User Commands User Guide.

## Methods

```
 Add                    Execute the Git "Add" commands                                         
 AddGitIgnore           Adds a file `.gitignore` to a path with defaults useful for APLers
 ChangeLog              Takes an APL name and list all commits the object was part of          
 Commit                 Performs a commit on the current branch                                
 CompareCommits         Takes two hashes and compares all changes between them
 CurrentBranch          Returns the name of the current branch            
 Diff                   Returns files in the working directory that are different from HEAD
 EstablishProjects      Works out (or asks the user) in order to establish the project to act on
 GetDefaultProject      Returns namespace and folder of the current default project, if any     
 GetPathFromProject     Takes a project (namespace or alias) and returns its path on disk
 GetProjectFromPath     Take a project path and returns the project's name
 GoToGitHub             For a project "Foo/Goo" this opens https://github.com/Foo/Goo
 Init                   Initialize a project for being managed by Git, including `.gitignore` & `.gitattributes`
 IsDirty                Reports whether there are uncommitted changes and/or untracked files
 IsGitInstalled         Check whether the Git bash is installed and returns a Boolean
 IsGitProject           Returns "yes" or "no" depending on whether there is a ./.git folder    
 ListBranches           Lists all branches for a Git-managed project                            
 Log                    Returns the log of commits.\\
 OpenGitShell           Opens a Git shell for a Git managed project                             
 RefLog                 Prints a log of all references to the session
 SetDefaultProject      Specifies the project to be used in case no project is specified   
 Squash                 Squashes some commits; The user will be question which ones
 Status                 Reports all untracked files and/or all uncommitted changes
 Version                Returns name, version number & version date as a three-element vector
```

## Preconditions and assumptions

* The Git bash must be installed, and available on the environment variable `%PATH%`
* `]APLGit2.GoToGitHub` requires you to host your project on GitHub, but all other commands are agnostic in this respect

Note that `]APLGit2.*` works particularly well in conjunction with [Cider](https://github.com/aplteam/Cider), though this is not a requirement. 

However, with a project that is not managed by Cider you must always specify a folder, either as argument of a user command or by calling `]APLGit2.SetDefaultProject`. 

`APLGit2` works only **locally**, it does **not** accept a URL pointing to GitHub.
