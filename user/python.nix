{ lib, pkgs, config, ... }: {

  options = {
    python = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    packages = lib.mkIf config.python [
      pkgs.python3
      pkgs.uv
    ];
  };

}
