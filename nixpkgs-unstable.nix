let
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/55668eb671b915b49bcaaeec4518cc49d8de0a99.tar.gz";
    sha256 = "0b2mrrjsdpxpyvnv98dph5av3xjps1mbd87x8510mnc4pfa2zc8z";
  };
  pkgs = import nixpkgs-unstable {};
in
  pkgs.runCommandNoCC "nixpkgs-unstable" {} ''
    ln -s ${nixpkgs-unstable} $out
  ''
