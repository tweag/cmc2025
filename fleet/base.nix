{ lib, pkgs, config, ... }: {
  _class = "fleet";

  options = {
    hosts = lib.mkOption {
      type = lib.types.attrsOf
        (lib.types.submodule ../host/base.nix);
      default = { };
    };

    activationScript = lib.mkOption {
      type = lib.types.package;
    };
  };

  config = {
    activationScript = pkgs.writeShellScriptBin "activate-fleet" ''
      ${lib.concatMapAttrsStringSep "\n" (host: cfg: ''
        prefix ${host} \
          ssh ${cfg.ip} \
          ${cfg.activationScript}/bin/activate*
      '') config.hosts}
    '';
    };

}
