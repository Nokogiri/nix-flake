{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides =
    pkgs: with pkgs; {
      steam = steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            gst_all_1.gst-vaapi
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-libav
            gamemode
            fribidi
            mangohud
            libgdiplus
            brotli.lib
            zlib
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils
            xdg-user-dirs
            wget
            yad
          ];
        extraProfile = ''
          export GSETTINGS_SCHEMA_DIR="${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}/glib-2.0/schemas/"
        '';
      };
    };

  home.packages = with pkgs; [
    steam
    steam-run
    steam-rom-manager
  ];
}
