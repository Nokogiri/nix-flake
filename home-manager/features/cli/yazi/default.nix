{pkgs, ...}: {
  #imports = [./plugins/default.nix];
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        ratio = [ 1 3 3];
        sort_by        = "alphabetical";
        sort_sensitive = false;
        sort_reverse 	 = false;
        sort_dir_first = true;
        sort_translit  = false;
        linemode       = "size";
        show_hidden    = false;
        show_symlink   = true;
        scrolloff      = 5;
        mouse_events   = [ "click" "scroll" ];
        title_format   = "Yazi: {cwd}";
      };
      opener = {
        edit = [
        { run = "nvim \"$@\""; desc = "$EDITOR"; block = true; for = "unix"; }
        ];
        open = [
        { run = "xdg-open \"$1\""; desc = "Open"; for = "linux"; }
        ];
        reveal = [
	      { run = "xdg-open \"$(dirname \"$1\")\""; desc = "Reveal"; for = "linux"; }
        ];
        extract = [
      	{ run = "ya pub extract --list \"$@\""; desc = "Extract here"; for = "unix"; }
        ];
        play = [
      	{ run = "mpv --force-window \"$@\""; orphan = true; for = "unix"; }
        ];
      };
      plugin.prepend_previewers = [
        {
          mime = "application/*zip";
          run = "ouch";
        }
        {
          mime = "application/x-tar";
          run = "ouch";
        }
        {
          mime = "application/x-bzip2";
          run = "ouch";
        }
        {
          mime = "application/x-7z-compressed";
          run = "ouch";
        }
        {
          mime = "application/x-rar";
          run = "ouch";
        }
        {
          mime = "application/x-xz";
          run = "ouch";
        }
      ];
    };
    plugins = {
      ouch = pkgs.fetchFromGitHub {
        owner = "ndtoan96";
        repo = "ouch.yazi";
        rev = "v0.4.1";
        hash = "sha256-oUEUGgeVbljQICB43v9DeEM3XWMAKt3Ll11IcLCS/PA=";
      };
    };
  };
}
