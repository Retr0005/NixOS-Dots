{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      l = "eza -lh --icons";
      ls = "eza --icons";
      tree = "eza --icons --tree";
      grow = "sudo nixos-rebuild switch --flake ~/NixOS-Hyprland/#shizuru";
      n = "nvim";
      f = "hyprpanel &";
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
