{ config, pkgs, ... }:

{
  zramSwap.enable = true;
  zramSwap.memoryPerfect = 50;
}
