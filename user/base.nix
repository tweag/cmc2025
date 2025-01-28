{ lib, pkgs, config, ... }: {

  options = {
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
    '';

    activationScript = pkgs.writeShellScriptBin "activate-shell" ''
      exec bash --rcfile ${config.shellInit} -i
    '';
  };
}
