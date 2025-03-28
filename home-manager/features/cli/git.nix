{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      userName = "nokogiri";
      userEmail = "nokogiri@gefjon.org";
      signing = {
        signByDefault = true;
        key = "3064C39BEA915CE6";
      };
      diff-so-fancy.enable = false;
      ignores = [
        "*~"
        "*.swp"
        ".direnv"
        "result"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        feature.manyFiles = true;
        index.skipHash = false;
      };
      lfs = {
        enable = true;
      };
      delta = {
        enable = true;
      };
    };
    gitui = {
      enable = false;
      theme = ''
        (
            selected_tab: Reset,
            command_fg: White,
            selection_bg: Blue,
            selection_fg: White,
            cmdbar_bg: Blue,
            cmdbar_extra_lines_bg: Blue,
            disabled_fg: DarkGray,
            diff_line_add: Green,
            diff_line_delete: Red,
            diff_file_added: LightGreen,
            diff_file_removed: LightRed,
            diff_file_moved: LightMagenta,
            diff_file_modified: Yellow,
            commit_hash: Magenta,
            commit_time: LightCyan,
            commit_author: Green,
            danger_fg: Red,
            push_gauge_bg: Blue,
            push_gauge_fg: Reset,
            tag_fg: LightMagenta,
            branch_fg: LightYellow,
        )
      '';
    };
  };
}
