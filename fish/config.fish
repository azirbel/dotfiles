abbr -a g git
abbr -a go git checkout
abbr -a gi git commit
abbr -a gia git commit -a
abbr -a giaa git commit -a --amend
abbr -a gb git branch
abbr -a gs git status
abbr -a gp git pull
abbr -a gr git rebase
abbr -a grc git rebase --continue
abbr -a gcp git cherry-pick
abbr -a gcpc git cherry-pick --continue
abbr -a gl git log --graph --decorate --pretty=oneline --abbrev-commit
abbr -a gfixdate git commit --amend --date=\"now\"
abbr -a gf git fetch
abbr -a gm git merge
abbr -a wip git commit -a -m "WIP"
abbr -a v vim

abbr -a cdp cd ~/projects
abbr -a cdd cd ~/Desktop

function gu
  abbr -a gu git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)
end

function gbc
  git branch --merged master | grep -v "\*" | grep -v master | xargs git branch -d
end

function pb
  eval $argv | tr -d "\n" | pbcopy
end

alias grb ~/projects/dotfiles/fish/recent_git_branches.rb

abbr -a conf "git diff --name-only --diff-filter=U | xargs vim"
