{ config, lib, pkgs, ... }: with lib;
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      efiSysMountPoint = "/boot";
    };
    grub = {
      # despite what the configuration.nix manpage seems to indicate,
      # as of release 17.09, setting device to "nodev" will still call
      # `grub-install` if efiSupport is true
      # (the devices list is not used by the EFI grub install,
      # but must be set to some value in order to pass an assert in grub.nix)
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      # set $FS_UUID to the UUID of the EFI partition
      extraEntries = ''
        menuentry "Windows" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 06ED-B656 # FIXME
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
      version = 2;
    };
  };

  boot.plymouth.enable = true;
  # boot.initrd.luks.devices = [{
  #   name="root";
  #   device = "/dev/sdc3";
  #   preLVM = true;
  # }];
  #
  # boot.loader.grub.device = "/dev/sdc";
  # boot.initrd.checkJournalingFS = false;
}
