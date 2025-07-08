{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    package = pkgs.pkgs-master.fish;

    shellAliases = {
      l = "eza -lh --icons";
      ls = "eza --icons";
      tree = "eza --icons --tree";
      grow = "sudo nixos-rebuild switch --flake ~/NixOS-Hyprland/#shizuru";
      n = "nvim";
      f = "hyprpanel &";
      d = "kitten icat -n --place 30x30@0x6 --scale-up --align left ~/Downloads/Diddy.jpg | fastfetch --logo-width 30 --raw -";
    };

    functions = {
      fish_greeting = "";
    };

    interactiveShellInit = ''
      function transient_prompt_func
          starship module character
          thefuck --alias | source
      end
    '';
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];
  };
}
