{
    pkgs,
    config,
    ...
}:
{
    programs.fish = {
        enable = true;

        shellAliases = {
            l = "eza -lh --icons";
            ls = "eza --icons";
            tree = "eza --icons --tree";
            nixb = "sudo nixos-rebuild switch --flake ~/NixOS-Hyprland/#shizuru";
        };

        functions = {
            fish_greeting = "";
        };

        interactiveShellInit = ''
            function transient_prompt_func
                starship module character
            end
        '';
        plugins = [
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
        ];
    };
}
