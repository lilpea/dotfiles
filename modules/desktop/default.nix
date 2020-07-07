{ config, lib, pkgs, ... }:

{
  imports = [
    ./common.nix
    # ./stumpwm.nix
    ./bspwm.nix
    ./xmonad.nix
    # ./dunst.nix

    ./apps
    ./term
    ./browsers
    ./gaming
  ];

  # FIXME find where all this goes
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = lib.mkDefault false;
    autoRepeatDelay = 250;
    autoRepeatInterval = 50;
    libinput = {
      disableWhileTyping = true;
      enable = true;
    };
    layout = "us, ee";
    xkbOptions = "grp:rwin_toggle, ctrl:swapcaps, compose:ralt, terminate:ctrl_alt_bksp";

    displayManager.lightdm = {
      enable = true;
      greeters.gtk.theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome3.gnome_themes_standard;
      };
    };

  };
  services.dbus.packages = with pkgs; [ gnome3.dconf ];
  programs.dconf.enable = true;
}
