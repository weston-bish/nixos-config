{ config, pkgs, ... }:

{
  services.tlp.enable = true;

  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchDocked = "ignore";
  services.logind.lidSwitchExternalPower = "suspend";
}
