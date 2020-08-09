let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/5ac56e221fac62435ceabe174dfcb9a062d89d0d.tar.gz";
    sha256 = "0jk7vbl59l19d2w2n46hgh2h1aiy4k8a8skh59sypgma42kmmrrb";
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommandNoCC "nixpkgs-stable" {} ''
    ln -s ${nixpkgs} $out
  ''
