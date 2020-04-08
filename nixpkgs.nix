let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/d6260a33e43a500528b2be834d3ee4ad45441a6a.tar.gz";
    sha256 = "18ailgn3d8smjdg66di3mg1q1l86s2s5ch856ifzy5kc3a224ssf";
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommandNoCC "nixpkgs-stable" {} ''
    ln -s ${nixpkgs} $out
  ''
