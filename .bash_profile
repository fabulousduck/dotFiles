### Aliases

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

#mongodb
alias mlaunch="sudo ./Downloads/mongodb-osx-x86_64-3.2.9/bin/mongod"
alias mline="./Downloads/mongodb-osx-x86_64-3.2.9/bin/mongo"
alias mimport="./Downloads/mongodb-osx-x86_64-3.2.9/bin/mongoimport $@"

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Own personal command shorthands

alias browser='/usr/bin/open -a "/Applications/Google Chrome.app" "$@"'
alias cls='clear'
alias workdir='cd /Applications/MAMP/htdocs/Bannerwise'
alias heku='git add . && git commit -am "s-$1" && git push heroku github-api:master'
alias sip='echo 51.15.1.150'
alias vim="vi"


#golang
alias gp='go run $1'
alias goDir='cd ~/Desktop/GoLang/src/github.com/fabulousduck/'
alias tet="gp ~/Desktop/GoLang/src/TetraCrypt/main.go $1"
alias cln="gp ~/Desktop/Golang/src/github.com/fabulousduck/janitor/test/main.go"

#c++
alias g++="g++ -std=c++11 $@"

#ssh

alias srv="ssh fabulousduck@51.15.1.150"

# Git
# You must install Git first
alias gb='git branch $@'
alias gck='git checkout $@'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gip='git push'
alias grm='git rm $(git ls-files --deleted)'

# utility

alias ktw='kill -9 $$'

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="⚡ "

export PS1="\[${MAGENTA}\]\u \[$RESET\]in \[$GREEN\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Misc


#vsc function

#code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

#tab function

[ `uname -s` != "Darwin" ] && return

function tab () {
    local cmd=""
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        cmd="; $args"
    fi

    osascript &>/dev/null <<EOF
        tell application "iTerm"
            tell current terminal
                launch session "Default Session"
                tell the last session
                    write text "cd \"$cdto\"$cmd"
                end tell
            end tell
        end tell
EOF
}

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
. ~/z.sh


export GOPATH=~/Desktop/GoLang
export LESS="-R"
#opencv stuff

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

#boredom stuff

#shape args : 1 -> square 2 -> size 3 -> triangle

alias shape="gp ~/Desktop/goLang/src/sizeSquare/main.go $1 $2 $3"
alias comrade="echo yes comrade ?"

export NVM_DIR="/Users/ryanvlaming/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source /Users/ryanvlaming/git-autocomplete.sh


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryanvlaming/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ryanvlaming/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryanvlaming/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ryanvlaming/Downloads/google-cloud-sdk/completion.bash.inc'; fi

##
# Your previous /Users/ryanvlaming/.bash_profile file was backed up as /Users/ryanvlaming/.bash_profile.macports-saved_2017-04-14_at_11:09:25
##

# MacPorts Installer addition on 2017-04-14_at_11:09:25: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2017-04-14_at_11:09:25: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

