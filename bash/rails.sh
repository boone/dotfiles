alias migrate="be rake db:drop; be rake db:create; be rake db:migrate; RAILS_ENV=test be rake db:drop; be rake db:create; be rake db:migrate;"
alias setup="be rake db:setup"
alias cspec='git diff --name-only | grep _spec | xargs bundle exec  rspec'
