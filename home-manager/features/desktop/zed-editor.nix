{pkgs, ...}: {
  home.packages = [
    pkgs.alejandra
    pkgs.nil
    pkgs.nixd
  ];

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extensions = [
      "nix"
      "make"
    ];
    userSettings = {
      features = {
        copilot = false;
        inline_completion_provider = "none";
      };
      collaboration_panel = {
        button = false;
      };
      telemetry = {
        metrics = false;
      };
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      ui_font_family = "JetBrainsMono Nerd Font Propo";
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
      assistant = {
        enabled = false;
        button = false;
      };
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
