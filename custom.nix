{ lib, pkgs, config, ... }: {

  imports = [
    ./host/base.nix
  ];

  config = {
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
