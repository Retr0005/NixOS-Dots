## ░█▀▀░▀█▀░█▀█░█▀▄░█▀▀░█░█░▀█▀░█▀█
## ░▀▀█░░█░░█▀█░█▀▄░▀▀█░█▀█░░█░░█▀▀
## ░▀▀▀░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░░
## CROSS-SHELL PROMPT
## The minimal, blazing-fast, and infinitely customizable prompt for any shell!
{
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$hostname"
        "$directory"
        "$localip"
        "$shlvl"
        "$singularity"
        "$kubernetes"
        "$vcsh"
        "$hg_branch"
        "$docker_context"
        "$package"
        "$custom"
        "$sudo"
        "$fill"
        "$rust"
        "$nix_shell"
        "$java"
        "$git_branch"
        "$git_status"
        "$git_commit"
        "$cmd_duration"
        "$jobs"
        "$battery"
        "$time"
        "$status"
        "$os"
        "$container"
        "$shell"
        "$line_break"
        "$line_break"
        "$character"
      ];

      add_newline = true;

      hostname = {
        ssh_only = true;
        format = "[](fg:#24273a bg:none)[█](fg:#E8E3E3 bg:#24273a)[$ssh_symbol$hostname](bold bg:#E8E3E3)[](fg:#E8E3E3 bg:none) ";
        disabled = false;
      };

      directory = {
        format = "[](fg:#24273a bg:none)[$path]($style)[█](fg:#232526 bg:#232526)[](fg:#8caaee bg:#24273a)[ ](fg:#24273a bg:#8caaee)[](fg:#8caaee bg:none)";
        style = "fg:#E8E3E3 bg:#24273a bold";
        truncation_length = 3;
        truncate_to_repo = false;
        read_only = " ";
      };

      character = {
        success_symbol = "[ ❯ ](#8caaee bold)";
        error_symbol = "[ ❯ ](#e78284 bold)";
      };

      line_break.disabled = false;

      fill = {
        symbol = " ";
        style = "bold green";
      };

      cmd_duration = {
        min_time = 1;
        format = "[](fg:#24273a bg:none)[$duration]($style)[](fg:#24273a bg:#24273a)[](fg:#ca9ee6 bg:#24273a)[󱑂 ](fg:#24273a bg:#ca9ee6)[](fg:#ca9ee6 bg:none)";
        disabled = false;
        style = "fg:#E8E3E3 bg:#24273a bold";
      };

      git_branch = {
        format = "[](fg:#24273a bg:none)[$branch]($style)[](fg:#24273a bg:#24273a)[](fg:#81C19B bg:#24273a)[](fg:#24273a bg:#81C19B)[](fg:#81C19B bg:none) ";
        style = "fg:#E8E3E3 bg:#24273a";
        symbol = " ";
      };

      git_status = {
        format = "[](fg:#24273a bg:none)[$all_status$ahead_behind]($style)[](fg:#24273a bg:#24273a)[](fg:#8caaee bg:#24273a)[ ](fg:#24273a bg:#8caaee)[](fg:#8caaee bg:none) ";
        style = "fg:#E8E3E3 bg:#24273a";
        conflicted = "=";
        ahead = "⇡$count";
        behind = "⇣$count";
        diverged = "⇕⇡$ahead_count⇣$behind_count";
        up_to_date = " 󰄸 ";
        untracked = "?$count";
        stashed = "";
        modified = "!$count";
        staged = "+$count";
        renamed = "»$count";
        deleted = " $count";
      };

      git_commit = {
        format = "[\\($hash\\)]($style) [\\($tag\\)]($style)";
        style = "green";
      };

      git_state = {
        rebase = "REBASING";
        merge = "MERGING";
        revert = "REVERTING";
        cherry_pick = "CHERRY-PICKING";
        bisect = "BISECTING";
        am = "AM";
        am_or_rebase = "AM/REBASE";
        style = "yellow";
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
      };

      # SYMBOLS

      aws = {
        symbol = "  ";
      };

      dart = {
        symbol = " ";
      };

      docker_context = {
        symbol = " ";
        format = "via [$symbol$context]($style) ";
        style = "blue bold";
        only_with_files = true;
        disabled = false;
      };

      golang = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      java = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };
    };
  };
}
