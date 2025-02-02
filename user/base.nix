{ lib, pkgs, config, ... }: {

  options = {
    activationScript = lib.mkOption {
      type = lib.types.package;
    };
  };

  config = {
    activationScript = pkgs.writeShellScriptBin "activate" ''
      echo "Hello, CfgMgmtCamp 2025!"
    '';
  };

}
