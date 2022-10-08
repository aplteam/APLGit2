:Class APLGit2_uc
⍝ User Command class for "APLGit2"
⍝ Kai Jaeger
⍝ Version 0.2.1 ⋄ 2022-09-21

    ⎕IO←1 ⋄ ⎕ML←1
    MinimumVersionOfDyalog←'18.0'
    _errno←811

    ∇ r←List;c ⍝ this function usually returns 1 or more namespaces (here only 1)
      :Access Shared Public
      r←⍬
      :If AtLeastVersion⊃(//)⎕VFI MinimumVersionOfDyalog
     
          c←⎕NS''
          c.Name←'Add'
          c.Desc←'Executes the git "Add" commands'
          c.Group←'APLGit2'
          c.Parse←'1 -project='
          c._Project←0
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
          c.Parse←'1s -m= -add'
          c._Project←1
          r,←c
     
          c←⎕NS''
          c.Name←'CompareCommits'
          c.Desc←'Compares two different commits'
          c.Group←'APLGit2'
          c.Parse←'2s -project= -use= -view'
          c._Project←0
          r,←c
     
          c←⎕NS''
          c.Name←'CurrentBranch'
          c.Desc←'Returns the name of the current branch'
          c.Group←'APLGit2'
          c.Parse←'1s'
          c._Project←1
          r,←c
     
          c←⎕NS''
          c.Name←'Diff'
          c.Desc←'Compares the working directory with HEAD'
          c.Group←'APLGit2'
          c.Parse←'1s -verbose'
          c._Project←1
          r,←c
     
          c←⎕NS''
          c.Name←'GetDefaultProject'
          c.Desc←'Returns namespace and folder of the current default project, if any'
          c.Group←'APLGit2'
          c.Parse←'0'
          c._Project←0
          r,←c
     
          c←⎕NS''
          c.Name←'GoToGitHub'
          c.Desc←'For a project "Foo/Goo" this opens https://github.com/Foo/Goo'
          c.Group←'APLGit2'
          c.Parse←'1s'
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
          c.Desc←'Reports whether there are uncommited changes and/or untracked files'
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
          c.Name←'ListBranches'
          c.Desc←'Lists all branches for a Git-managed project'
          c.Group←'APLGit2'
          c.Parse←'1s -a -r'
          c._Project←1
          r,←c
     
          c←⎕NS''
          c.Name←'Log'
          c.Desc←'Shows the commit logs'
          c.Group←'APLGit2'
          c.Parse←'1s -since= -verbose -max='
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
          c.Name←'SetDefaultProject'
          c.Desc←'Specifies the project to be used in case no project is specified'
          c.Group←'APLGit2'
          c.Parse←'1s'
          c._Project←1
          r,←c
     
          c←⎕NS''
          c.Name←'Squash'
          c.Desc←'Squashes some commits in the current branch into a single one'
          c.Group←'APLGit2'
          c.Parse←'1s -m='
          c._Project←1
          r,←c
     
          c←⎕NS''
          c.Name←'Status'
          c.Desc←'Reports all untracked files and/or all uncommitted changes'
          c.Group←'APLGit2'
          c.Parse←'1s -short'
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
    ∇

    ∇ r←Run(Cmd Args);folder;G;space
      :Access Shared Public
      G←LoadCode ⍬
      (r space folder)←GetSpaceAndFolder Cmd Args
      :If 0=≢r
          :Select ⎕C Cmd
          :Case ⎕C'Add'
              r←Add space folder Args
          :Case ⎕C'ChangeLog'
              r←ChangeLog space folder Args
          :Case ⎕C'Commit'
              r←Commit space folder Args
          :Case ⎕C'CompareCommits'
              r←CompareCommits space folder Args
          :Case ⎕C'CurrentBranch'
              r←CurrentBranch space folder Args
          :Case ⎕C'Diff'
              r←Diff space folder Args
          :Case ⎕C'GetDefaultProject'
              r←GetDefaultProject ⍬
          :Case ⎕C'GoToGitHub'
              :If 0=⎕NC'space'
              :OrIf 0=≢space
                  r←GoToGitHub Args
              :Else
                  r←space GoToGitHub Args
              :EndIf
          :Case ⎕C'Init'
              r←Init space folder Args
          :Case ⎕C'IsDirty'
              r←IsDirty space folder Args
          :Case ⎕C'IsGitProject'
              r←IsGitProject space folder Args
          :Case ⎕C'ListBranches'
              r←ListBranches space folder Args
          :Case ⎕C'Log'
              r←Log space folder Args
          :Case ⎕C'OpenGitShell'
              r←OpenGitShell space folder Args
          :Case ⎕C'RefLog'
              r←RefLog space folder Args
          :Case ⎕C'SetDefaultProject'
              r←G.SetDefaultProject{⍵/⍨0≠⍵}Args._1
          :Case ⎕C'Squash'
              r←⍪Squash space folder Args.m
          :Case ⎕C'Status'
              r←⍪Status space folder Args
          :Case ⎕C'Version'
              r←⊃{⍺,' from ',⍵}/1↓⎕SE._APLGit2.APLSource.Version
          :Else
              ∘∘∘ ⍝ Huh?!
          :EndSelect
      :EndIf
    ∇

    ∇ r←Log(space folder args);parms
      parms←⎕NS''
      parms.verbose←args.verbose
      parms.since←{0≡⍵:'' ⋄ ⍵}args.since
      :If 0≡args.max
          args.max←¯1
      :EndIf
      parms.max←args.max
      r←parms G.Log folder
    ∇

    ∇ {(filename1 filename2)}←CompareCommits(space folder args);hash1;hash2;flag;exe;parms;qdmx;name
      (hash1 hash2)←{0≡⍵:'' ⋄ ⍵}¨args.(_1 _2)
      (filename1 filename2)←folder G.CompareCommits hash1 hash2
      :If 0<+/⎕NEXISTS filename1 filename2
      :AndIf (args.view)∨{((,0)≢,⍵)∧0<≢⍵}args.use
          :If flag←9=⎕SE.⎕NC'CompareFiles'
              :Trap 911
                  (exe name)←⎕SE.CompareFiles.EstablishCompareEXE{(,0)≡,⍵:'' ⋄ ⍵}args.use
              :Else
                  qdmx←⎕DMX
                  ⎕←'Comparison with ]CompareFiles crashed'{0=≢⍵:⍺ ⋄ ⍺,' with "',⍵,'"'}qdmx.EM
                  :Return
              :EndTrap
          :AndIf 0<≢exe
              parms←⎕SE.CompareFiles.ComparisonTools.⍎'CreateParmsFor',name
              parms.(file1 file2)←filename1 filename2
              parms.(use name)←exe name
              parms.(caption1 caption2)←hash1 hash2
              {}⎕SE.CompareFiles.Compare parms
              ⎕NDELETE filename1 filename2
              (filename1 filename2)←⊂''
          :EndIf
      :EndIf
    ∇

    ∇ (r space folder)←GetSpaceAndFolder(Cmd Args)
      r←0 0⍴'' ⋄ space←folder←''
      :If ~(⊂Cmd)∊'GetDefaultProject' 'SetDefaultProject' 'Version'
          :If ({⍵⊃⍨⍸⍵.Name≡¨⊂Cmd}List)._Project
          :AndIf 0≢Args._1
              (space folder)←GetSpaceAndFolder_ Args._1
              ('Project <',Args._1,'> not found on disk')Assert 0<≢folder
          :ElseIf 2=Args.⎕NC'project'
          :AndIf (,0)≢,Args.project
          :AndIf 0<≢Args.project
              (space folder)←GetSpaceAndFolder_ Args.project
          :Else
              (space folder)←G.EstablishProject''
          :EndIf
          :If 0=≢space,folder
              :If (⊂Cmd)∊'OpenGitShell' ''
              :AndIf ⎕NEXISTS'./.git'
                  folder←'./'
              :Else
                  r←'No project provided/selected'
              :EndIf
          :ElseIf ~(⊂Cmd)∊'GoToGitHub' ''
              ('<',folder,'> not found on disk')Assert ⎕NEXISTS folder
          :EndIf
      :EndIf
    ∇

    ∇ r←GetDefaultProject dummy
      r←G.GetDefaultProject dummy
    ∇

    ∇ r←Diff(space folder args);filter
      r←⍪args.verbose G.Diff folder
    ∇

    ∇ r←Add(space folder args);filter
      'Not a URL on GitHub'Assert 0<≢args._1
      filter←args._1
      'Invalid filter'Assert 0<≢filter
      {}filter G.Add folder
      r←0 0⍴''
    ∇

    ∇ r←{space}GoToGitHub args
      'Not a URL on GitHub'Assert 0<≢args._1
      :If 0=⎕NC'space'
          r←⎕SE.APLGit2.GoToGitHub args._1
      :Else
          r←⎕SE.APLGit2.GoToGitHub space
      :EndIf
    ∇

    ∇ r←ChangeLog(space folder args);msg;name;⎕TRAP
      name←args._1
      :If ~(⊃name)∊'#⎕'
          ⎕TRAP←0 'S'
          ∘∘∘
      :EndIf
      ('Not an APL object: ',name)Assert 0<⎕NC name
      r←folder ⎕SE.APLGit2.ChangeLog name
    ∇

    ∇ r←GoToGithub(space folder args);msg
      r←⎕SE.APLGit2.GoToGithub folder msg
    ∇

    ∇ r←Init(space folder args)
      'This folder is already managed by Git'Assert~⎕SE.APLGit2.IsGitProject folder
      :If args.quiet
      :OrIf YesOrNo'Sure that you want to make ',folder,' a Git-managed folder?'
          r←args.quiet ⎕SE.APLGit2.Init folder
      :EndIf
    ∇

    ∇ r←IsDirty(space folder args)
      r←⎕SE.APLGit2.IsDirty folder
      r←(r+1)⊃'Clean' 'Dirty'
    ∇

    ∇ r←IsGitProject(space folder args)
      r←(1+⎕SE.APLGit2.IsGitProject folder)⊃'no' 'yes'
    ∇

    ∇ r←OpenGitShell(space folder args)
      r←⎕SE.APLGit2.OpenGitShell folder
    ∇

    ∇ r←RefLog(space folder args);branch;value;flag
      :If (,0)≡args.branch
          branch←''
      :Else
          branch←args.branch
      :EndIf
      :If (,0)≡,args.max
          r←folder ⎕SE.APLGit2.RefLog~args.all
      :Else
          r←folder ⎕SE.APLGit2.RefLog 0
          (flag value)←⎕VFI args.max
          '"max" must be a positive integer'Assert flag
          r←value↑r
      :EndIf
    ∇

    ∇ r←CurrentBranch(space folder args)
      r←⎕SE.APLGit2.CurrentBranch folder
    ∇

    ∇ r←Commit(space folder args);msg;ref;branch;rc;data;flag
      branch←⎕SE.APLGit2.CurrentBranch folder
      :If ⎕SE.APLGit2.IsDirty folder ⍝ 0<'?'+.=⊃∘∪¨2↑¨1 ⎕SE.Git.Status folder
          :If 1=args.add
          :OrIf 1 YesOrNo'Branch "',branch,'" is dirty - shall Git''s "Add ." command be executed?'
              (rc msg data)←folder ⎕SE.APLGit2.##.U.RunGitCommand'add .'
              msg Assert 0=rc
          :Else
              r←'Cancelled by user'
              :Return
          :EndIf
      :EndIf
      :If ⎕SE.APLGit2.IsDirty folder
          :If (,0)≢,Args.m
          :AndIf 0<≢Args.m
              msg←Args.m
              :If (⊂branch)∊'main' 'master'
                  ('You MUST specify a message for ',branch)Assert 0<≢msg~'.'
              :EndIf
          :Else
              flag←0
              :Repeat
                  ref←⎕NS''
                  ref.msg←'' ''
                  ref.⎕ED'msg'
                  msg←ref.msg{⍺/⍨~(⌽∧\0=⌽⍵)∨(∧\0=⍵)}≢¨ref.msg
                  :If (⊂branch)∊'main' 'master'
                  :AndIf 0=≢(∊msg)~'.'
                      :If 0=1 YesOrNo'You MUST specify a meaningful message for "',branch,'"; try again (no=cancel) ?'
                          r←'Commit cancelled by user'
                          :Return
                      :EndIf
                  :ElseIf YesOrNo'Sure you don''t want to provide a message? ("No" cancells the whole operation)'
                      flag←1
                  :Else
                      r←'Operation cancelled by user'
                      :Return
                  :EndIf
                  msg←{0=≢⍵:'...' ⋄ ⍵}msg
                  msg←1↓∊(⎕UCS 10),¨msg
              :Until flag
          :EndIf
          r←⍪msg ⎕SE.APLGit2.Commit folder
      :Else
          r←'Nothing to commit, is clean'
      :EndIf
    ∇

    ∇ r←Status(space folder args);short
      short←Args.Switch'short'
      r←short G.Status folder
    ∇

    ∇ r←Squash(space folder msg)
      r←folder G.Squash{0≡⍵:'' ⋄ ⍵}msg
    ∇

    ∇ r←ListBranches(space folder args);parms
      :If (,0)≢,args.a
          parms←'-a'
      :ElseIf (,0)≢,args.r
          parms←'-r'
      :Else
          parms←''
      :EndIf
      r←⍪parms G.ListBranches folder
    ∇

    ∇ r←level Help Cmd;ref;⎕TRAP
      :Access Shared Public
      r←''
      :Select level
      :Case 0
          :Select ⎕C Cmd
          :Case ⎕C'Add'
              r,←⊂']APLGit2.add <filter> -project='
          :Case ⎕C'ChangeLog <apl-name> -project='
              r,←⊂']APLGit2.ChangeLog <filter> -project='
          :Case ⎕C'Commit'
              r,←⊂']APLGit2.Commit [space|folder] -m= -add'
          :Case ⎕C'CompareCommits'
              r,←⊂']APLGit2.CompareCommits [hash1] [hash2] -project= -use=[name|?] -view'
          :Case ⎕C'CurrentBranch'
              r,←⊂']APLGit2.CurrenBranch [space|folder]'
          :Case ⎕C'Diff'
              r,←⊂']APLGit2.Diff [space|folder] -verbose'
          :Case ⎕C'GetDefaultProject'
              r,←⊂']GetDefaultProject'
          :Case ⎕C'GoToGitHub'
              r,←⊂']APLGit2.OpenGitHub [space|folder|<group>/<project-name>|[alias]]'
          :Case ⎕C'Init'
              r,←⊂']APLGit2.Init [folder] -quiet'
          :Case ⎕C'IsDirty'
              r,←⊂']APLGit2.IsDirty [space|folder]'
          :Case ⎕C'IsGitProject'
              r,←⊂']APLGit2.IsGitProject [space|folder]'
          :Case ⎕C'ListBranches'
              r,←⊂']APLGit2.ListBranches [space|folder] -a -r'
          :Case ⎕C'Log'
              r,←⊂']APLGit2.Log [space|folder] -since= -verbose -max='
          :Case ⎕C'OpenGitShell'
              r,←⊂']APLGit2.OpenGitShell [space|folder]'
          :Case ⎕C'RefLog'
              r,←⊂']APLGit2.RefLog [space|folder] -max= -all -branch= -project='
          :Case ⎕C'SetDefaultProject'
              r,←⊂']APLGit2.SetDefaultProject [space|folder]'
          :Case ⎕C'Status'
              r,←⊂']APLGit2.Status -short -path='
          :Case ⎕C'Squash'
              r,←⊂']APLGit2.Squash [space|folder] -m=<message>'
          :Else
              r,←⊂'There is no help available'
          :EndSelect
          :If 'Version'≢Cmd
              r,←''(']APLGit2.',Cmd,' -?? ⍝ Enter this for more information ')
          :EndIf
     
      :Case 1
          :Select ⎕C Cmd
          :Case ⎕C'Add'
              ⎕TRAP←0 'S'
              r,←⊂'Add files to the index.'
              r,←⊂''
              r,←⊂'You may specify one of:'
              r,←⊂' * A file'
              r,←⊂' * A folder'
              r,←⊂' * A "." (dot), meaning that all so far untracked files should be added'
              r,←⊂''
              r,←AddLevel3HelpInfo'Add'
          :Case ⎕C'ChangeLog'
              r,←⊂'Takes an APL name and returns a matrix with zero or more rows and 4 columns with'
              r,←⊂'information regarding all commits the given APL object was changed:'
              r,←⊂' 1. Hash'
              r,←⊂' 2. Commiter''s name'
              r,←⊂' 3. Date of the commit date in strict ISO 8601 format'
              r,←⊂' 4. Message of the commit'
          :Case ⎕C'Commit'
              r,←⊂'Record changes to the repository.'
              r,←⊂'The branch should not be dirty (see ]APLGit2.IsDirty) but if it is anyway the user will be'
              r,←⊂'asked whether she wants to add all files first.'
              r,←⊂''
              r,←⊂'-add When the project is dirty then without the -add flag the user will be questioned'
              r,←⊂'     whether a "git add ." command should be issued first. -add tells the user command'
              r,←⊂'     to do that in any case, without questioning the user.'
              r,←⊂''
              r,←⊂'-m=  If this is specified it is accepted as the message.'
              r,←⊂'     If it is not specified then the command will open an edit window for the message.'
              r,←⊂''
              r,←⊂'Note that a message is required for main (or the now deprecated master) branch but might'
              r,←⊂'be empty for other branches. Empty messages will become "...".'
              r,←⊂''
              r,←AddLevel3HelpInfo'Commit'
          :Case ⎕C'CompareCommits'
              r,←⊂'Compare changes between two commits.'
              r,←⊂''
              r,←⊂'You may specify none, one or two hashes as argument:'
              r,←⊂' * No argument means "compare last commit with checkout commit of current branch'
              r,←⊂' * One argument means "compare that commit with the latest one"'
              r,←⊂' * Two arguments mean "compare those commits with each other"'
              r,←⊂'By default two filenames are returned that can be fed into a comparison tool.'
              r,←⊂'Those files will be created in the temp folder of the current OS.'
              r,←⊂''
              r,←⊂'-view   If the user command ]CompareFiles is available you may use this in order'
              r,←⊂'        to compare those two files straight away.'
              r,←⊂'-use=   If the user command ]CompareFiles is available you may use this to specify'
              r,←⊂'        the comparison utility to be used. Must be either a name or a "?".'
              r,←⊂'        See ]CompareFiles for details.'
              r,←⊂'        Note that specifying -use implies the -view flag'
              r,←⊂''
              r,←⊂' * If there is just one open Cider project it is taken'
              r,←⊂' * If there are several open Cider projects the user is interrogated'
              r,←⊂' * You may specify a particular project with -project=[ProjectName|ProjectFolder]'
          :Case ⎕C'CurrentBranch'
              r,←⊂'Returns the name of the current branch'
              r,←⊂''
              r,←AddLevel3HelpInfo'CurrentBranch'
          :Case ⎕C'Diff'
              r,←⊂'Returns a list of files in the working directory that are different from HEAD.'
              r,←⊂''
              r,←⊂'-verbose:  Specify this to get a full report'
              r,←⊂''
              r,←AddLevel3HelpInfo'Diff'
          :Case ⎕C'GetDefaultProject'
              r,←⊂'Returns the namespace and the folder if there is a default project defined.'
              r,←⊂'See also ]APLGit2.SetDefaultProject'
          :Case ⎕C'GoToGitHub'
              r,←⊂'Opens project in your default browser as, say:'
              r,←⊂'https://github.com/aplteam/APLGit2'
              r,←⊂''
              r,←⊂'The required project can be specified in a number of ways:'
              r,←⊂' * A URL like https://github.com/aplteam.APLGit2'
              r,←⊂' * A group and a project name like aplteam-APLGit2'
              r,←⊂' * A fully qualified namespace name of an opened Cider project like'
              r,←⊂'   #.APLGit2'
              r,←⊂' * A Cider alias of an opened Cider project like [git]'
              r,←AddLevel3HelpInfo'GoToGitHub'
          :Case ⎕C'Init'
              r,←⊂'Useful to initialize a folder for being managed by Git.'
              r,←⊂''
              r,←⊂'You may add the path to a folder as argument; if you do not then APLGit2 tries to'
              r,←⊂'figure it out.'
              r,←⊂''
              r,←⊂'-quiet is useful to prevent Init to ask any questions, mostly for tests.'
          :Case ⎕C'IsDirty'
              r,←⊂'Returns one of:'
              r,←⊂' * "Clean"'
              r,←⊂' * "Dirty"'
              r,←⊂''
              r,←AddLevel3HelpInfo'IsDirty'
          :Case ⎕C'IsGitProject'
              r,←⊂'Returns:'
              r,←⊂'Project <name> (<path) is [not] managed by Git'
              r,←⊂''
              r,←AddLevel3HelpInfo'IsGitProject'
          :Case ⎕C'ListBranches'
              r,←⊂'List all branches, by default local ones.'
              r,←⊂''
              r,←⊂'You may specify two mutually exclusive options in order to change its behaviour:'
              r,←⊂' * -a stands for "all": list all local and remote branches'
              r,←⊂' * -r stands for "remote": list just remote branches'
              r,←AddLevel3HelpInfo'ListBranches'
          :Case ⎕C'Log'
              r,←⊂'Shows a list with all commits in an edit window, by default with --oneline, but watch out'
              r,←⊂'for -verbose.'
              r,←⊂''
              r,←⊂'-since=  Use this to get all commits after a specific date (YYYY-MM-DD)'
              r,←⊂'-verbose By default a short report is provided. Overwrite with -verbose for a detailed report'
              r,←⊂'-max=    Allows you to specify the maximum number of commits you want to be returned'
              r,←⊂''
              r,←AddLevel3HelpInfo'Log'
          :Case ⎕C'OpenGitShell'
              r,←⊂'Opens a Git Bash shell, either on the given project or, if no project was provided, the'
              r,←⊂'current directory if that carries a folder .git/. If it does not an error is thrown'
              r,←⊂''
              r,←AddLevel3HelpInfo'OpenGitShell'
          :Case ⎕C'RefLog'
              r,←⊂'Lists the reference logs.'
              r,←⊂''
              r,←⊂'By default the command lists all log entries up to the last checkout.'
              r,←⊂''
              r,←⊂'Reference logs, or "reflogs", record when the tips of branches and other references were'
              r,←⊂'updated in the local repository. Reflogs are useful in various Git commands, to specify'
              r,←⊂'the old value of a reference.'
              r,←⊂''
              r,←⊂'-all   If you want all specifiy the -all flag.'
              r,←⊂'-max   If you want a specific number specify the max= flag with an integer.'
              r,←⊂''
              r,←⊂''
              r,←AddLevel3HelpInfo'RefLog'
          :Case ⎕C'SetDefaultProject'
              r,←⊂'Use this to specify a default project.'
              r,←⊂'Commands that require a project will act on the default project in case it was set.'
              r,←⊂'See also ]APLGit2.GetDefaultProject'
          :Case ⎕C'Status'
              r,←⊂'Reports the status from Git''s perspective.'
              r,←⊂'By default a verbose report is printed.'
              r,←⊂'Specify -short for getting just the essentials.'
              r,←AddLevel3HelpInfo'Status'
          :Case ⎕C'Squash'
              r,←⊂'Squashes some commits of the current branch into a single commit.'
              r,←⊂'The current branch MUST be neither "main" nor "master".'
              r,←⊂''
              r,←⊂'-m    You may specify a message with -m="my message", but if you don''t you will be given an edit'
              r,←⊂'      window for specifying a message. It will be populated with the messages from the commits'
              r,←⊂'      about to be squashed.'
              r,←AddLevel3HelpInfo'Status'
          :Else
              r,←⊂'There is no additional help available'
          :EndSelect
      :Case 2
          :Select ⎕C Cmd
          :CaseList ⎕C¨'Add' ''
              r,←AddProjectOptions 1
          :CaseList ⎕C¨'Commit' 'CurrentBranch' 'Diff' 'GoToGitHub' 'IsDirty' 'IsGitProject' 'ListBranches' 'Log' 'OpenGitShell' 'Squash' 'Status'
              r,←AddProjectOptions 0
          :Else
              r,←⊂'There is no additional help available'
          :EndSelect
     
      :EndSelect
    ∇

    ∇ r←AddLevel3HelpInfo fn
      r←⊂''
      r,←⊂'For more information execute:'
      r,←⊂']APLGit2.',fn,' -???'
    ∇

    ∇ r←AddProjectOptions flag
      r←''
      r,←⊂'The ]APLGit2.* user commands are particularly useful when used in conjunction with the project'
      r,←⊂'manager Cider, but it can be used without Cider as well, but then you must specify the folder'
      r,←⊂'you wish the user command to act on. APLGit2 does not accept URLs pointing to GitHub, it works'
      r,←⊂'only locally.'
      r,←⊂''
      r,←⊂'By default a user command will act on the currently opened Cider project if there is just one.'
      r,←⊂'If there are multiple open Cider projects the user will be asked which one to act on.'
      r,←⊂''
      r,←⊂'Once a default project got established and there are several Cider projects opened the user will'
      r,←⊂'be asked if she wants to act on the default project. If she refuses a list with all opened Cider'
      r,←⊂'projects will be presented to her.'
      :If flag
          r,←⊂''
          r,←⊂'You may specify a project by setting -project=. It must be one of:'
          r,←⊂' * The fully qualified path to a namespace that is an opened Cider project'
          r,←⊂' * The path to a git-managed folder'
          r,←⊂'   In this case it does not have to be an open Cider project, and not even a closed one.'
      :EndIf
    ∇

    ∇ r←AtLeastVersion min;currentVersion
      :Access Public Shared
      ⍝ Returns 1 if the currently running version is at least `min`.\\
      ⍝ If the current version is 17.1 then:\\
      ⍝ `1 1 1 0 ←→ AtLeastVersion¨16 17 17.1 18`\\
      ⍝ You may specify a version different from the currently running one via `⍺`:\\
      ⍝ `1 1 0 0 ←→ 17 AtLeastVersion¨16 17 17.1 18`
      currentVersion←{⊃⊃(//)⎕VFI ⍵/⍨2>+\⍵='.'}2⊃'.'⎕WG'aplversion'
      'Right argument must be length 1'⎕SIGNAL _errno/⍨1≠≢min
      r←⊃min≤currentVersion
    ∇

    Assert←{⍺←'' ⋄ (,1)≡,⍵:r←1 ⋄ ⍺ ⎕SIGNAL 1↓(⊃∊⍵),_errno}

    ∇ r←r AddTitles titles
    ⍝ `r` is a matrix with data. `titles` is put on top of that matrix, followed by a row with `-` matching the lengths of each title
      r←⍉↑(⊂¨titles),¨' ',¨↓⍉r
      r[2;]←(≢¨r[1;])⍴¨'-'
    ∇

    ∇ path←AddSlash path
      path,←(~(¯1↑path)∊'/\')/'/'
    ∇

    ∇ G←LoadCode dummy;res;folder;msg
      :If 0=⎕SE.⎕NC'_APLGit2'
          G←'_APLGit2'⎕SE.⎕NS''
          folder←¯1↓1⊃⎕NPARTS ##.SourceFile
          res←({⍵.overwrite←1 ⋄ ⍵}⎕NS'')⎕SE.Link.Import G folder
          'Could not import the Git application code'Assert∨/'Imported:'⍷res
          ⎕SE.Tatin.LoadDependencies((1⊃⎕NPARTS ##.SourceFile),'packages')'⎕se._APLGit2.APLSource'
          ⎕SE.APLGit2←⎕SE._APLGit2.APLSource.API          ⍝ Establish the API
          {}⎕SE.APLGit2.InitializeGitUserCommand''
      :EndIf
      G←⎕SE.APLGit2
    ∇

    ∇ yesOrNo←{default}YesOrNo question;isOkay;answer;add;dtb;answer2
    ⍝ Asks a simple question and allows just "Yes" or "No" as answers.
    ⍝ You may specify a default via the optional left argument which when specified
    ⍝ rules what happens when the user just presses <enter>.
    ⍝ `default` must be either 1 (yes) or 0 (no).
    ⍝ Note that this function does NOT work as expected when traced!
      isOkay←0
      default←{0<⎕NC ⍵:⍎⍵ ⋄ ''}'default'
      isOkay←0
      :If 0≠≢default
          'Left argument must be a scalar'⎕SIGNAL 11/⍨1≠≢default
      :AndIf ~default∊0 1
          'The left argument. if specified, must be a Boolean or empty'⎕SIGNAL 11
      :EndIf
      :If 0=≢default
          add←' (y/n) '
      :Else
          :If default
              add←' (Y/n) '
          :Else
              add←' (y/N) '
          :EndIf
      :EndIf
      :If 1<≡question
          ((≢question)⊃question)←((≢question)⊃question),add
          question←⍪question
      :Else
          question←question,add
      :EndIf
      :Repeat
          ⎕←''
          ⍞←question
          answer←⍞
          :If answer≡question                        ⍝ Did ...  (since version 18.0 trailing blanks are not removed anymore)
          :OrIf (≢answer)=¯1+≢question               ⍝ ... the ...
          :OrIf 0=≢answer                            ⍝ ... user ...
          :OrIf question≡(-≢question)↑answer         ⍝ ... just ...
              dtb←{⍵↓⍨-+/∧\' '=⌽⍵}
              answer2←dtb answer
          :OrIf answer2≡((-≢answer2)↑(⎕UCS 10){~⍺∊⍵:⍵ ⋄ ' ',dtb ⍺{⌽⍵↑⍨1+⍵⍳⍺}⌽⍵}question)   ⍝ ... press ...
          :OrIf answer≡{1↓⊃¯1↑(⍵∊⎕UCS 10 13)⊂⍵}(⎕UCS 10),question ⍝ ... <enter>?
              :If 0≠≢default
                  yesOrNo←default
                  isOkay←1
              :EndIf
          :Else
              answer←¯1↑{⍵↓⍨-+/∧\' '=⌽⍵}answer
              :If answer∊'YyNn'
                  isOkay←1
                  yesOrNo←answer∊'Yy'
              :EndIf
          :EndIf
      :Until isOkay
    ⍝Done
    ∇


    ∇ index←{x}Select options;flag;answer;question;value;bool;⎕ML;⎕IO;manyFlag;mustFlag;caption
    ⍝ Presents `options` as a numbered list and allows the user to select either exactly one or multiple ones.\\
    ⍝ One is the default.\\
    ⍝ The optional left argument allows you to specify more options:
    ⍝ * `manyFlag` defaults to 0 (meaning just one item might be selected) or 1, in which case multiple items can be specified.
    ⍝ * `mustFlag` forces the user to select at least one  option.
    ⍝ * `caption` is shown above the options.
    ⍝ `options` must not have more than 999 items.
    ⍝ If the user aborts by entering nothing or a "q" (for "quit") `index will be `⍬`.
      x←{0<⎕NC ⍵:⊆⍎⍵ ⋄ ''}'x'
      (caption manyFlag mustFlag)←x,(⍴,x)↓'' 0 0
      ⎕IO←1 ⋄ ⎕ML←1
      manyFlag←{0<⎕NC ⍵:⍎⍵ ⋄ 0}'manyFlag'
      'Invalid right argument; must be a vector of text vectors.'⎕SIGNAL _errno/⍨2≠≡options
      'Right argument has more than 999 items'⎕SIGNAL _errno/⍨999<≢options
      flag←0
      :Repeat
          ⎕←{⍵↑'--- ',caption,((0≠≢caption)/' '),⍵⍴'-'}⎕PW-1
          ⎕←⍪{((⊂'. '),¨⍨(⊂3 0)⍕¨⍳⍴⍵),¨⍵}options
          ⎕←''
          question←'Select one ',(manyFlag/'or more '),'item',((manyFlag)/'s'),' '
          question,←((manyFlag∨~mustFlag)/'('),((~mustFlag)/'q=quit'),((manyFlag∧~mustFlag)/', '),(manyFlag/'a=all'),((manyFlag∨~mustFlag)/')'),' :'
          :If 0<≢answer←⍞,0/⍞←question
              answer←(⍴question)↓answer
              :If 1=≢answer
              :AndIf answer∊'Qq',manyFlag/'Aa'
                  :If answer∊'Qq'
                      :If 0=mustFlag
                          index←⍬
                          flag←1
                      :EndIf
                  :Else
                      index←⍳≢options
                      flag←1
                  :EndIf
              :Else
                  (bool value)←⎕VFI answer
                  :If ∧/bool
                  :AndIf manyFlag∨1=+/bool
                      value←bool/value
                  :AndIf ∧/value∊⍳⍴options
                      index←value
                      flag←0≠≢index
                  :EndIf
              :EndIf
          :EndIf
      :Until flag
      index←{1<≢⍵:⍵ ⋄ ⊃⍵}⍣(⍬≢index)⊣index
    ∇

    ∇ (space folder)←GetSpaceAndFolder_ data
      :If ∨/'/\:'∊data
      :OrIf ~(⊃data)∊'#⎕'
          folder←data
          space←G.GetProjectFromPath folder
      :Else
          space←data
          folder←G.GetPathFromProject space
      :EndIf
    ∇

:EndClass
