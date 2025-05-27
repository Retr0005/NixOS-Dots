{
config,
pkgs,
lib,
inputs,
...
}: let 
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];
  programs.spicetify = lib.mkForce {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      beautifulLyrics
      autoSkipExplicit
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "CatppuccinMocha";
  };
}
