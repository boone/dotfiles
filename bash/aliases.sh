alias ls="ls -G"
alias g="git"

# PS1
export RUBYOPT=-Ku
alias ls='ls -G'
alias rc='rm -rf spec/cassettes features/cassettes'

# Bundle
alias be='bundle exec'

# Vim
alias v='vim'

# bashrc
alias prof='cat ~/.bashrc'
alias profe='vim ~/.bashrc'
alias sp='source ~/.bashrc'

# Git aliases
alias gs='git status'
alias grc='git rebase --continue'
alias gad='git add'
alias ga='git add .'
alias gb='git branch'
alias gci='git commit'
alias gcim='git commit -m'
alias gco='git checkout'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gsh='git show'
alias glg='git log'
alias gpr='git pull --rebase'
alias gps='git push'
alias gempty='git commit --allow-empty -m "empty"'
alias gcount='git shortlog -sn'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias dbranchs="git branch | sed 's/master//' | sed 's/\*//' | sed '/^$/d' | xargs git branch -D"
alias fixup='git add -A . && git ci -m "fixup"'
alias rebase='rm -f /tmp/last_branch; (echo `git branch | sed -n "/\* /s///p"`) > /tmp/last_branch; git checkout master; git pull --rebase; git checkout `cat /tmp/last_branch`; git rebase master'

# Projects
alias monocle='cd /Users/nakamura/source/Monocle'
alias helix='cd /Users/nakamura/source/site5/helix'
alias glados='cd /Users/nakamura/source/site5/glados'
alias san='cd /Users/nakamura/source/site5/software_dev_ansible'
alias data='cd /Users/nakamura/source/site5/data'
alias worm='cd /Users/nakamura/source/site5/wormhole'
alias helix_boxed='cd /Users/nakamura/source/site5/helix_boxed'
alias helix_core='cd /Users/nakamura/source/site5/helix_core'
alias backstage='cd /Users/nakamura/source/site5/backstage'
alias event_horizon='cd /Users/nakamura/source/site5/event_horizon'
alias picturalia='cd /Users/nakamura/source/picturalia'
alias gallery='cd /Users/nakamura/source/gallery'
alias nigiri='cd /Users/nakamura/source/nigiri'
alias spectre='/Users/nakamura/source/Site5\ other/spectre'

# Vagrant alias
alias vs="vagrant status"
alias vu="vagrant up"
alias vp="vagrant provision"

# whatever
alias killruby="killall -9 ruby"
