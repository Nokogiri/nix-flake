{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -g mouse on
      bind-key a last-window
      bind-key ^D detach-client

      set-option -g set-titles on
      set-option -g set-titles-string '[#S:#I #T] #W'
      set-option -g status-position bottom

      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",xterm-256color:RGB"

      set-option -g repeat-time 0
      set -g allow-passthrough on

      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      source ${
        pkgs.fetchFromGitHub {
          owner = "TanglingTreats";
          repo = "tmux-everforest";
          rev = "8fdb56daf523b84c51efeca1a16d3d6e44c31fdc";
          hash = "sha256-0LUiYXPWzWgH72ORkR9b+SRHxryZdNgmZGu9VzjbDX8=";
        }
      }/tmux-everforest-dark-medium.conf
    '';
    newSession = true;
    prefix = "C-a";
    #plugins = with pkgs; [
    #  {
    #    plugin = tmuxPlugins.dracula;
    #    extraConfig = ''
    #      set -g @dracula-border-contrast true
    #3      set -g @dracula-show-empty-plugins false
    #      set -g @dracula-show-flags true
    #      set -g @dracula-show-left-icon 
    #      set -g @dracula-show-powerline true
    #      set -g @dracula-refresh-rate 10
    #      set -g @dracula-plugins "ssh-session time"
    #      set -g allow-passthrough on
    #      set -ga update-environment TERM
    #      set -ga update-environment TERM_PROGRAM
    #    '';
    #  }
    #];
    shortcut = "a";
    terminal = "xterm-256color";
  };
}
