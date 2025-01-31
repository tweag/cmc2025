{ lib, pkgs, config, ... }: {

  imports = [
    ./host/base.nix
  ];

  config = {
    devs = [
      "infinisil"
      "neo"
    ];

    users."neo" = {
      packages = [
        pkgs.cmatrix
      ];
    };

    users."infinisil" = {
      # Evaluated with ./user/base.nix

      packages = [
        pkgs.fortune
        pkgs.cowsay
      ];
    };
  };

}
