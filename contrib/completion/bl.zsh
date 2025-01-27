_bl() {
  local projects issue_types categories versions milestones priorities statuses resolutions
  local commands=(
    'create:create Backlog issue'
    'update:update Backlog issue'
    'edit:edit Backlog issue'
    'show:show Backlog issue'
    'open:open Backlog issue with web browser'
    'resource:handle Backlog resources'
    'configure:edit config'
    'completion:print evaluatable completion script'
    'help:print usage and exit'
  )
  local resource_commands=(
    'sync:sync Backlog resources to caches'
    'list:list Backlog resources from caches'
  )
  local resource_types=(
    'spaces'
    'projects'
    'issueTypes'
    'categories'
    'versions'
    'priorities'
    'statuses'
    'resolutions'
  )
  local shells=(
    'bash'
    'zsh'
    'fish'
  )

  _arguments -C -S -s \
    '(-h --help)'{-h,--help}'[print usage and exit]' \
    '1: :->command' \
    '*:: :->args'
  case $state in
    command)
      _describe -t 'commands' 'command' commands
      ;;
    args)
      case $words[1] in
        create)
          _arguments -C -S -s \
            '(-p --project)'{-p,--project}'[create issue on PROJECT]:project:->project' \
            '(-I --parent-issue)'{-I,--parent-issue}'[issue parent issue]:parent issue:' \
            '(-s --summary)'{-s,--summary}'[issue summary]:summary:' \
            '(-d --description)'{-d,--description}'[issue description]:description:' \
            '(-S --start-date)'{-S,--start-date}'[issue start date]:start date:' \
            '(-D --due-date)'{-D,--due-date}'[issue due date]:due date:' \
            '(-t --issue-type)'{-t,--issue-type}'[issue type]:issue type:->issue_type' \
            '(-c --category)'{-c,--category}'[issue category]:category:->category' \
            '(-v --version)'{-v,--version}'[issue version]:version:->version' \
            '(-m --milestone)'{-m,--milestone}'[issue milestone]:milestone:->milestone' \
            '(-P --priority)'{-P,--priority}'[issue priority]:priority:->priority' \
            '(-h --help)'{-h,--help}'[print usage and exit]'
          case $state in
            project)
              projects=( ${(f)"$(bl resource list projects)"} )
              _describe -t 'projects' 'project' projects
              ;;
            issue_type)
              issue_types=( ${(f)"$(bl resource list issueTypes)"} )
              _describe -t 'issue_types' 'issue type' issue_types
              ;;
            category)
              categories=( ${(f)"$(bl resource list categories)"} )
              _describe -t 'categories' 'category' categories
              ;;
            version)
              versions=( ${(f)"$(bl resource list versions)"} )
              _describe -t 'versions' 'version' versions
              ;;
            milestone)
              milestones=( ${(f)"$(bl resource list versions)"} )
              _describe -t 'milestones' 'milestone' milestones
              ;;
            priority)
              priorities=( ${(f)"$(bl resource list priorities)"} )
              _describe -t 'priorities' 'priority' priorities
              ;;
          esac
          ;;
        update)
          _arguments -C -S -s \
            '(-i --issue)'{-i,--issue}'[update ISSUE]:issue:' \
            '(-I --parent-issue)'{-I,--parent-issue}'[issue parent issue]:parent issue:' \
            '(-s --summary)'{-s,--summary}'[issue summary]:summary:' \
            '(-d --description)'{-d,--description}'[issue description]:description:' \
            '(-S --start-date)'{-S,--start-date}'[issue start date]:start date:' \
            '(-D --due-date)'{-D,--due-date}'[issue due date]:due date:' \
            '(-t --issue-type)'{-t,--issue-type}'[issue type]:issue type:->issue_type' \
            '(-c --category)'{-c,--category}'[issue category]:category:->category' \
            '(-v --version)'{-v,--version}'[issue version]:version:->version' \
            '(-m --milestone)'{-m,--milestone}'[issue milestone]:milestone:->milestone' \
            '(-P --priority)'{-P,--priority}'[issue priority]:priority:->priority' \
            '(-T --status)'{-T,--status}'[issue status]:status:->status' \
            '(-r --resolution)'{-r,--resolution}'[issue resolution]:resolution:->resolution' \
            '(-h --help)'{-h,--help}'[print usage and exit]'
          case $state in
            issue_type)
              issue_types=( ${(f)"$(bl resource list issueTypes)"} )
              _describe -t 'issue_types' 'issue type' issue_types
              ;;
            category)
              categories=( ${(f)"$(bl resource list categories)"} )
              _describe -t 'categories' 'category' categories
              ;;
            version)
              versions=( ${(f)"$(bl resource list versions)"} )
              _describe -t 'versions' 'version' versions
              ;;
            milestone)
              milestones=( ${(f)"$(bl resource list versions)"} )
              _describe -t 'milestones' 'milestone' milestones
              ;;
            priority)
              priorities=( ${(f)"$(bl resource list priorities)"} )
              _describe -t 'priorities' 'priority' priorities
              ;;
            status)
              statuses=( ${(f)"$(bl resource list statuses)"} )
              _describe -t 'statuses' 'status' statuses
              ;;
            resolution)
              resolutions=( ${(f)"$(bl resource list resolutions)"} )
              _describe -t 'resolutions' 'resolution' resolutions
              ;;
          esac
          ;;
        edit)
          _arguments -C -S -s \
            '(-h --help)'{-h,--help}'[print usage and exit]' \
            '1:issue:'
          ;;
        show)
          _arguments -C -S -s \
            '(-h --help)'{-h,--help}'[print usage and exit]' \
            '1:issue:'
          ;;
        open)
          _arguments -C -S -s \
            '(-h --help)'{-h,--help}'[print usage and exit]' \
            '1:issue:'
          ;;
        resource)
          _arguments -C -S -s \
            '1: :->resource_command' \
            '*:: :->args'
          case $state in
            resource_command)
              _describe -t 'commands' 'command' resource_commands
              ;;
            args)
              case $words[1] in
                sync)
                  _arguments -C -S -s \
                    '(-p --project)'{-p,--project}'[create issue on PROJECT]:project:->project' \
                    '(-h --help)'{-h,--help}'[print usage and exit]'
                  case $state in
                    project)
                      projects=( ${(f)"$(bl resource list projects)"} )
                      _describe -t 'projects' 'project' projects
                      ;;
                  esac
                  ;;
                list)
                  _arguments -C -S -s \
                    '(-p --project)'{-p,--project}'[create issue on PROJECT]:project:->project' \
                    '(-h --help)'{-h,--help}'[print usage and exit]' \
                    '1: :->resource_type'
                  case $state in
                    project)
                      projects=( ${(f)"$(bl resource list projects)"} )
                      _describe -t 'projects' 'project' projects
                      ;;
                    resource_type)
                      _describe -t 'resource_types' 'resource type' resource_types
                      ;;
                  esac
                  ;;
              esac
              ;;
          esac
          ;;
        configure)
          _arguments -C -S -s \
            '(-h --help)'{-h,--help}'[print usage and exit]'
          ;;
        completion)
          _arguments -C -S -s \
            '(-h --help)'{-h,--help}'[print usage and exit]' \
            '1: :->shell'
          case $state in
            shell)
              _describe -t 'shells' 'shell' shells
              ;;
          esac
          ;;
        help)
          _arguments -C -S -s \
            '(-h --help)'{-h,--help}'[print usage and exit]' \
            '1: :->help_command' \
            '*:: :->args'
          case $state in
            help_command)
              _describe -t 'commands' 'command' commands
              ;;
            args)
              case $words[1] in
                resource)
                  _arguments -C -S -s \
                    '1: :->help_resource_command'
                  case $state in
                    help_resource_command)
                      _describe -t 'commands' 'command' resource_commands
                      ;;
                  esac
                  ;;
              esac
              ;;
          esac
          ;;
      esac
      ;;
  esac
}

compdef _bl bl
