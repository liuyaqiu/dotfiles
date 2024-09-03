# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/liuyaqiu/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mine"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# export LC_CTYPE=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Base16 Sheel
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# openvpn
alias vpnStart='sudo openvpn /etc/openvpn/client.ovpn > /dev/null &'
alias pingtest='ping www.google.com'

# shadowsocks
alias sstart='sudo sslocal -c /home/liuyaqiu/.ss_conf.json -d start'
alias sstop='sudo sslocal -c /home/liuyaqiu/.ss_conf.json -d stop' 
alias sstart_v4='sudo sslocal -c /home/liuyaqiu/.ss_conf_v4.json -d start'
alias sstop_v4='sudo sslocal -c /home/liuyaqiu/.ss_conf_v4.json -d stop' 

alias sstest='pc curl www.google.com'

# 设置默认编译指令
alias cpl='g++ -std=c++14 -g -o $@ $@'

# 设置iconv指令
uconv() {
    for i in $@
    do
    echo $i
    iconv -f GBK -t UTF-8 $i > tmp
    mv -f tmp $i
    done
}

cpp=/home/liuyaqiu/Documents/Computer\ Science/practice/C++_Primer

# 图形化查看git log信息
alias gittree='git log --graph --decorate --pretty=oneline --all --abbrev-commit'

# 给文件名添加日期
datename() {
    _date=$(date +%F)
    name=${_date}"-"$1
    mv $1 $name
    cp $name $1
    echo $name
}

# 将_drafts中的文件自动推送到_posts中发布
postblog() {
    file=`datename $1`
    echo $file
    cp $file ../_posts
}

encrypt() {
    openssl aes-256-cfb -salt -in $1 -out $1".enc"
}

decrypt() {
    filename=$(getfilename $1)
    openssl aes-256-cfb -d -salt -in $1 -out $filename
}

splitfile() {
    file=$1
    size=$2
    split -d -b $size $file $file
}

getfilename() {
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo $filename
}

# proxychains4代理
alias pc='proxychains4'

# 查单词
dict() {
    var=$1
    grep $var ~/Documents/English/words.txt
}

cutvideo() {
    video=$1
    start_time=$2
    ffmpeg -ss $start_time -i $video -vcodec copy -acodec copy first-$video
}

# set brightness config for laptop
export bright=/sys/class/backlight/intel_backlight/brightness

# export cur path
export cur=$HOME
alias cur='export cur=`pwd`'
alias tocur='cd $cur'

export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# set JAVA_HOME
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
# export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH


export PATH=$HOME/bin:$PATH

lock() {
    i3lock -i /home/liuyaqiu/Pictures/wallpapers/favorite/image.png 
}

# Tex Live 2016
export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH

export LC_CTYPE=zh_CN.utf-8

[ -z "TMUX" ] && export TERM=xterm-256color

alias exchange='xmodmap /home/liuyaqiu/.Xmodmap'

export PATH=/usr/local/node-v8.9.0-linux-x64/bin:$PATH

train() {
    python3 -u $1 | tee -a $2
}

# alias xr="xrandr --output HDMI-1-1 --auto --output eDP-1-1 --off"
alias xr="xrandr --output HDMI-1-1 --mode 3840x2160"

export PATH=/usr/local/jdk1.8.0_201/jre/bin:/usr/local/jdk1.8.0_201/bin:$PATH

alias rm="rm -I"

export bright='/sys/class/backlight/intel_backlight/brightness'
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export SAGE_ROOT=/home/liuyaqiu/opt/SageMath

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias kcp='client_linux_amd64 -r "107.170.195.154:12640" -l ":8426" -mode fast2 -nocomp -autoexpire 900 -sockbuf 16777217 -dscp 46 >> kcp.log 2>&1 &'

alias keyswap='setxkbmap -option "ctrl:swapcaps"'

export MANIM_PATH='/home/liuyaqiu/.local/lib/python3.6/site-packages
/manimlib'

# ytdl() {
#     youtube-dl --proxy socks5://127.0.0.1:1080/  $1 &
# }
ytdl() {
    youtube-dl $1 &
}

PYTHONPATH="$SAGE_ROOT/local/lib/python"
export PYTHONPATH

export PATH=$PATH:~/.local/go/bin
export GOPATH=~/.local/go
# 启用 Go Modules 功能
# go env -w GO111MODULE=on

# 配置 GOPROXY 环境变量，以下三选一

# 1. 七牛 CDN
go env -w  GOPROXY=https://goproxy.cn,direct

# 2. 阿里云
# go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

# go eviornment path

proxy() {
    export http_proxy="http://127.0.0.1:20171"
    export https_proxy="http://127.0.0.1:20171"
}

unproxy() {
    unset http_proxy
    unset https_proxy
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/liuyaqiu/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

# eval "$(ssh-agent -s)"

export EDITOR=vim

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# export GNUPGHOME=~/gnupg-workspace
export KEYID=81EF9267

alias fetch-key='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'

fpath=(/home/liuyaqiu/.zsh/completion $fpath)
compinit

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

yubi-activate() {
    sudo service pcscd restart
    sudo service pcscd status
}

publish-blog() {
    HOST=do-us
    local_path=$1
    remote_root=sites
    if [ ! -d "$local_path" ]; then
        echo "Error: Path '$local_path' does not exist."
        return 1
    fi
    full_path=$(realpath $local_path)
    if [ ! -z $2 ]; then
        base_path=$remote_root/$2
    else
        base_path=$remote_root/$(basename $full_path)
    fi
    echo "sync $full_path to $HOST:"'~'/$base_path/
    test_cmd="test -d "'~'"/${base_path} && rsync"
    rsync -avz --delete --rsync-path=$test_cmd $full_path/ ${HOST}:'~'/${base_path}/
}
