{ config, lib, pkgs, ... }: {
  my.packages = with pkgs;
    [
      # FIXME see if these are needed
      arandr
      file
      # some rust apps
      ripgrep # fast grepper
      fd # rust alternative to find
      tokei # code statistic
      maim
      scrot # Screenshots
      dunst # notification daemon
      libnotify
      usbutils
      unzip
      zip
      unrar
      ncdu # Disk space usage anlyzer
      android-file-transfer
      sxiv
      feh
      pandoc # Universal Markup converter
      unoconv # for converting odt to pdf
      ps_mem # memory utility
      pavucontrol
      pulsemixer # pulseaudio
      lm_sensors
      vscode
      # Appearance
      qt5ct
      lxappearance
      pywal # colorschemes
      wpgtk # background generator
      killall
      stow
      libqalculate # calculator cli w/ currency conversion
      (makeDesktopItem {
        name = "scratch-calc";
        desktopName = "Calculator";
        icon = "calc";
        exec = "st -e $SHELL -c 'qalc'";
        categories = "Development";
      })
      neovim
      nnn # Small ncurses-based filebrowser
      ranger # Another filebrowser
      jgmenu
      tdesktop
      pfetch # A pretty system information tool written in POSIX sh
    ] ++ (with pkgs.gnome3; [
      adwaita-icon-theme
      nautilus
      file-roller
      gnome-autoar
      eog
    ]);
}
