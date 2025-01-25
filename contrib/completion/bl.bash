_bl() {
  local cur prev words cword split
  _init_completion -s || return

  local defaultIFS=$IFS
  local IFS=$defaultIFS

  local commands=(
    create
    update
    resource
    configure
    completion
    help
  )
  local resource_commands=(
    sync
    list
  )
  local options=(
    --help
  )
  local create_options=(
    --project=
    --parent-issue=
    --summary=
    --description=
    --start-date=
    --due-date=
    --issue-type=
    --category=
    --version=
    --milestone=
    --priority=
    --help
  )
  local update_options=(
    --issue=
    --parent-issue=
    --summary=
    --description=
    --start-date=
    --due-date=
    --issue-type=
    --category=
    --version=
    --milestone=
    --priority=
    --status=
    --resolution=
    --help
  )
  local resource_sync_options=(
    --project=
    --help
  )
  local resource_list_options=(
    --project=
    --help
  )
  local configure_options=(
    --help
  )
  local completion_options=(
    --help
  )
  local help_options=(
    --help
  )
  local resource_types=(
    projects
    issueTypes
    categories
    versions
    priorities
    statuses
    resolutions
  )
  local supported_shells=(
    bash
    fish
  )

  case $cword in
    1)
      $split && return
      case $cur in
        -*)
          COMPREPLY=( $(compgen -W '"${options[@]}"' -- "$cur") )
          ;;
        *)
          COMPREPLY=( $(compgen -W '"${commands[@]}"' -- "$cur") )
          ;;
      esac
      ;;
    *)
      case ${words[1]} in
        create)
          case $prev in
            -p|--project)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list projects)' -- "$cur") ); IFS=$defaultIFS
              ;;
            -t|--issue-type)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list issueTypes)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -c|--category)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list categories)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -v|--version)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -m|--milestone)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -P|--priority)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list priorities)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
          esac
          $split && return
          COMPREPLY=( $(compgen -W '"${create_options[@]}"' -- "$cur") )
          ;;
        update)
          case $prev in
            -t|--issue-type)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list issueTypes)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -c|--category)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list categories)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -v|--version)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -m|--milestone)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -P|--priority)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list priorities)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -T|--status)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list statuses)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
            -r|--resolution)
              IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list resolutions)' -- "$cur") ); IFS=$defaultIFS
              [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
              ;;
          esac
          $split && return
          COMPREPLY=( $(compgen -W '"${update_options[@]}"' -- "$cur") )
          ;;
        resource)
          case $cword in
            2)
              $split && return
              COMPREPLY=( $(compgen -W '"${resource_commands[@]}"' -- "$cur") )
              ;;
            *)
              case ${words[2]} in
                sync)
                  case $prev in
                    -p|--project)
                      IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list projects)' -- "$cur") ); IFS=$defaultIFS
                      ;;
                  esac
                  $split && return
                  COMPREPLY=( $(compgen -W '"${resource_sync_options[@]}"' -- "$cur") )
                  ;;
                list)
                  case $prev in
                    -p|--project)
                      IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list projects)' -- "$cur") ); IFS=$defaultIFS
                      ;;
                  esac
                  $split && return
                  case $cur in
                    -*)
                      COMPREPLY=( $(compgen -W '"${resource_list_options[@]}"' -- "$cur") )
                      ;;
                    *)
                      COMPREPLY=( $(compgen -W '"${resource_types[@]}"' -- "$cur") )
                      ;;
                  esac
                  ;;
              esac
              ;;
          esac
          ;;
        configure)
          $split && return
          COMPREPLY=( $(compgen -W '"${configure_options[@]}"' -- "$cur") )
          ;;
        completion)
          $split && return
          case $cur in
            -*)
              COMPREPLY=( $(compgen -W '"${completion_options[@]}"' -- "$cur") )
              ;;
            *)
              COMPREPLY=( $(compgen -W '"${supported_shells[@]}"' -- "$cur") )
              ;;
          esac
          ;;
        help)
          $split && return
          case $cur in
            -*)
              COMPREPLY=( $(compgen -W '"${help_options[@]}"' -- "$cur") )
              ;;
            *)
              case $cword in
                2)
                  COMPREPLY=( $(compgen -W '"${commands[@]}"' -- "$cur") )
                  ;;
                3)
                  case ${words[2]} in
                    resource)
                      COMPREPLY=( $(compgen -W '"${resource_commands[@]}"' -- "$cur") )
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
  [[ $COMPREPLY == *= ]] && compopt -o nospace
}
complete -F _bl bl
