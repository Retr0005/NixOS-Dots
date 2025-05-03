{...}: {
  services.mpd = {
    enable = true;
    musicDirectory = "/home/mao/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
