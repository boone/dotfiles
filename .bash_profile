[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin/\:$PATH

alias ls="ls -G"
alias g="git"

# PS1
export PS1='\w$(__git_ps1 "(%s)") > '
export RUBYOPT=-Ku
alias ls='ls -G'
alias rc='rm -rf spec/cassettes features/cassettes'

# Projects
alias iba='cd ~/source/iba && vim .'
alias ibam='cd ~/source/iba && rake morning && vim .'
alias rayku='cd ~/source/rayku'
alias white='cd ~/source/rayku/whiteboard && vim .'

# Bundle
alias be='bundle exec'

# Git aliases
alias gst='git status'
alias gad='git add'
alias gbr='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gsh='git show'
alias glg='git log'
alias gpr='git pull --rebase'
alias gps='git push'

# Vim
alias v='vim'

alias prof='cat ~/.bash_profile'
alias profe='vim ~/.bash_profile'
alias sourcep='source ~/.bash_profile'
alias capobj='cd ~/source/capybara-page-object && v .'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Vagrant alias
alias vs="vagrant status"
alias vu="vagrant up"
alias vp="vagrant provision"
