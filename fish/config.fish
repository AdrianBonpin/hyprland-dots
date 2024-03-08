if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/catppuccin_macchiato.omp.json | source

set -g fish_greeting

alias ls="eza --icons"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
