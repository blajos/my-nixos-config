# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./my-hardware-configuration.nix
      ./env.nix
    ];

  boot.cleanTmpDir = true;

  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Budapest";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox-esr
    icedtea_web
    libreoffice
    geeqie
    git
    mc
    vpnc
    i3lock
    i3status
    tmux
    psmisc
    gnupg
    cowsay
    wireshark
    which
    rxvt_unicode
    conky
    terminus_font
    bashCompletion
    xfontsel
    xlsfonts
    dejavu_fonts
    fortune
    freerdpUnstable
    bind
    xorg.xdpyinfo
    wireshark
    tcpdump
    nmap
    dmenu
    rdesktop
    xclip
    xorg.xmodmap
    xdotool
    offlineimap
    mutt
    pinentry
    openssl
    clipit
    w3m
    evince
    mpv
    youtube-dl
    #dwarf-fortress-original
    pwgen
    openconnect
    #primus
    #orthorobot
    tightvnc
    octave
    #angband
    nitrogen
    imagemagickBig
    remind
    ghostscript
    bc
    dbus_tools
    sway
    xwayland
    patchelf
    binutils
    xbindkeys
    xss-lock
    snx
    bundix
    puppet-lint
    puppet
    ruby
    xosd
    rpm
    openldap
    cifs-utils
    smbclient
    powertop
    vagrant
    hipchat
    slack
    google-chrome
    taskwarrior
    androidenv.platformTools
    pavucontrol
    unzip
    p7zip
    openjdk
    prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager grafana
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.synaptics.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.desktopManager.enlightenment.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.blajos = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "audio" "video" "vboxusers" ];
  };

  users.extraUsers.guest = {
    isNormalUser = true;
    uid = 1999;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  nix.gc.automatic = true;
  nix.gc.dates = "11:30";

  zramSwap.enable = true;
  zramSwap.numDevices = 4;

  programs.bash.enableCompletion = true;

  security.pam.enableEcryptfs = true;
  system.autoUpgrade.enable = true;
  #virtualisation.libvirtd.enable = true;
  #virtualisation.vswitch.enable = true;
  virtualisation.virtualbox.host.enable = true;
  nixpkgs.config = {
    allowUnfree = true;

    firefox = {
      icedtea = true;
    };
  };
  
  environment.variables = {
    EDITOR = "vim";
    NIXPKGS = "/etc/nixos/nixpkgs";
  };

  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.extraConfig = "load-module module-switch-on-connect";

}
