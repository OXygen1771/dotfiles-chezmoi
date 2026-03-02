if status is-interactive
    if not set -q SSH_AUTH_SOCK
        # mirrors the variable set in environment.d
        set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
    end
end
