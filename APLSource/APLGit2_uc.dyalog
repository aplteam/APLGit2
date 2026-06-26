:Class APLGit2_uc
⍝ User Command class for "APLGit2"
⍝ Kai Jaeger

    ⎕IO←1 ⋄ ⎕ML←1

    ∇ r←List;c;⎕TRAP;MinimumVersionOfDyalog;AtLeastVersion
      :Access Shared Public
      AtLeastVersion←{⊃⍵≤{⊃⊃(//)⎕VFI ⍵/⍨2>+\⍵='.'}2⊃'.'⎕WG'aplversion'}
     
   ⍝ Everything between "⍝ >>>>> Start*" and "⍝ >>>>> End*" is injected as part of
   ⍝ the build process of the package - don't edit this!
      ⍝ >>>>> StartListInject
MinimumVersionOfDyalog←'18.0'
 r←⍬
     ⍝ _Project is 1 for commands that allow specifying the project as argument
     ⍝ (APLGit2 commands that do not allow this often allow -projects=)
 :If AtLeastVersion⊃(//)⎕VFI MinimumVersionOfDyalog
     c←⎕NS''
     c.Name←'Add'
     c.Desc←'Executes the git "Add" command'
     c.Group←'APLGit2'
     c.Parse←'1 -project='
     c._Project←0
     r,←c

     c←⎕NS''
     c.Name←'AddGitIgnore'
     c.Desc←'Create a file .gitignore, or merge default values with an existing one'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←0
     r,←c

     c←⎕NS''
     c.Name←'ListBranches'
     c.Desc←'Lists all branches for a Git-managed project'
     c.Group←'APLGit2'
     c.Parse←'1s -a -r'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'ChangeLog'
     c.Desc←'Takes an APL name and list all commits the object was part of'
     c.Group←'APLGit2'
     c.Parse←'1 -project='
     c._Project←0
     r,←c

     c←⎕NS''
     c.Name←'Commit'
     c.Desc←'Performs a commit on the current branch'
     c.Group←'APLGit2'
     c.Parse←'1s -m= -add -amend'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'CompareCommits'
     c.Desc←'Compares two different commits'
     c.Group←'APLGit2'
     c.Parse←'2s -project= -use= -files'
     c._Project←0
     r,←c

     c←⎕NS''
     c.Name←'Diff'
     c.Desc←'Produces a list with changed/deleted/added files by comparing the working directory with HEAD'
     c.Group←'APLGit2'
     c.Parse←'1s -verbose'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'GetLastCommit'
     c.Desc←'Returns the latest hash for the current (or the given) branch'
     c.Group←'APLGit2'
     c.Parse←'1s -full -branch='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'GetTagOfLatestRelease'
     c.Desc←'Returns the tag of the latest release'
     c.Group←'APLGit2'
     c.Parse←'1s -verbose -username='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'Init'
     c.Desc←'Initialises a folder for managing it by Git'
     c.Group←'APLGit2'
     c.Parse←'1s -quiet'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'IsDirty'
     c.Desc←'Reports whether there are uncommited changes'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'IsGitProject'
     c.Desc←'Returns "yes" or "no" depending on whether there is a ./.git folder'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'Log'
     c.Desc←'Shows the commit logs'
     c.Group←'APLGit2'
     c.Parse←'2s -verbose -name= -commit='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'NoOfUntrackedFiles'
     c.Desc←'Returns the number of untracked files'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'OpenGitShell'
     c.Desc←'Opens a Git shell for a Git managed project'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'RefLog'
     c.Desc←'List reference log entries (RefLogs)'
     c.Group←'APLGit2'
     c.Parse←'1s -max= -all -branch= -project='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'Repack'
     c.Desc←'Cleans up and optimise Git''s internal storage by consolidating loose objects into packfiles'
     c.Group←'APLGit2'
     c.Parse←'1s -window= -depth='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'Squash'
     c.Desc←'Squashes some commits in the current branch into a single one'
     c.Group←'APLGit2'
     c.Parse←'2s -m='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashList'
     c.Desc←'List all stashes, if any'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashShow'
     c.Desc←'Shows all files of a stash (default is the last one)'
     c.Group←'APLGit2'
     c.Parse←'1s -n= -p'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashPush'
     c.Desc←'Save your local modifications to a new stash entry and roll them back to HEAD (in the working tree and in the index)'
     c.Group←'APLGit2'
     c.Parse←'999s -m= -u'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashPop'
     c.Desc←'Apply a stash to the working area & remove from stash stack, by default the last one'
     c.Group←'APLGit2'
     c.Parse←'1s -n='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashApply'
     c.Desc←'(Re)-apply stash (by default the last one) to the working area & DO NOT remove from stash stack'
     c.Group←'APLGit2'
     c.Parse←'1s -n='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashClear'
     c.Desc←'Delete all stashes'
     c.Group←'APLGit2'
     c.Parse←'1s'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'StashDrop'
     c.Desc←'Drop latest or given stash'
     c.Group←'APLGit2'
     c.Parse←'1s -n='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'Status'
     c.Desc←'Reports all untracked files and/or all uncommitted changes'
     c.Group←'APLGit2'
     c.Parse←'1s -verbose -view -APLnames'
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'ShowLastVersionInIndex'
     c.Desc←'Returns the last version of an APL object or a file in the index'
     c.Group←'APLGit2'
     c.Parse←'1 -project='
     c._Project←1
     r,←c

     c←⎕NS''
     c.Name←'Version'
     c.Desc←'Returns name, version number and version date as a three-element vector'
     c.Group←'APLGit2'
     c.Parse←''
     c._Project←0
     r,←c
 :EndIf
   ⍝ >>>>> EndListInject
    ∇

    ∇ r←Run(Cmd Args);folder;G;space;ns;noProjectSelected;func;list;ind
      :Access Shared Public
      :If 0=⎕SE.⎕NC'APLGit2'
          {}⎕SE.Tatin.LoadDependencies(⊃⎕NPARTS ##.SourceFile)'⎕SE'
      :EndIf
      G←GetRefToAPLGit2 ⍬
      :If (⊂⎕C Cmd)∊⎕C'Log' 'Squash'
          :If 0≢Args._1
          :AndIf ~⊃⊃⎕VFI Args._1~'-'  ⍝ Neither a positive integer nor "yyyy-mm-dd"
              (r space folder)←G.##.UC.GetSpaceAndFolder Cmd Args
          :Else
              ns←⎕NS''
              ns._1←0
              (r space folder)←G.##.UC.GetSpaceAndFolder Cmd ns
          :EndIf
      :Else
          :If (⊂⎕C Cmd)∊⎕C'AddGitIgnore' 'Add'
          :AndIf ∨/'/\'∊Args._1
              folder←Args._1
              space←''
          :Else
              (r space folder)←G.##.UC.GetSpaceAndFolder Cmd Args
              :If 'stashpush'≡⎕C Cmd
                  :If 0<≢list←G.##.Status folder
                      list←('D'≠list[;2])⌿list        ⍝ We cannot stash anything deleted from the work tree
                      :If 0=≢''Args.Switch'u'
                          list←('?'≠list[;1])⌿list    ⍝ Remove untracked
                      :EndIf
                      :If 0=≢list
                          r←'No changes found you could stash' ⋄ →0
                      :Else
                          :If (,'?')≡,Args._2
                              ind←'SelectForStash@Select what to stash:' 1 G.##.CommTools.Select list[;3]
                              :If 0=≢ind
                                  r←'Cancelled by user' ⋄ →0
                              :Else
                                  Args._2←list←list[ind;2]
                              :EndIf
                          :Else
                              Args._2←list←list[;3]
                          :EndIf
                      :EndIf
                  :Else
                      r←'No changes found you could stash' ⋄ →0
                  :EndIf
              :EndIf
          :EndIf
      :EndIf
      :If (⊂⎕C Cmd)∊'setdefaultproject' 'getdefaultproject' 'version'
      :OrIf ~noProjectSelected←∧/space folder∊''⍬
          func←G.##.UC⍎Cmd
          r←func space folder Args
      :EndIf
    ⍝Done
    ∇

    ∇ r←level Help cmd;ref
      :Access Shared Public
      r←0⍴⊂''
      :If 9=⎕NC'⎕SE.APLGit2'
          ref←GetRefToAPLGit2''
          :If 3=ref.##.⎕NC'UC.Help'
              r←level ref.##.UC.Help cmd
          :Else
              PrintError''
          :EndIf
      :Else
          ⎕←'APLGit2 not found'
      :EndIf
    ∇

    ∇ ref←GetRefToAPLGit2 dummy
      :If 9=#.⎕NC'APLGit2.APLGit2'
      :AndIf 0<⎕SE.APLGit2.⎕NC'DEVELOPMENT'
      :AndIf ⎕SE.APLGit2.DEVELOPMENT
          ref←#.APLGit2.APLGit2.API
      :Else
          ref←⎕SE.APLGit2
      :EndIf
    ∇

    ∇ PrintError dummy;msg
      msg←''
      :If 3=⎕NC'⎕SE.APLGit2.Version'
          msg←' APLGit2 is not installed correctly. Please remove and install again.'
      :EndIf
      ⎕←msg
    ∇

:EndClass
