{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  inherit (config.lib.stylix) colors;
  sesh = pkgs.writeScriptBin "sesh" ''
    #! /usr/bin/env sh

    # Taken from https://github.com/zellij-org/zellij/issues/884#issuecomment-1851136980
    # select a directory using zoxide
    ZOXIDE_RESULT=$(zoxide query --interactive)
    # checks whether a directory has been selected
    if [[ -z "$ZOXIDE_RESULT" ]]; then
        # if there was no directory, select returns without executing
        exit 0
    fi
    # extracts the directory name from the absolute path
    SESSION_TITLE=$(echo "$ZOXIDE_RESULT" | sed 's#.*/##')

    # get the list of sessions
    SESSION_LIST=$(zellij list-sessions -n | awk '{print $1}')

    # checks if SESSION_TITLE is in the session list
    if echo "$SESSION_LIST" | grep -q "^$SESSION_TITLE$"; then
        # if so, attach to existing session
        zellij attach "$SESSION_TITLE"
    else
        # if not, create a new session
        echo "Creating new session $SESSION_TITLE and CD $ZOXIDE_RESULT"
        cd $ZOXIDE_RESULT
        zellij attach -c "$SESSION_TITLE"
    fi
  '';
in {
  home.packages = [
    pkgs.tmate
    sesh
    pkgs.zjstatus
  ];

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        swap_tiled_layout name="vertical" {
            tab max_panes=5 {
                pane split_direction="vertical" {
                    pane
                    pane { children; }
                }
            }
            tab max_panes=8 {
                pane split_direction="vertical" {
                    pane { children; }
                    pane { pane; pane; pane; pane; }
                }
            }
            tab max_panes=12 {
                pane split_direction="vertical" {
                    pane { children; }
                    pane { pane; pane; pane; pane; }
                    pane { pane; pane; pane; pane; }
                }
            }
        }

        swap_tiled_layout name="horizontal" {
            tab max_panes=5 {
                pane
                pane
            }
            tab max_panes=8 {
                pane {
                    pane split_direction="vertical" { children; }
                    pane split_direction="vertical" { pane; pane; pane; pane; }
                }
            }
            tab max_panes=12 {
                pane {
                    pane split_direction="vertical" { children; }
                    pane split_direction="vertical" { pane; pane; pane; pane; }
                    pane split_direction="vertical" { pane; pane; pane; pane; }
                }
            }
        }

        swap_tiled_layout name="stacked" {
            tab min_panes=5 {
                pane split_direction="vertical" {
                    pane
                    pane stacked=true { children; }
                }
            }
        }

        swap_floating_layout name="staggered" {
            floating_panes
        }

        swap_floating_layout name="enlarged" {
            floating_panes max_panes=10 {
                pane { x "5%"; y 1; width "90%"; height "90%"; }
                pane { x "5%"; y 2; width "90%"; height "90%"; }
                pane { x "5%"; y 3; width "90%"; height "90%"; }
                pane { x "5%"; y 4; width "90%"; height "90%"; }
                pane { x "5%"; y 5; width "90%"; height "90%"; }
                pane { x "5%"; y 6; width "90%"; height "90%"; }
                pane { x "5%"; y 7; width "90%"; height "90%"; }
                pane { x "5%"; y 8; width "90%"; height "90%"; }
                pane { x "5%"; y 9; width "90%"; height "90%"; }
                pane focus=true { x 10; y 10; width "90%"; height "90%"; }
            }
        }

        swap_floating_layout name="spread" {
            floating_panes max_panes=1 {
                pane {y "50%"; x "50%"; }
            }
            floating_panes max_panes=2 {
                pane { x "1%"; y "25%"; width "45%"; }
                pane { x "50%"; y "25%"; width "45%"; }
            }
            floating_panes max_panes=3 {
                pane focus=true { y "55%"; width "45%"; height "45%"; }
                pane { x "1%"; y "1%"; width "45%"; }
                pane { x "50%"; y "1%"; width "45%"; }
            }
            floating_panes max_panes=4 {
                pane { x "1%"; y "55%"; width "45%"; height "45%"; }
                pane focus=true { x "50%"; y "55%"; width "45%"; height "45%"; }
                pane { x "1%"; y "1%"; width "45%"; height "45%"; }
                pane { x "50%"; y "1%"; width "45%"; height "45%"; }
            }
        }

        default_tab_template {
            pane size=2 borderless=true {
                plugin location="file://${pkgs.zjstatus}/bin/zjstatus.wasm" {
                    format_left  "{mode}#[fg=blue,bg=#383E5A,bold]  {session} #[fg=#383E5A,bg=bg] #[fg=white,bg=fg]󰓩  {tabs}"
                    format_right "#[fg=blue,bg=bg]{datetime}"
                    format_hide_on_overlength "true"
                    format_precedence "lrc"

                    border_enabled  "false"
                    border_char     "─"
                    border_format   "#[bg=#313244]{char}"
                    border_position "top"

                    hide_frame_for_single_pane "true"


                    mode_normal   "#[fg=#1A1B26,bg=blue,bold] NORMAL #[fg=blue,bg=#383E5A]"
                    mode_pane     "#[fg=#1A1B26,bg=magenta,bold] PANE #[fg=magenta,bg=#383E5A]"
                    mode_session  "#[fg=#1A1B26,bg=yellow,bold] SESSION #[fg=yellow,bg=#383E5A]"
                    mode_tab      "#[fg=#1A1B26,bg=green,bold] TAB #[fg=green,bg=#383E5A]"

                    tab_normal  "#[fg=#A9B1D6,bg=fg] [{index}] {name}"
                    tab_active  "#[fg=green,bg=fg,bold,italic] [{index}] {name}"

                    // indicators
                    tab_sync_indicator       " "
                    tab_fullscreen_indicator " 󰊓"
                    tab_floating_indicator   " 󰹙"

                    command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
                    command_git_branch_format      "#[fg=blue] {stdout} "
                    command_git_branch_interval    "10"
                    command_git_branch_rendermode  "static"

                    datetime          "#[fg=#1A1B26,bg=blue]{format}"
                    datetime_format   "  %H:%M "
                    datetime_timezone "Europe/Rome"
                }
            }
            children
        }
    }
  '';

  programs.zellij = {
    enable = true;
    # package = zellij-wrapped;
    # settings = {
    #   default_mode = "normal";
    #   default_shell = "fish";
    #   simplified_ui = true;
    #   pane_frames = false;
    #   theme = "catppuccin-mocha";
    #   copy_on_select = true;
    # };
  };
}
