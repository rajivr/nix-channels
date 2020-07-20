let
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/a5cc7d3197705f933d88e97c0c61849219ce76c1.tar.gz";
    sha256 = "0b7y2nv5nj776zh9jwir8fq1qrgcqpaap05qxlxp9qfngw12k6ji";
  };
  pkgs = import nixpkgs-unstable {};
in
  pkgs.runCommandNoCC "nixpkgs-unstable" {} ''
    ln -s ${nixpkgs-unstable} $out
  ''
