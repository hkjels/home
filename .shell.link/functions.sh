
# Find file by name

function f() {
  find . -iname "$1" -print
}


# Open file/directory

function o() {
  if [[ -n $1 ]]; then open $1
  else open .
  fi
}


# Make directory and `cd` into it

function mcd() {
  mkdir -p "$1" && cd "$1"
}


# Character to use as prefix at the prompt

function prompt_char() {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  echo 'λ'
}


# Version control information
# TODO #Color branch name by status

function prompt_vc() {
  BRANCH=$(command git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [ $BRANCH ] && echo "($BRANCH)" || return
}


# Find an html-element with the specified classname

function class() {
  ack "class=.+$1"
}


# Helper to extract different archives
# Stolen from zshuery

function ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tar.xz) tar xvJf $1;;
      *.tar.lzma) tar --lzma xvf $1;;
      *.bz2) bunzip $1;;
      *.rar) unrar $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *.dmg) hdiutul mount $1;; # mount OS X disk images
      *) echo "'$1' cannot be extracted via >ex<";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Retrieve public IP-address

function myip() {
  wget http://ipecho.net/plain -O - -q ; echo
}


# Jump directly to the root of a git-project with `cd ^`

function cd {
  case $1 in
    ^ )
      builtin cd $(git root) ;;
    * )
      builtin cd "$@" ;;
  esac
}


# Zshell vi-bindings

function zshBindings() {

  # Vim-styled input

  bindkey -v


  # Search backwards and forwards with a pattern

  bindkey -M vicmd '/' history-incremental-pattern-search-backward
  bindkey -M vicmd '?' history-incremental-pattern-search-forward
  bindkey -M viins '^R' history-incremental-pattern-search-backward
  bindkey -M viins '^F' history-incremental-pattern-search-forward


  # Add some convenient emacs-like shortcuts back

  bindkey "" beginning-of-line
  bindkey "" end-of-line
  bindkey "" backward-char
  bindkey "" forward-char
  bindkey "" backward-word
  bindkey "" forward-word
  bindkey "" kill-line

}


# Bash vi-bindings

function bashBindings() {
  set -o vi
}

