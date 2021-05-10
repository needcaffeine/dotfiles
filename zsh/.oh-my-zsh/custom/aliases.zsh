# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# FS operations
alias ll='ls -alGh'
alias ls='ls -Gh'

# mimic vim functions
alias :q='exit'

# Easier navigation
alias ..="cd .."
alias ...="cd ..."
alias ~="cd ~"

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Git aliases
alias g="git"
alias ga="git a"
alias gap="git ap"
alias gb="git b"
alias gc="git c"
alias gcam="git cam"
alias gco="git co"
alias gcp="git cp"
alias gcb="git cb"
alias gd="git d"
alias gdc="git dc"
alias gdep="git deploy"
alias gf="git f"
alias gfo="git f"
alias gl="git l"
alias gm="git m"
alias gp="git p"
alias gpf="git pf"
alias grh="git rh"
alias gs="git s"
alias gst="git st"
alias gstp="git stp"

alias deploy="gst && gfo && gco develop && grh origin/develop && gco master && grh origin/master && gm -v develop && git stp"

# Docker development
alias traefik='docker stop traefik && docker rm traefik; docker pull traefik:v2.0 && docker run --name traefik -d -p 8080:8080 -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock traefik:v2.0 --api.insecure=true --entrypoints.web.address=:80 --entrypoints.web-secure.address=:443 --providers.docker --providers.docker.defaultRule="Host(\`{{ normalize .Name }}.docker\`)"'

# Aliases for bin tools
alias composer.phar="composer"

# Pipe my public/private keys to the clipboard.
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias prikey="more ~/.ssh/id_ed25519 | pbcopy | echo '=> Private key copied to pasteboard.'"
