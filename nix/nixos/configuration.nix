# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

## test comment
{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./kmonad.nix
    ];
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # wireless is enabled automatically??

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the lightdm login service
  services.xserver.displayManager.lightdm.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.desktopManager.xfce.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # make the uinput group, needed for kmonad
  users.groups.uinput = {};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jamesm = {
    isNormalUser = true;
    description = "jamesm";
    extraGroups = [ "networkmanager" "wheel" "input" "uinput"];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vpn



    xf86_input_wacom # touchscreen?
    wacomtablet


    haskellPackages.kmonad
    dmenu-rs
    xterm

    # xfce stuff
    xfce.xfwm4-themes
    # xfce.xfce4-volumed-pulse
    xfce.xfce4-pulseaudio-plugin # needed for audio in taskbar panel
    pavucontrol # dependency of xfce4-pulseaudio-plugin

    # kmonad package needed for no sudo
    #interception-tools # program needed was: evtest

    # usbutils for lsusb to try debugging laptop trackpad
    usbutils

    # power manager
    tlp

    # bluetooth
    blueberry
 ];


 # kmonad stuff
  services.udev.extraRules =
    ''
      # KMonad user access to /dev/uinput
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
