#!/usr/bin/env bash

git.has_modified_files() {
    if git diff --exit-code --quiet;
    then
        return 1;
    else
        return 0;
    fi
}

git.fetch() {
    git fetch;
}

git.branch_is_behind() {
    git status | grep "behind" -q;
}

git.commits_to_pull() {
    git status | grep "behind" | sed -e 's/.*by \(.*\) commit.*/\1/'
}

git.list_commits_to_pull() {
    git log --pretty=oneline --abbrev-commit ..origin/$(git.current_branch);
}

git.pull() {
    git pull;
}

git.remote_url() {
    git config --get remote.origin.url;
}

git.current_branch() {
    git branch | grep \* | cut -d ' ' -f2;
}

git.status() {
    git status | grep "modified";
	printf "\n";
}

git.is_valid_repository() {
    if [ -d .git ];
    then
        return 0;
    else
        return 1;
    fi
}

git.hard_reset() {
    git reset --hard;
}
