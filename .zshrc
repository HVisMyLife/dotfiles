ricksay

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=4000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hvlife/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH=/usr/share/oh-my-zsh/

export DEFAULT_USER="hvlife"
export TERM="xterm-kitty"
export ZSH=/home/hvlife/.oh-my-zsh
export ZSH_POWER_LEVEL_THEME=/home/hvlife/.oh-my-zsh/custom/themes/powerlevel10k

source $ZSH_POWER_LEVEL_THEME/powerlevel10k.zsh-theme


plugins=(archlinux 
	bundler 
	docker 
	jsontools 
	vscode web-search 
	k
	tig 
	gitfast 
	colored-man-pages
	colorize 
	command-not-found 
	cp 
	dirhistory 
	autojump 
	sudo
	F-Sy-H
	zsh-autosuggestions)
 

DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

ldu() { command du -ahLd 1 2> /dev/null | sort -rh | head -n 20 ; }
rc(){
  systemctl list-unit-files --type=service |\
  sed 's/.service//g' |\
  sed '/static/d' |\
  sed '/indirect/d' |\
  sed '/systemd/d' |\
  sed '/dbus-org/d' |\
  sed '/canberra/d'|\
  sed '/wpa_supplicant/d' |\
  sed '/netctl/d' |\
  sed '/rfkill/d' |\
  sed '/krb5/d' |\
  tail -n+2 |\
  head -n -2 |\
  sed 's/\(^.*enabled.*$\)/[x] \1/' |\
  sed 's/enabled//g' |\
  sed 's/\(^.*disabled.*$\)/[ ] \1/' |\
  sed 's/disabled//g' |\
  sed 's/[ \t]*$//' |\
  while read line; do
      if [[ $line == *'[x]'* ]]; then
        printf "\033[0;32m$line\n"
      else
        printf "\033[1;30m$line\n"
      fi
  done
  syncthing_status=`systemctl is-active syncthing@${USER}.service`
  if [[ $syncthing_status == "active" ]]; then
    printf "\033[0;32m[x] syncthing (${USER})\n"
  else
    printf "\033[1;30m[ ] syncthing (${USER})\n"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias spotify='LD_PRELOAD=/usr/lib/spotify-adblock.so spotify'
alias lxappearance='GDK_BACKEND=x11 lxappearance'
alias conf='nvim ~/.config/sway/config'
alias jr='/home/hvlife/.config/scripts/boot.sh'
alias smplayer='QT_QPA_PLATFORM=xcb smplayer'
alias vim='nvim'
alias ls='exa --icons --colour=auto -F -G -l'
alias matrix='unimatrix -s 96 -a -b -f'
alias cat='lolcat -f -t'

dtf () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

