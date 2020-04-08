#!/usr/bin/env nix-shell
#!nix-shell -p nix-universal-prefetch -p curl -i bash

set -e
set -u

branch="nixos-unstable"

rev="$(
	curl -Ls \
		-H "Accept: application/vnd.github.v3.sha" \
		"https://api.github.com/repos/NixOS/nixpkgs/commits/$branch"
)"

url="https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz"

hash="$(nix-universal-prefetch builtins.fetchTarball \
	--url "$url"
)"
cat <<EOF
let
  nixpkgs-unstable = fetchTarball {
    url = "$url";
    sha256 = "$hash";
  };
  pkgs = import nixpkgs-unstable {};
in
  pkgs.runCommandNoCC "nixpkgs-unstable" {} ''
    ln -s \${nixpkgs-unstable} \$out
  ''
EOF
