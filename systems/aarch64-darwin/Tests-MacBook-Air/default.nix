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
    };

    tools = {
      homebrew.enable = false;
    };
  };

  networking = {
    computerName = "Tests MacBook Air";
    hostName = "Tests-MacBook-Air";
    localHostName = "Tests-MacBook-Air";
  };

  nix.settings = {
    cores = 4;
    max-jobs = 2;
  };

  users.users.${cfg.name} = {
    openssh.authorizedKeys.keys = [ ];
  };

  system = {
    primaryUser = "test";
    stateVersion = 5;
  };
}