{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lucy";
  home.homeDirectory = "/home/lucy";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_colorful";
          padding = { right = 1; };
        };
        display = {
          size = { binaryPrefix = "si"; };
          color = "blue";
          separator = "  ";
        };
        modules = [
          {
            type = "datetime";
            key = "Date";
            format = "{1}-{3}-{11}";
          }
          {
            type = "datetime";
            key = "Time";
            format = "{14}:{17}:{20}";
          }
          "shell"
          "os"
          "uptime"
          "cpu"
          "memory"
          "diskio"
          "processes"
        ];
      };
    };
    hyfetch = {
      enable = true;
      settings = {
        preset = "transgender";
        mode = "rgb";
        color_align = { mode = "horizontal"; };
        backend = "fastfetch";
        auto_detect_light_dark = true;
        light_dark = "dark";
        lightness = 0.5;
        args = null;
        distro = "nixos_colorful";
        pride_month_disable = false;
        custom_ascii_path = null;
      };
    };
  };
}
