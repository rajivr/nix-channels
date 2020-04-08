#!/usr/bin/env nix-shell
#!nix-shell -p nix-universal-prefetch -p curl -i bash

set -e
set -u

branch="$1"
shift

rev="$(
	curl -Ls \
		-H "Accept: application/vnd.github.v3.sha" \
		"https://api.github.com/repos/NixOS/nixpkgs-channels/commits/$branch"
)"

url="https://github.com/NixOS/nixpkgs-channels/archive/${rev}.tar.gz"

hash="$(nix-universal-prefetch builtins.fetchTarball \
	--url "$url"
)"
cat <<EOF
let
  nixpkgs = fetchTarball {
    url = "$url";
    sha256 = "$hash";
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommandNoCC "nixpkgs-stable" {} ''
    ln -s \${nixpkgs} \$out
  ''
EOF
