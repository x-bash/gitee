# shellcheck shell=bash
# shellcheck disable=SC2039

_gt_complete() {
    local cur opts chose_opt prev
    COMPREPLY=()

    if [ -n "${BASH_VERSION}" ]; then
        cur="${COMP_WORDS[COMP_CWORD]}"
        chose_opt="${COMP_WORDS[0]}"
        prev="${COMP_WORDS[COMP_CWORD - 1]}"
    elif [ -n "${ZSH_VERSION}" ]; then
        chose_opt="${words[0]}"
        prev="${words[CURRENT - 1]}"
    fi
    case "$chose_opt" in
    gt_current)
        if [ -n "${BASH_VERSION}" ]; then
            if [ "$prev" == "gt_current" ]; then
                opts="repo owner"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
            elif [ "$prev" == "owner" ]; then
                opts="type"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
            else
                return 0
            fi
        else
            _arguments -C \
                '1: :(repo owner)' \
                '*::arg:->args'
            case "$prev" in
            owner)
                _arguments \
                    "type::"
                ;;
            esac
            return 0
        fi
        ;;
    gt_config)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_config)
                opts="which save load"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac

        else
            _arguments -C \
                '1: :(which save load)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_resp)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_resp)
                opts="header body"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(header body)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_user)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_user)
                opts="url"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            url)
                opts="--name"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            esac

        else
            _arguments -C \
                '1: :(url)' \
                '*::arg:->args'
            case "$prev" in
            url)
                _arguments -C \
                    "1: :(--name)"
                return 0
                ;;
            esac
            return 0
        fi
        ;;
    gt_enterprise)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_enterprise)
                opts="info repo new"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            repo)
                opts="create list"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            create)
                if [ "${COMP_WORDS[COMP_CWORD - 2]}" != "repo" ]; then
                    return 0
                fi
                opts="--owner --has_issues --has_wiki --access --outsourced"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            list)
                if [ "${COMP_WORDS[COMP_CWORD - 2]}" != "repo" ]; then
                    return 0
                fi
                opts="--owner --type --direct"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(repo info new)' \
                '*::arg:->args'
            case "$prev" in
            repo)
                _arguments -C \
                    "1: :(create list)"
                return 0
                ;;
            esac
            return 0
        fi
        ;;
    gt_org)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_org)
                opts="info repo create new"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            repo)
                opts="create list"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(info repo create new)' \
                '*::arg:->args'
            case "$prev" in
            repo)
                _arguments -C \
                    "1: :(create list)"
                return 0
                ;;
            esac
            return 0
        fi
        ;;
    gt_repo)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo)
                opts="list destroy create fork info new"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(list destroy create fork info new)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_url | gt_repo_clone)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_url | gt_repo_clone)
                opts="http ssh"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(http ssh)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_member)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_member)
                opts="list add remove"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(list add remove)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_page)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_page)
                opts="info build"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(info build)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_release)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_release)
                opts="list create update get_latest get_or_create delete"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(list create update get_latest get_or_create delete)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_release_attachment)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_release_attachment)
                opts="list upload remove"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(list upload remove)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_pr)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_pr)
                opts="create list open status"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(create list open status)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_repo_pr_assign | gt_repo_pr_testers)
        if [ -n "${BASH_VERSION}" ]; then
            case $prev in
            gt_repo_pr_assign | gt_repo_pr_testers)
                opts="delete"
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
                return 0
                ;;
            *)
                return 0
                ;;
            esac
        else
            _arguments -C \
                '1: :(delete)' \
                '*::arg:->args'
            return 0
        fi
        ;;
    gt_token)
        return 0
        ;;
    esac
}

_gt_request_complete() {
    local cur opts prev
    COMPREPLY=()

    if [ -n "${BASH_VERSION}" ]; then
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD - 1]}"
        case "$prev" in
        gt_request)
            opts="get post put patch delete"
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        get)
            opts="multi"
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        post | put)
            opts="json form text bin"
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        patch | delete | *)
            return 0
            ;;
        esac

    elif [ -n "${ZSH_VERSION}" ]; then
        prev="${words[CURRENT - 1]}"
        _arguments -C \
            '1: :(get post put patch delete)' \
            '*::arg:->args'
        case "$prev" in
        get)
            _arguments -C \
                "1: :(multi)"
            return 0
            ;;
        post | put)
            _arguments -C \
                "1: :(json form text bin)"
            return 0
            ;;
        patch | delete | *)
            return 0
            ;;
        esac
        return 0
    fi
}

if [ -n "${BASH_VERSION}" ]; then
    complete -F _gt_complete gt_token gt_current gt_config gt_resp gt_user gt_enterprise gt_org gt_repo gt_repo_url \
        gt_repo_clone gt_repo_member gt_repo_page gt_repo_release gt_repo_release_attachment gt_repo_pr gt_repo_pr_assign gt_repo_pr_testers
    complete -F _gt_request_complete gt_request
else
    compdef _gt_complete gt_token gt_current gt_config gt_resp gt_user gt_enterprise gt_org gt_repo gt_repo_url \
        gt_repo_clone gt_repo_member gt_repo_page gt_repo_release gt_repo_release_attachment gt_repo_pr gt_repo_pr_assign gt_repo_pr_testers
    compdef _gt_request_complete gt_request
fi
