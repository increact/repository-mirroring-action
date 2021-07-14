#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
whoami
cd "$INPUT_PATH"
git fetch
git checkout develop
git checkout master
git checkout feature-testing
git remote add mirror "$INPUT_TARGET_REPO_URL"
git checkout develop
git push mirror develop
git checkout master
git push mirror master
git checkout feature-testing
git push mirror feature-testing
git remote remove mirror
