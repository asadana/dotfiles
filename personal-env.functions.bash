#!/usr/bin/env bash

# stashes the uncommited code, pulls from origin then unstashes
# Warning if there are conflicts it will not show in interactive UI
branchUpdate() {
	stashRunUnstash() {
		unCommittedChanges="Changes not staged for commit:"

		if git status | grep "$unCommittedChanges" ; then
			echo -e "\nSaving changes to stash\n" && \
			git stash save && \
			echo -e "\nPulling from tracking repo..\n" && \
			$1 && \
			echo -e "\nUnstashing changes from stash\n" && \
			git stash pop
		else
			echo -e "\nNo local changes found.." && \
			echo -e "\nPulling from tracking repo..\n" && \
			$1
		fi
	}
	stashRunUnstash "git pull --rebase"
}

gitDiffWithBranch() {
	currentBranch=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD))
	git diff HEAD "${1:-$currentBranch}"
}

logDiffBetweenBranches() {
	echo "Showing $1..$2"
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset  %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..$2
	echo
	echo "Showing $2..$1"
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset  %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $2..$1
}

handBrakeConvert() {
	HandBrakeCLI -i "$1" -o "${2:-$(echo "$1" | sed -e 's/\(^.*[sS][0-9][0-9][eE][0-9][0-9]\)\(.*\)/\1/').mp4}" -e x264 -q 21 -B 160 && \
	rm "$1"
}

convertAndRmAllInFolder() {
	for file in $(find "${2:-./}" -type f -name "*.${1:-mkv}"); do
		handBrakeConvert "$file"
	done
}

pullSSLCert() {
	openssl s_client -showcerts -connect "${1}":443 < /dev/null 2> /dev/null | openssl x509 -noout -text
}

# Get keys from mit liscence keys
getGPGKey() {
	gpg --recv-keys --keyserver hkp://pgp.mit.edu $1
}