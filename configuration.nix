{ self, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      vim
      neovim
      statix
      alejandra
    ];

  system = {
    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock
    };
  };

  fonts = {
    fontDir.enable = true;
    fonts = [
      pkgs.nerdfonts
    ];
  };

  security.pam.enableSudoTouchIdAuth = true;

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nix.package = pkgs.nix;

  programs.zsh.enable = true; # default shell on catalina

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 4;
}
