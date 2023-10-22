{
  inputs = {
    utils.url = "path:../../";
    nixpkgs.url = "github:NixOS/nixpkgs";
    neovitality.url = "github:vi-tality/neovitality/69aaf582bf46992ae10e6aaa44f37c9d4096cc38"; # As of writing contains invalid `overlays` attribute.
  };

  outputs = inputs @ {
    self,
    utils,
    ...
  }:
    utils.lib.mkFlake {
      inherit self inputs;
      supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux"];

      overlays = utils.lib.exportOverlays {inherit (self) pkgs inputs;};
    };
}
