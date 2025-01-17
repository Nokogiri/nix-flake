{pkgs, ...}: {
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
    '';
    newSession = true;
    prefix = "C-a";
    shortcut = "a";
    terminal = "xterm-256color";
  };
}
