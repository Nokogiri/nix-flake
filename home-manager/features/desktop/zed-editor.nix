{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    nil
    nixd
    package-version-server
  ];

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "nix"
      "make"
      "scss"
    ];
    userSettings = {
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
        enabled = true;
        version = "2";
        button = true;
        default_model = {
          provider = "zed.dev";
          model = "claude-3-7-sonnet-latest";
        };
      };
      hour_format = "hour24";
      auto_update = false;
      edit_predictions = {
        mode = "subtle";
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
        package-version-server = {
          binary = {
            path_lookup = true;
          };
        };
      };
    };
  };
}
