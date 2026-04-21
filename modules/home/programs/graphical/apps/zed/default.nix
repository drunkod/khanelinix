{
  config,
  lib,
  pkgs,
  osConfig ? { },

  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.khanelinix) mkBoolOpt;

  cfg = config.khanelinix.programs.graphical.apps.zed;
in
{
  options.khanelinix.programs.graphical.apps.zed = {
    enable = mkBoolOpt false "Whether to enable Zed editor.";
  };

  config = mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;

      userSettings = {
        ui_font_family = "MonaspaceNeon Nerd Font";
        buffer_font_family = "MonaspaceNeon Nerd Font";
        buffer_font_size = 14;
        theme = {
          mode = "dark";
          dark = "Catppuccin Mocha";
          light = "Catppuccin Latte";
        };
        vim_mode = true;
        autosave = "on_focus_change";
        format_on_save = "on";
        terminal = {
          font_family = "MonaspaceNeon Nerd Font";
        };
      };
    };
  };
}
