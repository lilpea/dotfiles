{ config, lib, pkgs, ... }:

{
  imports = [
    ./daw.nix
    ./discord.nix
    ./dunst.nix
    ./graphics.nix
    ./recording.nix
    ./rofi.nix
    ./skype.nix
    ./vm.nix
    ./zathura.nix
  ];
}
