#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add mirror "$INPUT_TARGET_REPO_URL"
git push --tags --force --prune mirror "refs/remotes/origin/develop:refs/heads/develop"
git push --tags --force --prune mirror "refs/remotes/origin/master:refs/heads/master"
git push --tags --force --prune mirror "refs/remotes/origin/feature-testing:refs/heads/feature-testing"
