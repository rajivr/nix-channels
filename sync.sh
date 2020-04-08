#!/usr/bin/env bash

set -e
set -u
PS4=" $ "

unset NIX_PATH

set -x

nix-build "./nixpkgs.nix" --out-link "nixpkgs"
