let
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/b50ef9afa11b384c72f7123ca4760ebc6d199fe8.tar.gz";
    sha256 = "0b6xjysxydiax765sia3dpnc3xi648aq4zjlxpiqzsh3hpsq0ch8";
  };
  pkgs = import nixpkgs-unstable {};
in
  pkgs.runCommandNoCC "nixpkgs-unstable" {} ''
    ln -s ${nixpkgs-unstable} $out
  ''
