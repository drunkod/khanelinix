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

    suites.common = enabled;

    theme.catppuccin = enabled;
  };

  home.stateVersion = "25.11";
}