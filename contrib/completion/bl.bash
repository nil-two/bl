_bl() {
  local cur prev words cword split
  _init_completion -s || return

  local defaultIFS=$IFS
  local IFS=$defaultIFS

  local commands=(
    create
    update
    edit
    show
    open
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
    --estimated-hours=
    --actual-hours=
    --issue-type=
    --category=
    --version=
    --milestone=
    --priority=
    --assignee=
    --help
  )
  local update_options=(
    --issue=
    --parent-issue=
    --summary=
    --description=
    --start-date=
    --due-date=
    --estimated-hours=
    --actual-hours=
    --issue-type=
    --category=
    --version=
    --milestone=
    --priority=
    --status=
    --resolution=
    --assignee=
    --help
  )
  local edit_options=(
    --help
  )
  local show_options=(
    --help
  )
  local open_options=(
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
    users
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
    zsh
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
              -a|--assignee)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list users)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
            esac
            $split && break
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${create_options[@]}"' -- "$cur") )
                ;;
            esac
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
              -a|--assignee)
                IFS=$'\n'; COMPREPLY=( $(compgen -W '$(bl resource list users)' -- "$cur") ); IFS=$defaultIFS
                break
                ;;
            esac
            $split && break
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${update_options[@]}"' -- "$cur") )
                ;;
            esac
            ;;
          edit)
            $split && break
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${edit_options[@]}"' -- "$cur") )
                ;;
            esac
            ;;
          show)
            $split && break
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${show_options[@]}"' -- "$cur") )
                ;;
            esac
            ;;
          show)
            $split && break
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${open_options[@]}"' -- "$cur") )
                ;;
            esac
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
                    case $cur in
                      -*)
                        COMPREPLY=( $(compgen -W '"${resource_sync_options[@]}"' -- "$cur") )
                        ;;
                    esac
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
            case $cur in
              -*)
                COMPREPLY=( $(compgen -W '"${configure_options[@]}"' -- "$cur") )
                ;;
            esac
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
