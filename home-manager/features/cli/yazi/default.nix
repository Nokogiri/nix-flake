{
  imports = [./plugins/default.nix];
  programs.yazi = {
    enable = true;
    settings = {
      opener.extract = [
        {
          run = "ouch d -y $@";
          desc = "Extract here with ouch";
          for = "unix";
        }
      ];
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
  };
}
