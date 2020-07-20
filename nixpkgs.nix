let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/bb8f0cc2279934cc2274afb6d0941de30b6187ae.tar.gz";
    sha256 = "15b4ny9yxk04ml17sflids8sd707yibika1ikz3xi3lf5db0i8gr";
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommandNoCC "nixpkgs-stable" {} ''
    ln -s ${nixpkgs} $out
  ''
