{pkgs, ...}: {
  nix = {
    package = pkgs.lix;
    settings = {
      allowed-users = ["root" "@wheel" "mao"];
      trusted-users = ["root" "@wheel" "mao" "@builders"];
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
