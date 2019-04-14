
LOCAL_PATH="${BASH_SOURCE%/*}"

source ${LOCAL_PATH}/profile
source ${LOCAL_PATH}/aliases

# Opens the github page for the current git repository in your browser
# git@github.com:jasonneylon/dotfiles.git
# https://github.com/jasonneylon/dotfiles/
function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl/tree/$branch
  open $giturl
}


# alias cleanlogs="jq -rR 'fromjson? | \"\(.asctime) [\(.levelname)] \(.message) \(.exc_text)\"'"

alias cleanlogs="jq -rR 'fromjson? | \"\(.asctime) [\(.levelname)] \(.message) \(.exc_text)\"'"

export CLOUDSDK_COMPUTE_ZONE=us-east1-b
export PATH=/usr/local/opt/openssl/bin:/Users/ababkin/.local/bin:$PATH:/Users/ababkin/bin:/usr/local/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ababkin/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ababkin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ababkin/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ababkin/google-cloud-sdk/completion.bash.inc'; fi

# Put GHC on the path globally
GHC_PATH=`stack path | grep compiler-bin | sed -e 's/compiler-bin: //'`
export PATH="$GHC_PATH:$PATH:~/.emacs.d/bin"

