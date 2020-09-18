let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/faf5bdea5d9f0f9de26deaa7e864cdcd3b15b4e8.tar.gz";
    sha256 = "1sgfyxi4wckivnbniwmg4l6n9v5z6v53c5467d7k7pr2h6nwssfn";
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommandNoCC "nixpkgs-stable" {} ''
    ln -s ${nixpkgs} $out
  ''
