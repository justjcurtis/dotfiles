#vars
export winusr="$(cmd.exe /c "<nul set /p=%username%" 2>/dev/null)"

#dotfiles_update
alias .upv='cp ~/.vimrc /mnt/c/Users/$winusr/Documents/dotfiles/vimrc'
alias .upb='cp ~/.bashrc /mnt/c/Users/$winusr/Documents/dotfiles/bashrc'
alias .upa='cp ~/.bash_aliases /mnt/c/Users/$winusr/Documents/dotfiles/bash_aliases'
alias .up='.upv;.upb;.upa'
alias .upv.='cp ~/.vimrc ./vimrc'
alias .upb.='cp ~/.bashrc ./bashrc'
alias .upa.='cp ~/.bash_aliases ./bash_aliases'
alias .up.='.upv.;.upb.;.upa.'

alias .dv='sudo cp /mnt/c/Users/$winusr/Documents/dotfiles/vimrc ~/.vimrc'
alias .db='sudo cp /mnt/c/Users/$winusr/Documents/dotfiles/bashrc ~/.bashrc'
alias .da='sudo cp /mnt/c/Users/$winusr/Documents/dotfiles/bash_aliases ~/.bash_aliases'
alias .d='.dv; .db; .da'
alias .dv.='sudo cp ./vimrc ~/.vimrc'
alias .db.='sudo cp ./bashrc ~/.bashrc'
alias .da.='sudo cp ./bash_aliases ~/.bash_aliases'
alias .d.='.dv.; .db.; .da.'

#quickedit
alias na='sudo nano ~/.bash_aliases'
alias nb='sudo nano ~/.bashrc'
alias va='sudo v ~/.bash_aliases'
alias vb='sudo v ~/.bashrc'
alias sa='source ~/.bash_aliases'
alias sb='source ~/.bashrc'
alias nv='sudo nano ~/.vimrc'
alias vv='sudo v ~/.vimrc'

#quickchange
alias cdh='cd /mnt/c/Users/$winusr/'
alias dot='cdh;cd Documents/dotfiles/'
alias appdata='cd /mnt/Users/$winusr/AppData/'
alias cdd='cd /mnt/c/Users/$winusr/Documents/'
alias ..='cd ..'

#quicklaunch
alias e='/mnt/c/Windows/explorer.exe'
alias vc='code'
alias py='python3'
alias v='vim'
alias n='nano'

#System
alias c="clear"
alias x="exit"
alias h="history"
alias hg="h | grep"
alias bc="bc -l"
alias fastping='ping -c 100 -s.2'
alias wget='wget -c'
alias targz='f() { tar -zcvf $1.tar.gz $1; rm -r $1; }; f'
alias untargz='f() { tar -zxvf $1; rm -r $1; }; f'

#FileSystem
alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias f="find"
alias ff='f . -type f -iname'
alias fd='f . -type d -iname'
alias fa='f . -iname'
alias fg='_() { f | grep $*; }; _'
alias ffg='_() { f -type f | grep $*; }; _'
alias fdg='_() { f -type d | grep $*; }; _'
#Git
alias g="hub"

##git setup
alias gc="g clone"
alias gi="g init"
alias gI="cp '~/gitignore' '.gitignore'"
alias gRa="g remote add"
alias gU='f(){ g config credential.${remote}.username $1; g config credential.helper store; }; f'
alias ggunset="g config --global --unset credential.helper"
alias grunset="g config --unset credential.helper"

##git control
alias gs="g status"
alias gss="g fetch;gs"
alias grm="g rm"
alias grm.="grm ."
alias ga="g add"
alias ga.="ga ."
alias gcof='gco -f'
alias gcof.="gcof ."
alias gr="g reset"
alias gbk="gr HEAD~"
alias gfw="gr 'HEAD@{1}'"
alias grh="gr --soft HEAD"
alias gid="g rev-parse HEAD"
alias gids="g rev-parse --short HEAD"
alias gl="g log"
alias glg="gl | grep"
alias cg="c;gs"
alias ghi="gf;c;ginfo"
alias ginfo="gf;gbr;gb;gs"
alias gmc='git diff --diff-filter=U'
alias gmcn='gmc --name-only'
alias gfc="gf;cg"
alias cgs="cg -s"
alias gfcs="gf;cgs"
alias gsg="gs | grep"
alias cgg="cg | grep"
alias gDrop="ga.;gS;gSd 0"

##git commit
alias gC="g commit"
alias gCm="gC -m"
alias gCam="gC -a -m"

##git remote
alias gf="g fetch"
alias gp="g pull"
alias gP="g push"

##git branch
alias gb="g branch"
alias gba="gb -a"
alias gbag="gba | grep"
alias gbg="gb | grep"
alias gbd="gb -D"
alias gbrd="gP origin --delete"
alias gbr="gb -r"
alias gbrg="gbr | grep"
alias gbv="gb -vv"
alias gbm="gb -m"
alias gbrm="gP origin :"
alias gPou="gP origin -u"
alias gco="g checkout"
alias gD="gco development"
alias gcob="gco -b"
alias gm="g merge"
alias gPsuo="gP --set-upstream origin"

##git stash
alias sgrep='f() { ref=$(g --no-pager stash list | grep "$1" | cut -d: -f1 | head -n1); echo ${ref:-<no_match>}; }; f'
alias gS="g stash"
alias gSl="gS list"
alias gSp="gS pop"
alias gSa="gS apply"
alias gSc="gS clear"
alias gSs="gS;gSa 0"
alias gScs="gSc;gS"
alias gSr="gSc;gSs"
alias gSsw="f() { g stash show stash^{/$*} -p; }; f"
alias gSap="f() { g stash apply stash^{/$*}; }; f"
alias gSsv="gS save"
alias gSd='f(){ g stash drop stash@{$1}; }; f'
alias gSds='f() { git stash drop $(sgrep $1); }; f'

##git misc
alias k="gitk"

#FUNCS

#Git-Funcs
alias gB='_(){ gcob "$1"; gPsuo "$1"; gb; gbr; gs; }; _'
alias gbM='_(){ gco "$1"; gbm "$2"; gbrd "$1"; gco "$2"; gPou "$2"; }; _'
alias gpbM='_(){ gp; gco "$1"; gbm "$2"; gbrd "$1"; gco "$2"; gPou "$2"; }; _' 
alias gcorb='_(){ g checkout -b "$1" "origin/$1";}; _'

