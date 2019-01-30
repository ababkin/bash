source .profile
source .aliases


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

# ababkin's
export AWS_ACCESS_KEY_ID="AKIAJKUETFFD3PIH5GJA"
export AWS_SECRET_ACCESS_KEY="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"

#export AWS_ACCESS_KEY=AKIAJKUETFFD3PIH5GJA
#export AWS_SECRET_KEY=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

# symbiont
#export AWS_ACCESS_KEY_ID="AKIAJDDO7KDO74L26FOA"
#export AWS_SECRET_ACCESS_KEY="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"


# source '/Users/ababkin/lib/azure-cli/az.completion'

# export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gce/key.json"
# export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"

# alias cleanlogs="jq -rR 'fromjson? | \"\(.asctime) [\(.levelname)] \(.message) \(.exc_text)\"'"

alias cleanlogs="jq -rR 'fromjson? | \"\(.asctime) [\(.levelname)] \(.message) \(.exc_text)\"'"

export CLOUDSDK_COMPUTE_ZONE=us-east1-b
export PATH=/usr/local/opt/openssl/bin:/Users/ababkin/.local/bin:$PATH:/Users/ababkin/bin:/usr/local/bin
export CREDS_S3_URL="s3://nodectl-development-keys/"
export GITHUB_TOKEN="513ff930f4ec8ef4d759c2471dce153b65adf294"
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.2.1/lib/pkgconfig/

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ababkin/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ababkin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ababkin/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ababkin/google-cloud-sdk/completion.bash.inc'; fi

# Put GHC on the path globally
GHC_PATH=`stack path | grep compiler-bin | sed -e 's/compiler-bin: //'`
export PATH="$GHC_PATH:$PATH"

