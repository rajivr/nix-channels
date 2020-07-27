let
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/28fce082c8ca1a8fb3dfac5c938829e51fb314c8.tar.gz";
    sha256 = "1pzmqgby1g9ypdn6wgxmbhp6hr55dhhrccn67knrpy93vib9wf8r";
  };
  pkgs = import nixpkgs-unstable {};
in
  pkgs.runCommandNoCC "nixpkgs-unstable" {} ''
    ln -s ${nixpkgs-unstable} $out
  ''
