{
  lib,
  config,
  ...
}:
let
  inherit (lib.khanelinix) enabled;
  cfg = config.khanelinix.user;
in
{
  khanelinix = {
    user = {
      name = "test";
    };

    security = {
      sudo = enabled;
      sops.enable = false;
    };

    suites = {
      common = enabled;
      development = {
        enable = true;
        dockerEnable = false;
      };
    };

    tools = {
      homebrew.enable = false;
    };

    nix = {
      enable = false;
    };
  };

  nix.enable = false;

  networking = {
    computerName = "Tests MacBook Air";
    hostName = "Tests-MacBook-Air";
    localHostName = "Tests-MacBook-Air";
  };

  users.users.${cfg.name} = {
    openssh.authorizedKeys.keys = [ ];
  };

  system = {
    primaryUser = "test";
    stateVersion = 5;
  };
}