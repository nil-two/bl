complete -c bl -x
complete -c bl -n '__fish_no_arguments' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa create -d 'Create Backlog issue'
complete -c bl -n '__fish_seen_subcommand_from create' -s p -l project -xa '(bl resource list projects)' -d 'Create issue on PROJECT'
complete -c bl -n '__fish_seen_subcommand_from create' -s I -l parent-issue -d 'Issue parent issue'
complete -c bl -n '__fish_seen_subcommand_from create' -s s -l summary -d 'Issue summary'
complete -c bl -n '__fish_seen_subcommand_from create' -s d -l description -d 'Issue description'
complete -c bl -n '__fish_seen_subcommand_from create' -s S -l start-date -d 'Issue start date'
complete -c bl -n '__fish_seen_subcommand_from create' -s D -l due-date -d 'Issue due date'
complete -c bl -n '__fish_seen_subcommand_from create' -s E -l estimated-hours -d 'Issue estimated hours'
complete -c bl -n '__fish_seen_subcommand_from create' -s A -l actual-hours -d 'Issue actual hours'
complete -c bl -n '__fish_seen_subcommand_from create' -s t -l issue-type -xa '(bl resource list issueTypes)' -d 'Issue type'
complete -c bl -n '__fish_seen_subcommand_from create' -s c -l category -xa '(bl resource list categories)' -d 'Issue category'
complete -c bl -n '__fish_seen_subcommand_from create' -s v -l version -xa '(bl resource list versions)' -d 'Issue version'
complete -c bl -n '__fish_seen_subcommand_from create' -s m -l milestone -xa '(bl resource list versions)' -d 'Issue milestone'
complete -c bl -n '__fish_seen_subcommand_from create' -s P -l priority -xa '(bl resource list priorities)' -d 'Issue priority'
complete -c bl -n '__fish_seen_subcommand_from create' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa update -d 'Update Backlog issue'
complete -c bl -n '__fish_seen_subcommand_from update' -s i -l issue -d 'Update ISSUE'
complete -c bl -n '__fish_seen_subcommand_from update' -s I -l parent-issue -d 'Issue parent issue'
complete -c bl -n '__fish_seen_subcommand_from update' -s s -l summary -d 'Issue summary'
complete -c bl -n '__fish_seen_subcommand_from update' -s d -l description -d 'Issue description'
complete -c bl -n '__fish_seen_subcommand_from update' -s S -l start-date -d 'Issue start date'
complete -c bl -n '__fish_seen_subcommand_from update' -s D -l due-date -d 'Issue due date'
complete -c bl -n '__fish_seen_subcommand_from update' -s E -l estimated-hours -d 'Issue estimated hours'
complete -c bl -n '__fish_seen_subcommand_from update' -s A -l actual-hours -d 'Issue actual hours'
complete -c bl -n '__fish_seen_subcommand_from update' -s t -l issue-type -xa '(bl resource list issueTypes)' -d 'Issue type'
complete -c bl -n '__fish_seen_subcommand_from update' -s c -l category -xa '(bl resource list categories)' -d 'Issue category'
complete -c bl -n '__fish_seen_subcommand_from update' -s v -l version -xa '(bl resource list versions)' -d 'Issue version'
complete -c bl -n '__fish_seen_subcommand_from update' -s m -l milestone -xa '(bl resource list versions)' -d 'Issue milestone'
complete -c bl -n '__fish_seen_subcommand_from update' -s P -l priority -xa '(bl resource list priorities)' -d 'Issue priority'
complete -c bl -n '__fish_seen_subcommand_from update' -s T -l status -xa '(bl resource list statuses)' -d 'Issue status'
complete -c bl -n '__fish_seen_subcommand_from update' -s r -l resolution -xa '(bl resource list resolutions)' -d 'Issue resolution'
complete -c bl -n '__fish_seen_subcommand_from update' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa edit -d 'Edit Backlog issue description with text editor'
complete -c bl -n '__fish_seen_subcommand_from edit' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa show -d 'Show Backlog issue description'
complete -c bl -n '__fish_seen_subcommand_from show' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa open -d 'Open Backlog issue with web browser'
complete -c bl -n '__fish_seen_subcommand_from open' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa resource -d 'Handle Backlog resources'
complete -c bl -n '__fish_seen_subcommand_from resource; and not __fish_seen_subcommand_from sync list' -xa sync -d 'Sync Backlog resources to caches'
complete -c bl -n '__fish_seen_subcommand_from resource; and __fish_seen_subcommand_from sync' -s p -l project -xa '(bl resource list projects)' -d 'Sync resource caches of PROJECT'
complete -c bl -n '__fish_seen_subcommand_from resource; and __fish_seen_subcommand_from sync' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_seen_subcommand_from resource; and not __fish_seen_subcommand_from sync list' -xa list -d 'List Backlog resources from caches'
complete -c bl -n '__fish_seen_subcommand_from resource; and __fish_seen_subcommand_from list' -s p -l project -xa '(bl resource list projects)' -d 'List resource caches of PROJECT'
complete -c bl -n '__fish_seen_subcommand_from resource; and __fish_seen_subcommand_from list' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_seen_subcommand_from resource; and __fish_seen_subcommand_from list' -xa 'spaces projects issueTypes categories versions priorities statuses resolutions' -d 'Resource type'
complete -c bl -n '__fish_use_subcommand' -xa configure -d 'Edit config'
complete -c bl -n '__fish_seen_subcommand_from completion' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_use_subcommand' -xa completion -d 'Print evaluatable completion script'
complete -c bl -n '__fish_seen_subcommand_from completion' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_seen_subcommand_from completion' -xa 'bash zsh fish' -d 'Shell'
complete -c bl -n '__fish_use_subcommand' -xa help -d 'Print usage and exit'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -s h -l help -d 'Print usage and exit'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa create -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa update -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa edit -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa show -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa open -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa resource -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and __fish_seen_subcommand_from resource' -xa sync -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and __fish_seen_subcommand_from resource' -xa list -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa configure -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa completion -d 'Command'
complete -c bl -n '__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from resource' -xa help -d 'Command'
