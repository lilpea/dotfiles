{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    fonts = (with pkgs; [
      corefonts
      dejavu_fonts
      fantasque-sans-mono
      fira
      fira-code
      font-awesome-ttf
      ibm-plex
      iosevka
      noto-fonts
      powerline-fonts
      roboto
      roboto-mono
      roboto-slab
      siji
      source-code-pro
      symbola
      tewi-font
    ]);

    fontconfig = {
      enable = true;
      penultimate.enable = true;
      hinting = {
        autohint = false;
        enable = true;
      };
      subpixel.lcdfilter = "default";
      defaultFonts = {
        monospace = [ "Iosevka" ];
        sansSerif = [ "Fira Sans" ];
        serif = [ "IBM Plex Serif" ];
      };
    };
  };
}
