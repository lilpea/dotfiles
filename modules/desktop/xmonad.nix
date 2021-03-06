{ config, options, lib, pkgs, ... }:

with lib; {

  options.modules.desktop.xmonad = {
    enable = mkOption { type = types.bool; default = false; };
  };

  config = mkIf config.modules.desktop.xmonad.enable {
    environment.systemPackages = with pkgs.unstable.haskellPackages; [
      xmonad-contrib
      xmonad-extras
      xmonad
      gloss
    ];

    # FIXME what is this for?
    # modules.desktop.WM.enable = true;
    services.xserver.windowManager.xmonad = {
      enable = true;
    };

    services = {
      # xserver.displayManager.defaultSession = "none+xmonad";
      picom.enable = true;
    };

    my.env = {
      XMONAD_CONFIG_DIR = <config/xmonad>;
      XMONAD_CACHE_DIR = "$XDG_CACHE_HOME/xmonad";
      XMONAD_DATA_DIR = "$XDG_DATA_HOME/xmonad";
    };

    my.packages = with pkgs.unstable; [
      xmobar
    ];
    fonts.fonts = with pkgs; [
      siji # some nice icons
      weather-icons # for weather script
    ];

    my.env.PATH = [ <config/xmonad/scripts/xmobar> "$PATH" ];

    # modules.desktop.term.alacritty.enable = true;
    # modules.desktop.term.default = "alacritty";
  };
}
