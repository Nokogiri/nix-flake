{pkgs, ...}: {
  home.packages = [
    pkgs.alejandra
    pkgs.nil
    pkgs.nixd
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
            "nixd"
            "!nil"
          ];
          formatter = {
            external = {
              command = "alejandra";
              arguments = ["--quiet" "--"];
            };
          };
        };
      };
      assistant.enabled = false;
      lsp = {
        nixd = {
          settings = {
            diagnostic = {
              suppress = ["sema-extra-with"];
            };
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
