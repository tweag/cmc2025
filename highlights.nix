{

  # https://github.com/cachix/devenv (3k+ options)
  android.enable = true;

  # https://github.com/nix-community/home-manager (3k+ options)
  wayland.windowManager.sway.enable = true;

  # https://nixos.org/manual/nixos/stable/ (20k+ options)
  services.sourcehut.enable = true;

  # https://github.com/infinisil/nixus (experimental, just a few options!)
  ssh.access.host1.keys.user1.hasAccessTo.host2.user2 = true;

}
