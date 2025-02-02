bl
==

Handle Backlog issues.

```
$ bl create --issue-type=バグ --summary=不具合C
PROJECT-12 不具合C

$ bl list --issue-type=バグ --status=未対応
PROJECT-10 不具合A
PROJECT-11 不具合B
PROJECT-12 不具合C
```

Usage
-----

```
usage: bl [<option(s)>] <command> [...]
handle Backlog issues.

commands:
  bl create         # create Backlog issue
  bl update         # update Backlog issue
  bl list           # list Backlog issues
  bl show           # show Backlog issue description
  bl edit           # edit Backlog issue description with text editor
  bl open           # open Backlog issue with web browser
  bl resource sync  # sync Backlog resources to caches
  bl resource list  # list Backlog resources from caches
  bl configure      # edit config with text editor
  bl completion     # print evaluatable completion script
  bl help           # print usage and exit

options:
  -h, --help  print usage and exit

environment-variables:
  BL_SPACE     Backlog space domain
  BL_PROJECT   Backlog project key
  BL_API_KEY   Backlog API key
  BL_REGISTRY  registry path (default: ~/.config/bl/registry.json)
```

Requirements
------------

- Python (3.10.0 or later)

Installation
------------

1. Copy `bl` into your `$PATH`.
2. Make `bl` executable.
3. Set `BL_API_KEY` in your shell's profile. API key can be get from Backlog.
4. Set `BL_SPACE` in your shell's profile. Space is for example, `xxx.backlog.com`, `yyy.backlog.jp`, etc.
5. Set `BL_PROJECT` in your shell's profile. Project is for example, `PROJECT`, `P_XXX`, etc.
6. Restart your shell and execute `bl resource sync` to sync Backlog resources to caches.
7. (Optional) Add the following config to your shell's profile to enable completion. And restart your shell.

| Shell |                                    |
|-------|------------------------------------|
| bash  | eval "$(bl completion bash)"       |
| zsh   | eval "$(bl completion zsh)"        |
| fish  | source (bl completion zsh \| psub) |

### Example

```
$ curl -L https://raw.githubusercontent.com/nil-two/bl/master/bl > ~/bin/bl
$ chmod +x ~/bin/bl
$ echo 'export BL_API_KEY=...' >> ~/.bashrc
$ echo 'export BL_SPACE=...' >> ~/.bashrc
$ echo 'export BL_PROJECT=...' >> ~/.bashrc
$ bl resource sync
$ echo 'eval "$(bl completion bash)"' >> ~/.bashrc
```

Note: In this example, `$HOME/bin` must be included in `$PATH`.

Commands
--------

### bl create \[\<option\(s\)\>\]

Create Backlog issue.

```
$ bl create --issue-type=バグ --summary=不具合C
PROJECT-12 不具合C
(Create issue with issue type is バグ, summary is 不具合C)

$ bl create --issue-type=バグ --summary=不具合D --priority=高
PROJECT-12 不具合C
(Create issue with issue type is バグ, summary is 不具合C, priority is 高)
```

#### -p, --project=PROJECT

Create issue on the project.
The default value is `$BL_PROJECT`.

#### -I, --parent-issue=ISSUE

Set issue parent issue.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.parentIssue`.

#### -s, --summary=SUMMARY

Set issue summary.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.summary`.

#### -d, --description=DESCRIPTION

Set issue description.
If the value is not set and issue type has template description, the value becomes template description.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.description`.

#### -S, --start-date=DATE

Set issue start date.
If the value is `today`, the value becomes today.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.startDate`.

#### -D, --due-date=DATE

Set issue due date.
If the value is `today`, the value becomes today.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.dueDate`.

#### -E, --estimated-hours=HOURS

Set issue estimated hours.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.estimatedHours`.

#### -A, --actual-hours=HOURS 

Set issue actual hours.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.actualHours`.

#### -t, --issue-type=ISSUE\_TYPE

Set issue type.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.issueType`.

#### -c, --category=CATEGORY

Set issue categories.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.categories`.

#### -v, --version=VERSION

Set issue versions.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.versions`.

#### -m, --milestone=MILESTONE

Set issue milestones.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.milestones`.

#### -P, --priority=PRIORITY

Set issue priority.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.priority`.

#### -a, --assignee=USER

Set issue assignee.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.create.assignee`.

### bl update \[\<option\(s\)\>\]

Set ipdate Backlog issue.

```
$ bl update --issue=PROJECT-10 --summary=不具合A
PROJECT-10 不具合A
(Update PROJECT-10 issue summary to 不具合A)

$ bl update --issue=P_XXX-25 --status=完了 --resolution=対応済み
P_XXX-25 作業A
(Update PROJECT-10 issue status to 完了 and resolution to 対応済み)
```

#### -i, --issue=ISSUE

Update the issue.

#### -I, --parent-issue=ISSUE

Set issue parent issue.

#### -s, --summary=SUMMARY

Set issue summary.

#### -d, --description=DESCRIPTION

Set issue description.

#### -S, --start-date=DATE

Set issue start date.
If the value is `today`, the value becomes today.

#### -D, --due-date=DATE

Set issue due date.
If the value is `today`, the value becomes today.

#### -E, --estimated-hours=HOURS

Set issue estimated hours.

#### -A, --actual-hours=HOURS

Set issue actual hours.

#### -t, --issue-type=ISSUE\_TYPE

Set issue type.

#### -c, --category=CATEGORY

Set issue categories.

#### -v, --version=VERSION

Set issue versions.

#### -m, --milestone=MILESTONE

Set issue milestones.

#### -P, --priority=PRIORITY

Set issue priority.

#### -T, --status=STATUS

Set issue status.

#### -r, --resolution=RESOLUTION

Set issue resolution.

#### -a, --assignee=USER

Set issue assignee.

### bl list \[\<option\(s\)\>\]

List Backlog issues.

```
$ bl list --issue-type=バグ --status=未対応
PROJECT-10 不具合A
PROJECT-11 不具合B
PROJECT-12 不具合C
(List issues where the issue type is バグ and the status is 未対応)

$ bl list --parent-issue=PROJECT-4
PROJECT-5 移行タスクA
PROJECT-8 移行タスクB
(List issues where the parent issue is PROJECT-4)
```

#### -p, --project=PROJECT

Search issues on the project.
The default value is `$BL_PROJECT`.

#### -I, --parent-issue=ISSUE

Search by parent issues.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.parentIssues`.

#### -t, --issue-type=ISSUE\_TYPE

Search by issue types.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.issueTypes`.

#### -c, --category=CATEGORY

Search by categories.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.categories`.

#### -v, --version=VERSION

Search by versions.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.versions`.

#### -m, --milestone=MILESTONE

Search by milestones.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.milestones`.

#### -P, --priority=PRIORITY

Search by priorities.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.priorities`.

#### -T, --status=STATUS

Search by statuses.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.statuses`.

#### -r, --resolution=RESOLUTION

Search by resolution.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.resolutions`.

#### -a, --assignee=USER

Search by assignee.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.assignees`.

#### -k, --keyword=KEYWORD

Search by keyword.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.keyword`.

#### -s, --sort=FIELD

Sort issues by field issueType, category, version, milestone, summary, status, priority, attachment, sharedFile, created, createdUser, updated, updatedUser, assignee, startDate, dueDate, estimatedHours, actualHours, childIssue.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.sort` and default default value is `created`.

#### -o, --order=ORDER

Sort issues with asc or desc.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.order` and default default value is `desc`.

#### -O, --offset=OFFSET

Search issues with offset from 0 to all issues count.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.offset` and default default value is `0`.

#### -C, --count=COUNT

Search issues with count from 1 to 100.
The default value is registry `defaults.spaces.{space-domain}.projects.{project-key}.list.count` and default default value is `20`.

### bl show \[\<option\(s\)\>\] \<issue\>

Show Backlog issue description.

```
$ bl show PROJECT-10
(Print PROJECT-10 issue description)

$ bl show P_XXX-25
(Print P_XXX-25 issue description)
```

### bl edit \[\<option\(s\)\>\] \<issue\>

Edit Backlog issue description with text editor.

```
$ bl open PROJECT-10
(Edit PROJECT-10 issue description with $EDITOR)

$ bl open P_XXX-25
(Edit P_XXX-25 issue description with $EDITOR)
```

### bl open \[\<option\(s\)\>\] \<issue\>

Open Backlog issue with web browser.

```
$ bl open PROJECT-10
(Open PROJECT-10 issue page with web browser)

$ bl open P_XXX-25
(Open P_XXX-25 issue page with web browser)
```

### bl resource sync \[\<option\(s\)\>\]

Sync Backlog resources to caches.

```
$ bl resource sync
(Sync Backlog resource of the project $BL_PROJECT)

$ bl resource sync --project=P_XXX
(Sync Backlog resource of the project P_XXX)
```

#### -p, --project=PROJECT

Sync resource caches of PROJECT
The default value is `$BL_PROJECT`.

### bl resource list \[\<option\(s\)\>\] \<resource\_type\>

List Backlog resources from caches.

Supported resource types are as follows:

- spaces
- users
- projects
- issueTypes
- categories
- versions
- priorities
- statuses
- resolutions

```
$ bl resource list categories
カテゴリA
カテゴリB
(List resource identifiers of categories)

$ bl resource list priorities
高
中
低
(List resource identifiers of priorities)
```

#### -p, --project=PROJECT

List resource caches of PROJECT.
The default value is `$BL_PROJECT`.

### bl configure \[\<option\(s\)\>\]

Edit config with text editor.

```
$ bl configure
(Open the registry file with $EDITOR)
```

### bl completion \[\<option\(s\)\>\] \<shell\>

Print evaluatable completion script.

Supported shells are as follows:

- bash
- zsh
- fish

```
$ eval "$(bl completion bash)"
(Enable the completion for Bash)

$ eval "$(bl completion zsh)"
(Enable the completion for Zsh)

$ source (bl completion fish | psub)
(Enable the completion for Fish)
```

### bl help \[\<option\(s\)\>\] \[\<command\>\]

Print usage and exit.

```
$ bl help
(Print bl usage)

$ bl help resource list
(Print bl resource list usage)
```

Common options
--------------

### -h, --help

Print usage of the command and exit.

Variables
---------

### `BL_SPACE`

Backlog space domain.
For example, `xxx.backlog.com`, `yyy.backlog.jp`, etc.

### `BL_PROJECT`

Backlog project key.
For example, `PROJECT`, `P_XXX`, etc.

### `BL_API_KEY`

Backlog API key.

### `BL_REGISTRY`

The path of the registry file.
The default value is `$HOME/.config/bl/registry.json`.

The structure of JSON is as follows:

```
{
  "version": "<registry-version>",
  "defaults": {
    "spaces": {
      "<space-domain>": {
        "projects": {
          "<project-key>": {
            "<command>": {
              "<param>": <default-value>,
              ...
            },
            ...
          },
          ...
        }
      }
    }
  },
  "caches": {
    "spaces": {
      "<space-domain>": {
        "users": {
          "<user-identifier>": {
            "id": <user-id>
          }
        },
        "projects": {
          "<project-key>": {
            "id": <project-id>,
            "<resource-type>": {
              "<resource-identifier>": <values>,
              ...
            },
            ...
          },
          ...
        }
      }
    }
  }
}
```

License
-------

MIT License

Author
------

nil2 <nil2@nil2.org>
