{pkgs, ...}: {
  home.packages = with pkgs; [steamtinkerlaunch];

  xdg.dataFile."Steam/compatibilitytools.d/SteamTinkerLaunch/steamtinkerlaunch" = {
    enable = true;
    source = "${pkgs.steamtinkerlaunch}/bin/steamtinkerlaunch";
  };

  xdg.dataFile."Steam/compatibilitytools.d/SteamTinkerLaunch/compatibilitytool.vdf" = {
    enable = true;
    text = ''
            "compatibilitytools"
      {
        "compat_tools"
        {
              "Proton-stl" // Internal name of this tool
              {
                "install_path" "."
                "display_name" "Steam Tinker Launch"

                "from_oslist"  "windows"
                "to_oslist"    "linux"
              }
        }
      }
    '';
  };

  xdg.dataFile."Steam/compatibilitytools.d/SteamTinkerLaunch/toolmanifest.vdf" = {
    enable = true;
    text = ''
      "manifest"
      {
        "commandline" "/steamtinkerlaunch run"
        "commandline_waitforexitandrun" "/steamtinkerlaunch waitforexitandrun"
      }
    '';
  };
}
