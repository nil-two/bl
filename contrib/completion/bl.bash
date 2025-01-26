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
    spaces
    projects
    issueTypes
    categories
    versions
    priorities
    statuses
    resolutions
  )
  local shells=(
    bash
    fish
  )

  while true; do
    case $cword in
      1)
        $split && break
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
                break
                ;;
              -t|--issue-type)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list issueTypes)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -c|--category)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list categories)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -v|--version)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -m|--milestone)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -P|--priority)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list priorities)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
            esac
            $split && break
            COMPREPLY=( $(compgen -W '"${create_options[@]}"' -- "$cur") )
            ;;
          update)
            case $prev in
              -t|--issue-type)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list issueTypes)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -c|--category)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list categories)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -v|--version)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -m|--milestone)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list versions)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -P|--priority)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list priorities)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -T|--status)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list statuses)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
              -r|--resolution)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list resolutions)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
            esac
            $split && break
            COMPREPLY=( $(compgen -W '"${update_options[@]}"' -- "$cur") )
            ;;
          resource)
            case $cword in
              2)
                $split && break
                COMPREPLY=( $(compgen -W '"${resource_commands[@]}"' -- "$cur") )
                ;;
              *)
                case ${words[2]} in
                  sync)
                    case $prev in
                      -p|--project)
                        IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list projects)' -- "$cur") ); IFS=$defaultIFS
                        break
                        ;;
                    esac
                    $split && break
                    COMPREPLY=( $(compgen -W '"${resource_sync_options[@]}"' -- "$cur") )
                    ;;
                  list)
                    case $prev in
                      -p|--project)
                        IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list projects)' -- "$cur") ); IFS=$defaultIFS
                        break
                        ;;
                    esac
                    $split && break
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
            $split && break
            COMPREPLY=( $(compgen -W '"${configure_options[@]}"' -- "$cur") )
            ;;
          completion)
            $split && break
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${completion_options[@]}"' -- "$cur") )
                ;;
              *)
                COMPREPLY=( $(compgen -W '"${shells[@]}"' -- "$cur") )
                ;;
            esac
            ;;
          help)
            $split && break
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
    break
  done
  [[ $COMPREPLY == *= ]] && compopt -o nospace
  [[ ! $cur =~ ^[\'\"] ]] && COMPREPLY=( "${COMPREPLY[@]// /\\ }" )
}
complete -F _bl bl
