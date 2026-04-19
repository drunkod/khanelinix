{
  lib,
  ...
}:
let
  inherit (lib.khanelinix) enabled;
in
{
  khanelinix = {
    user = {
      enable = true;
      name = "test";
    };

    suites = {
      common = enabled;

      development = {
        enable = true;
        nixEnable = false;      # nix tools: nix-diff, nix-update, etc.
        dockerEnable = false;  # set true if you want docker
        aiEnable = false;      # set true if you want claude-code etc.
      };
    };

    programs = {
      terminal = {
        tools = {
          git = enabled;
          ssh = enabled;
          tmux = enabled;
        };
      };
    };

    theme.catppuccin = enabled;
  };

  home.stateVersion = "25.11";
}