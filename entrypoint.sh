#!/bin/sh -l

set -eu

if [ "${RUN_DIR}" ]; then 
    cd ${RUN_DIR}
    echo "Running git-crypt command from ${RUN_DIR}"
fi

echo "$GIT_CRYPT_KEY" | base64  -d > ./git-crypt-key

git-crypt unlock ./git-crypt-key

rm ./git-crypt-key
