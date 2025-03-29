{ pkgs, ... }:
let
  maxfetch =
    pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);
  rxfetch =
    pkgs.writeScriptBin "rxfetch" (builtins.readFile ./scripts/rxfetch.sh);
in {
  home.packages = with pkgs; [
    # wall-change
    # wallpaper-picker
    maxfetch
    rxfetch
  ];
}
