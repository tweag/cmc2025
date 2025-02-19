{ lib, pkgs, config, ... }: {
  _class = "user";

  imports = [
    ./python.nix
  ];

  options = {
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };

    shellInit = lib.mkOption {
      type = lib.types.package;
    };

    activationScript = lib.mkOption {
      type = lib.types.package;
    };
  };

  config = {
    shellInit = pkgs.writeText "init.sh" ''
      echo "Hello, CfgMgmtCamp 2025!"
      export PATH=${lib.makeBinPath config.packages}:$PATH
    '';

    activationScript = pkgs.writeShellScriptBin "activate-user" ''
      ln -sfv ${config.shellInit} ~/.zshrc
    '';
  };
}
