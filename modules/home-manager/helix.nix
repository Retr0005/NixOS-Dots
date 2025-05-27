{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "autumn_night_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = {};
      };
    };
  };
}
