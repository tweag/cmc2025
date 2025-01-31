{ lib, pkgs, config, ... }: {

  imports = [
    ./user/base.nix
  ];

  config = {
    packages = [
      pkgs.fortune
      pkgs.cowsay
    ];
  };

}
