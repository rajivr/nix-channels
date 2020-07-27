let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/b50d55871fb7de1e5791bbd56738ff20f4d15f2c.tar.gz";
    sha256 = "0sxkpacyzpmc5n658pj287j6bd7sc2d6r1azyrpmd5fyx8q1ihvs";
  };
  pkgs = import nixpkgs {};
in
  pkgs.runCommandNoCC "nixpkgs-stable" {} ''
    ln -s ${nixpkgs} $out
  ''
