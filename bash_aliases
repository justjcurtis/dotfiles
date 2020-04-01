#vars
export winusr="$(cmd.exe /c "<nul set /p=%username%" 2>/dev/null)"
export home="$(uname -a | awk -v var="$winusr" '{ if($3 ~ /Microsoft/) print "/mnt/c/Users/"var ; else print "~"}')"

#dotfiles_update
alias .upv='cp ~/.vimrc ~/Documents/dotfiles/vimrc'
alias .upb='cp ~/.bashrc ~/Documents/dotfiles/bashrc'
alias .upa='cp ~/.bash_aliases ~/Documents/dotfiles/bash_aliases'
alias .up='.upv;.upb;.upa'
alias .upv.='cp ~/.vimrc ./vimrc'
alias .upb.='cp ~/.bashrc ./bashrc'
alias .upa.='cp ~/.bash_aliases ./bash_aliases'
alias .up.='.upv.;.upb.;.upa.'

alias .dv='sudo cp ~/Documents/dotfiles/vimrc ~/.vimrc'
alias .db='sudo cp ~/Documents/dotfiles/bashrc ~/.bashrc'
alias .da='sudo cp ~/Documents/dotfiles/bash_aliases ~/.bash_aliases'
alias .d='.dv; .db; .da;sb'
alias .dv.='sudo cp ./vimrc ~/.vimrc'
alias .db.='sudo cp ./bashrc ~/.bashrc'
alias .da.='sudo cp ./bash_aliases ~/.bash_aliases'
alias .d.='.dv.; .db.; .da.;sb'

#quickedit
alias nl='sudo nano ~/.local_aliases'
alias vl='sudo vim ~/.local_aliases'
alias na='sudo nano ~/.bash_aliases'
alias nb='sudo nano ~/.bashrc'
alias np='sudo nano ~/.bash_profile'
alias va='sudo vim ~/.bash_aliases'
alias vb='sudo vim ~/.bashrc'
alias vp='sudo vim ~/.bash_profile'
alias sa='source ~/.bash_aliases'
alias sb='source ~/.bashrc'
alias nv='sudo nano ~/.vimrc'
alias vv='sudo vim ~/.vimrc'
alias ng='sudo vim ~/.gitignore'
alias vg='sudo vim ~/.gitignore'

#quickchange
alias cdh='cd ~'
alias dot='cd ~/Documents/dotfiles/'
alias appdata='cd ~/AppData/'
alias cdd='cd ~/Documents/'
alias ..='cd ..'

#quicklaunch
alias e='/mnt/c/Windows/explorer.exe'
alias vc='code'
alias py='python3'
alias v='vim'
alias n='nano'

#System
alias music="gcc -xc -oa -<<<'i;g(x,t,o){return(3&x&(i*((3&i>>16?\"BY}6YB6%\":\"Qj}6jQ6%\")[t%8]+51)>>o))<<4;}main(n,s){for(;;)putchar(g(1,n=++i>>14,12)+g(s=i>>17,n^i>>13,10)+g(s/3,n+(i>>11)%3,10)+g(s/5,8+n-(i>>10)%3,9));}';./a|aplay"
alias c="clear"
alias cl="c; ls"
alias ca="c; la"
alias x="exit"
alias j="jobs -l"
alias pth='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias h="history"
alias hg="h | grep"
alias bc="bc -l"
alias sha='shasum -a 256 '
alias fastping='ping -c 100 -s.2'
alias wget='wget -c'
alias targz='f() { tar -zcvf $1.tar.gz $1; rm -r $1; }; f'
alias untargz='f() { tar -zxvf $1; rm -r $1; }; f'
alias unlockbrew='rm -rf /usr/local/var/homebrew/locks'
alias ct='crontab'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias globalgi='git config --global core.excludesfile ~/.gitignore'

#FileSystem
alias delhid="find . -maxdepth 1 -name '*._*' -delete"
alias delds='find . -name '.DS_Store' -delete'
alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias f="find"
alias ff='f . -type f -iname'
alias fd='f . -type d -iname'
alias fa='f . -iname'
alias fg='_() { f | grep $*; }; _'
alias ffg='_() { f -type f | grep $*; }; _'
alias fdg='_() { f -type d | grep $*; }; _'
alias lg='_() { ls | grep $*; }; _'
alias lag='_() { ls -a | grep $*; }; _'
alias llg='_() { ls -l | grep $*; }; _'

#Git
alias g="hub"

##git setup
alias gc="g clone"
alias gi="g init"
alias gir="g create"
alias gI="cp '~/gitignore' '.gitignore'"
alias gRa="g remote add"
alias gU='f(){ g config credential.${remote}.username $1; g config credential.helper store; }; f'
alias ggunset="g config --global --unset credential.helper"
alias grunset="g config --unset credential.helper"
alias gguser="g config --global user.name"
alias gruser="g config user.name"
alias ggemail='g config --global user.email'
alias gremail='g config user.email'

##git control
alias gs="g status"
alias gss="g fetch;gs"
alias grm="g rm"
alias grm.="grm ."
alias ga="g add"
alias ga.="ga ."
alias gcof='gco -f'
alias gcof.="gcof ."
alias gd="g diff"
alias gr="g reset"
alias grhard="gr --hard"
alias grsoft="gr --soft"
alias gl='g log'
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
alias gt='g tag'
alias gignore='g update-index --assume-unchanged'
alias gunignore='g update-index --no-assume-unchanged'
alias gignored='g !git ls-files -v | grep "^[[:lower:]]"'

##git commit
alias gC="g commit"
alias gCm="gC -m"
alias gCam="gC -a -m"

##git remote
alias gf="g fetch"
alias gp="g pull"
alias gP="g push"
alias gpr="g pr list"
alias gprg="gpr | grep"

##git branch
alias gb="g branch"
alias gba="gb -a"
alias gbag="gba | grep"
alias gbg="gb | grep"
alias gbd="gb -D"
alias gbrd="gP origin --delete"
alias gBD='_(){ gbd $1; gbrd $1; }; _'
alias gbr="gb -r"
alias gbrg="gbr | grep"
alias gbv="gb -vv"
alias gbm="gb -m"
alias gbrm="gP origin :"
alias gPou="gP origin -u"
alias gco="g checkout"
alias gD="gco development"
alias gcob='f() { gco -b "$1" "origin/$1"; }; f'
alias gm="g merge"
alias gmd="gm development"
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
alias gB='_(){ gco -b "$1"; gPsuo "$1"; cg; }; _'
alias gbM='_(){ gco "$1"; gbm "$2"; gbrd "$1"; gco "$2"; gPou "$2"; }; _'
alias gpbM='_(){ gp; gco "$1"; gbm "$2"; gbrd "$1"; gco "$2"; gPou "$2"; }; _' 
alias gcorb='_(){ g checkout -b "$1" "origin/$1";}; _'

