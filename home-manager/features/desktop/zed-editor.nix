{pkgs, ...}: {
  home.packages = [
    pkgs.nil
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "catppuccin"
      "catppuccin-blur"
      "catppuccin-blur-plus"
      "catppuccin-icons"
    ];
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };

      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      ui_font_family = "JetBrainsMono Nerd Font Propo";
      icon_theme = "Catppuccin Macchiato";
      theme = {
        dark = "Catppuccin Macchiato (Blur)";
        light = "Catppuccin Macchiato (Blur)";
      };
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
        };
      };
      assistant.enabled = false;
      lsp = {
        nil = {
          initialization_options = {
            formatting.command = ["alejandra"];
          };
        };
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };
    };
  };
}
