# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    asdf
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ----- My config -----

# -- LLVM
export PATH="/opt/homebrew/Cellar/llvm/17.0.6_1/bin:$PATH"

# -- Racket 
export PATH="/Applications/Racket v8.9/bin:$PATH"

# -- Unicorn
export LD_LIBRARY_PATH="${HOME}/fuzzing/unicorn/"

# -- Haskell
[ -f "${HOME}/.ghcup/env" ] && source "${HOME}/.ghcup/env"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"


# -- asdf 
# . /opt/homebrew/opt/asdf/libexec/asdf.sh

# -- starship
eval "$(starship init zsh)"

# -- binaries installed in .local/bin
export PATH="$PATH:$HOME/.local/bin"

# -- npm
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# -- iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# -- Starkli
. "${HOME}/.starkli/env"

# -- CLI tools and aliases
alias ls="eza --icons=always"
eval "$(zoxide init zsh)"
alias cd="z"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# --- FZF
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


#----- Setting nvim as default editor and aliases
export VISUAL=nvim

alias vim=nvim
alias vi=nvim

