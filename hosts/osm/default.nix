# osm -- ajutine maja

{ pkgs, options, config, lib, ... }: {
  imports = [
              # ./boot.nix
              ./hardware-configuration.nix
              ../personal.nix
            ];

  modules = {
    desktop = {
      bspwm.enable = true;
      xmonad.enable = true;

      # apps.discord.enable = true;
      # apps.skype.enable = true;
      # apps.vm.enable = true;       # virtualbox for testing
      apps.daw.enable = true;        # making music
      apps.graphics.enable = true;   # raster/vector/sprites
      apps.recording.enable = true;  # recording screen/audio
      apps.rofi.enable = true;
      apps.zathura.enable = true;

      browsers.default = "qutebrowser";
      browsers.firefox.enable = true;
      browsers.qutebrowser.enable = true;
      browsers.vivaldi.enable = true;
      browsers.vimb.enable = true;

      term = {
        st.enable = true;
        alacritty.enable = true;
        default = "alacritty";
      };

      # gaming.emulators.psx.enable = false; # FIXME called insecure by nixpkgs
      # gaming.emulators.snes.enable = true;
      # gaming.steam.enable = true;
    };

    editors = {
      default = "nvim";
      emacs.enable = true;
      vim.enable = true;
    };

    dev = {
      # clojure.enable = true;
      # lua.enable = true;
      # lua.love2d.enable = true;
      # scala.enable = true;
      # unity3d.enable = true;
      cc.enable = true;
      common-lisp.enable = true;
      godot.enable = true;
      lua.enable = true;
      python.enable = true;
      rust.enable = true;
      zsh.enable = true;
    };

    media = {
      # spotify.enable = false;
      mpv.enable = true;
      # ncmpcpp.enable = true; FIXME
    };

    shell = {
      direnv.enable = true;
      git.enable = true;
      gnupg.enable = true;
      weechat.enable = true;
      pass.enable = true;
      tmux.enable = true;
      ranger.enable = true;
      zsh.enable = true;
    };

    # FIXME see if any of these are worth using
    services = {
      #ssh.enable = true;
      #syncthing.enable = true;
      # gitea.enable = true;
      # nginx.enable = true;
      # calibre.enable = true;
    };

    # zram.enable = false;
    # themes.aquanaut.enable = true;
    themes.fluorescence.enable = true;
  };

  # FIXME what does this do?
  # my.home.services.picom = with lib; {
  #   backend = mkForce "xrender";
  #   experimentalBackends = true;
  # };

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Tallinn";
  # location.provider = "geoclue2";
  # hardware.cpu.intel.updateMicrocode = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluezFull;
  };
  services.dbus.packages = [ pkgs.blueman ];
  programs.ssh.startAgent = true;
  # networking.wireless.enable = true;
  hardware.opengl.enable = true;

  ## Fix screen tearing
  services.xserver = {
    deviceSection = ''
      Option "DRI" "2"
      Option "TearFree" "true"
    '';
    useGlamor = true;
  };

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  # Optimize power use
  environment.systemPackages = [ pkgs.acpi ];
  powerManagement.powertop.enable = true;
}
