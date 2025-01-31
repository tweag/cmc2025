{ lib, pkgs, config, ... }: {

  imports = [
    ./host/base.nix
  ];

  config = {
    users."neo" = {
      packages = [
        pkgs.cmatrix
      ];
    };

    users."infinisil" = {
      # Evaluated with ./user/base.nix

      python = true;

      packages = [
        pkgs.fortune
        pkgs.cowsay
      ];
    };
  };

}
