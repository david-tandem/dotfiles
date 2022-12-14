#!/usr/bin/env bash

cd /workspaces

if [ "${CODESPACES}" = "true" ]; then
    # Remove the default credential helper
    sudo sed -i -E 's/helper =.*//' /etc/gitconfig

    # Add one that just uses secrets available in the Codespace
    git config --global credential.helper "username=${GITHUB_USER}"
    git config --global credential.helper "password=${GH_TOKEN}";
fi

git clone https://github.com/david-tandem/personal-sdk.git