# This is a bit too noisy for the demo, it sets the submodule class
# and makes sure all submodules get the `pkgs` argument
{ lib, pkgs, ... }: {
  options.users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submoduleWith {
      shorthandOnlyDefinesConfig = true;
      specialArgs = { inherit pkgs; };
      class = "user";
      modules = [ ];
    });
  };
}
