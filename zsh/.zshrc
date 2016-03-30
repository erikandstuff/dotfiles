# completion ---------------------------------------------
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
setopt completealiases


# history -------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
setopt hist_ignore_dups
setopt hist_ignore_space
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search


# behavior -------------------------------------------------
unsetopt beep notify
bindkey -v


# prompt ---------------------------------------------------
if [ -f ~/.local/share/zsh/zsh-git-prompt/zshrc.sh ]; then
   export ZSH_THEME_GIT_PROMPT_CACHE=1
   source ~/.local/share/zsh/zsh-git-prompt/zshrc.sh
   RPS1='$(git_super_status) %F{blue}%~%f'
else
   RPS1='%F{blue}%~%f'
fi

PS1='%(?.%F{green}.%F{red})%n@%m%#%f '


# aliases -------------------------------------------------
os=$(uname -s)
if [[ $os == "Darwin" ]]; then
   alias ls='gls -hF --color=auto'
   alias dircolors='gdircolors'
   alias pubkeycopy='cat ~/.ssh/id_rsa.pub|pbcopy'
elif [[ $os == "FreeBSD" ]]; then
   alias ls='gnuls -hF --color=auto'
else 
   alias ls='ls -hF --color=auto'
fi
alias ll='ls -l'
alias la='ll -A'
alias lm='la | more'
alias vi='vim'
alias da='date "+%A, %B %d, %Y [%T]"'
alias grep='grep --color=auto'
alias more='less'
alias ping='ping -c 5'
alias nano='nano -w'
alias wget='wget -c'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -c -h'
alias pg='ps -Af | grep -v grep | grep -i $1'
alias histg='history | grep'
alias extip='curl http://icanhazip.com'
alias svim='sudo -E vim'
alias cpanm='cpanm --notest'

eval $(dircolors ~/.dircolors)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.work ] && source ~/.zshrc.work

true
