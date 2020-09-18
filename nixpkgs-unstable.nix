let
  nixpkgs-unstable = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/441a7da8080352881bb52f85e910d8855e83fc55.tar.gz";
    sha256 = "0093drxn7blw4hay41zbqzz1vhldil5sa5p0mwaqy5dn08yn4y3q";
  };
  pkgs = import nixpkgs-unstable {};
in
  pkgs.runCommandNoCC "nixpkgs-unstable" {} ''
    ln -s ${nixpkgs-unstable} $out
  ''
