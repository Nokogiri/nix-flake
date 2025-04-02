{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    nil
    nixd
    package-version-server
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "make"
    ];
    userSettings = {
      #features = {
      #  copilot = false;
      #  edit_prediction_provider = "none";
      #};
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
        default_open_ai_model = null;
        default_model = {
          provider = "zed.dev";
          model = "claude-3-5-sonnet-latest";
        };

        button = false;
      };
      hour_format = "hour24";
      auto_update = false;
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
