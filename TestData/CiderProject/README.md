# APLTreeUtils2

General utilities required by most members of the APLTree library.

**Note:** `APLTreeUtils2` releases are published as [Tatin](https://tatin.dev "Link to the principal Tatin Registry") packages, see there.

## Overview

Many classes of the APLTree project did `:Include` the namespace script `APLTreeUtils`, and all applications of the APL-cation projects used to call functions in it.

Over the years it turned out that the `:Include` technique has severe drawbacks. With the introduction of Tatin all APLTree members needed to be modified so that they can be packages. Because Tatin requires at least Dyalog 18.0 it was decided to take the opportunity and replace the namespace script `APLTreeUtils` by a class `APLTreeUtils2`.

For all APLTree members a new version (with a bumped major version number) needs to be created anyway at this point (2020-09), so it's a good opportunity to also address the problems caused by `Include`ing the `APLTreeUtils` namespace script at the same time.

But there are more changes under the hood: several functions have been removed for a variety of reasons, and others have been added, and some were renamed.


## Pros and Cons of `:Include`

Attractive as it seemed to be, including namespaces into practically all (at least at the time) members of the APLTree library came with a severe disadvantage: once people started using it it was practically impossible to add additional functions because of the possibility of name clashes.

Another problem was that occasionally the values of `⎕IO` and `⎕ML` seemed to have leaked out from functions in `APLTreeUtils`. Though clearly a Dyalog bug that should get fixed, to this day it's not clear whether the bug has really disappeared, despite several attempts. So it seems better to avoid the problem from the start.


## Removed Functions

* `ReadUtf8File` and `WriteUtf8File` have been removed. Use `FilesAndDirs.(NGET NPUT)` instead, or the native functions `⎕NGET` and `⎕NPUT`

* `IsUnicode`: we've stopped supporting non-Unicode versions of Dyalog a long time ago

* `Where` can be replaced by the `⍸` primitive in 18.0

* `Nest` can be replaced by the `⊆` primitive in 18.0

* `FindPathTo`; with Tatin there is no need for this anymore


## List of all Functions

* `Assert`
* `AtLeastVersion`
* `Base64`        
* `Create_UUID`
* `DLB`
* `DMB`
* `DTB`
* `FormatDateTime`
* `GetOperatingSystem`
* `GoToWebPage`
* `IsChar`
* `IsDevelopment`
* `IsRunningAsAdmin`
* `IsScripted`
* `Last`
* `Lowercase`
* `Split`
* `SplitPath`
* `ToNum`
* `Uppercase`
* `Version`

For details execute `]ADOC APLTreeUtils2`

## Renamed functions

* `dtb`, `dlb` and `dmb` were renamed to `DTB`, `DLB` and `DMB`


## Compatability tradeoff

* In 18.0 we've got `⎕C`, but `Uppercase` and `Lowercase` still exist, though they call `⎕C` under the hood.
