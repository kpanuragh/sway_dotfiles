export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

plugins=(
    npm
    vi-mode
    composer
    cp
    archlinux
    docker
    docker-compose
    git
    httpie
    rsync
    tmux
    z
)

source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------------
# Configuration
#--------------------------------------------------------------------------

# Decrease delay that vi-mode waits for the end of a key sequence
export KEYTIMEOUT=15

typeset -U path cdpath fpath
path=(
    $HOME/.local/bin
    $HOME/.config/composer/vendor/bin
    $HOME/go/bin
    $HOME/.cargo/bin
    ./vendor/bin
    ${ANDROID_HOME}tools/
    ${ANDROID_HOME}platform-tools/
    $HOME/.config/emacs/bin
    $path
)

setopt auto_cd
cdpath=(
    $HOME/Projects
)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
    'local-directories named-directories'

export EDITOR=vim
export GIT_EDITOR=vim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export ARTISAN_OPEN_ON_MAKE_EDITOR=nvr
export FZF_DEFAULT_COMMAND='ag -u -g ""'
export _java_awt_wm_nonreparenting=1
export moz_enable_wayland=1
export sdl_videodriver=1
alias ls="exa --icons"
alias cat="bat"
unsetopt sharehistory

#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------

alias vim="nvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias cat="bat"
alias webcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2"
alias sail='[ -f sail ] && sail || vendor/bin/sail'
# Laravel
alias a="artisan"
alias tinker="artisan tinker"
alias serve="artisan serve"
alias mfs="artisan migrate:fresh --seed"

# Git
alias g="git"
alias nah="git reset --hard;git clean -df"
alias co="git checkout"
alias main='git checkout $([ `git rev-parse --quiet --verify master` ] && echo "master" || echo "main")'
alias soc="source ~/.zshrc"
# Docker
alias d="docker"
alias dc="docker compose"
#lms  
alias lms="cd ~/Projects/oelms9/docker && dc up -d && cd .. && source ~/.zshrc"
alias lms_cb="d exec -it oelms-app nodemon --exec 'php src/crons/combine.php' --ignore src/public"
alias lms_ug="d exec -it oelms-app php src/crons/upgrade.php"
alias lms_log="docker exec -it oelms-app tail -f /var/log/apache2/openlms_errorlog.log"
alias lms_cron="docker exec -it oelms-app php src/crons/cron-tasks.php"
alias ssh="TERM=xterm-256color ssh"
alias npms="npm start"
container_name=$(docker ps --format '{{.Names}}' | grep -E 'app$|php$' | head -n 1)
dc_cp(){
  docker cp $1  $2:$3
}
dc_shell(){
docker exec -it $1 $2 
}
open () {
    xdg-open $* > /dev/null 2>&1
}

composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

#--------------------------------------------------------------------------
# Miscellaneous
#--------------------------------------------------------------------------

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -z "${wayland_display}" ] && [ "${xdg_vtnr}" -eq 1 ]; then
  exec sway
fi


PATH="/home/anuragh/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/anuragh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/anuragh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/anuragh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/anuragh/perl5"; export PERL_MM_OPT;
