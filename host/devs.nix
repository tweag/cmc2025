{ lib, pkgs, config, ... }: {

  options = {
    devs = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = {
    etc."motd" = pkgs.writeText "motd" ''
      Stock up coffee for ${lib.concatStringsSep " and " config.devs}!
    '';

    users = lib.genAttrs config.devs (user: {
      python = true;
    });
  };

}
