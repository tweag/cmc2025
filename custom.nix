{ lib, pkgs, config, ... }: {

  imports = [
    ./user/base.nix
  ];

  config = {
    python = true;

    packages = [
      pkgs.fortune
      pkgs.cowsay
    ];
  };

}
