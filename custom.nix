{ lib, pkgs, config, ... }: {

  imports = [
    ./fleet/base.nix
  ];

  config = {
    hosts."tweag" = {
      # Evaluated with ./host/base.nix
      ip = "192.168.1.1";

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
  };

}
