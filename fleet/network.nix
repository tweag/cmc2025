{ lib, pkgs, config, ... }: {

  options = {
    network = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = {
    hosts = lib.genAttrs config.network (host: {
      etc."hosts" = pkgs.writeText "hosts" ''
        127.0.0.1 localhost
        ${lib.concatMapStringsSep "\n" (host: ''
          ${config.hosts."${host}".ip} ${host}
        '') config.network}
      '';
    });
  };

}
