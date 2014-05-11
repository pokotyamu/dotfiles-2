alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#alias ls='ls --color=auto' # @ubuntu
alias ls='ls -G' # @mac
alias ll='ls -lhaF'
alias el='less -S'
alias le='less -S'
alias l='ls'
alias updatedb="sudo /usr/libexec/locate.updatedb" # @mac
alias ..='cd ..'
alias du='du -h'
alias df='df -h'
#alias te='telnet -l hm ienari' # @ubuntu
alias which='which -p' # zsh専用
alias c='pbcopy | sed -e "s/\^\n\$//"'
alias pd='popd'
alias csv='cut -d ","'
alias tsv='cut'
alias psv='cut -d "|"'

## vcs alias
alias g='git'
alias gb='git branch'
alias gs='git show'
alias gg='git status'
alias gc='git ci'
alias gl='git log --graph --decorate --oneline -8'
alias gd='git diff'
alias ga='git add'
alias gp='git push'

alias s='svn'
alias ss='svn st'
alias sc='svn ci'
alias so='svn co'
alias sa='svn add'
alias sd='svn diff'
alias sl='svn log -l 3'
alias sup='svn up'

# emacs
alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'

function emacs () {
    emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
    emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

    if [ 1 -eq `ps aux | grep emacs | grep -v grep | wc -l` ]; then
        if [ $# -eq 0 ]; then
            emacsclient -n .
        else
            emacsclient -n $*
        fi
    else
        open -a emacs $*
    fi
}

alias ee='emacs'
alias em='emacs'
alias emasc='emacs'