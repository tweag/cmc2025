let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/9e4d5190a9482a1fb9d18adf0bdb83c6e506eaab.tar.gz";
    sha256 = "12cq1iq8r8j2mm7sd7wl2mx54xh0nh55rj1kflsjxw9q0n08wqly";
  };
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
  inherit (pkgs) lib;

  eval = lib.evalModules {
    modules = [
      ./custom.nix
      ./extra.nix
      { _module.args = { inherit pkgs; }; }
    ];
  };
in
eval.config.activationScript
