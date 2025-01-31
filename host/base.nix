{ lib, pkgs, config, ... }: {
  _class = "host";

  imports = [
    ./devs.nix
  ];

  options = {
    etc = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      default = { };
    };

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
      echo "Setting up /etc"
      ${lib.concatMapAttrsStringSep "\n" (file: pkg: ''
        sudo ln -sfv ${pkg} /etc/${file}
      '') config.etc}

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
