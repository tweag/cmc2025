{ lib, pkgs, config, ... }: {
  _class = "host";

  options = {
    users = lib.mkOption {
      type = lib.types.attrsOf
        (lib.types.submodule ../user/base.nix);
      default = { };
    };

    activationScript = lib.mkOption {
      type = lib.types.package;
    };
  };

  config = {
    activationScript = pkgs.writeShellScriptBin "activate-host" ''
      ${lib.concatMapAttrsStringSep "\n" (user: cfg: ''
        echo "Setting up user ${user}"
        sudo useradd --create-home ${user}
        prefix ${user} \
          sudo --user=${user} \
          ${cfg.activationScript}/bin/activate*
      '') config.users}
    '';
  };

}
