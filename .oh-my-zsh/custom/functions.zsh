# Magic go get
function goget() {
    if [ -z "$1" ];
    then
        echo "Usage: $0 <GHE URL>"
        exit 1
    fi

    URL=$1

    if [[ $URL == https://* ]];
    then
        URL=${URL#'https://'}
    fi

    if [[ $URL == github.com* ]];
    then
        go get $URL
        cd /Users/nag024/Code/src/$URL
    else
        if [[ $URL != *.git ]];
        then
            WITHOUTGIT=$URL
            WITHGIT=$URL".git"
        else
            WITHGIT=$URL
            WITHOUTGIT=${URL%$'.git'}
        fi

        go get $WITHGIT >/dev/null 2>&1

        mv /Users/nag024/Code/src/$WITHGIT /Users/nag024/Code/src/$WITHOUTGIT
        cd /Users/nag024/Code/src/$WITHOUTGIT
    fi
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

function ec2-ssh () {
  ssh $(aws ec2 describe-instances --filter Name=instance-id,Values=$1 | jq '.Reservations[0].Instances[0].PrivateIpAddress' | tr -d '"')
}

function auto-retry() {
    false
    while [ $? -ne 0 ]; do
        "$@" || (sleep 1;false)
    done
}

function ssh-auto-retry() {
    auto-retry ssh "$@"
}