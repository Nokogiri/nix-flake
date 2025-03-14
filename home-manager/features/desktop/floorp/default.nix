{pkgs, ...}: {

  programs.floorp = {
    enable = true;
    profiles.nokogiri.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      iina-open-in-mpv
      ublock-origin
      onetab
      bitwarden
      newtab-adapter
      sponsorblock
      tree-style-tab
      tridactyl
      torrent-control
      enhancer-for-youtube
    ];

    profiles.nokogiri = {
      name = "nokogiri";
      path = "nokogiri";
      bookmarks = {};
      id = 0;
      isDefault = true;
      settings = {
        "apz.fling_min_velocity_threshold" = 5.9;
        "apz.fling_friction" = 1.5e-2;
        "apz.overscroll.enabled" = true;
        "browser.disableResetPrompt" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.tabs.tabMinWidth" = 66;
        "browser.tabs.tabClipWidth" = 86;
        "browser.tabs.tabmanager.enabled" = false;
        "browser.topsites.blockedSponsors" = ''["amazon"]'';
        "dom.security.https_only_mode" = false;
        "general.smoothScroll.msdPhysics.enabled" = false;
        "gfx.webrender.all" = true;
        "identity.fxaccounts.enabled" = true;
        "layout.css.color-mix.enabled" = true;
        "media.ffmpeg.vaapi.enable" = true;
        "media.hardwaremediakeys.enabled" = true;
        "mousewheel.default.delta_multiplier_y" = 275;
        "privacy.trackingprotection.enabled" = true;
        "svg.context-properties.content.enabled" = true;
      };
    };

    profiles.private.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      firefox-color
      iina-open-in-mpv
      onetab
      tree-style-tab
      tridactyl
      sponsorblock
    ];
    profiles.private = {
      name = "private";
      path = "private";
      bookmarks = {};
      id = 1;
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = true;
        "browser.topsites.blockedSponsors" = ''["amazon"]'';
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.disableResetPrompt" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.color-mix.enabled" = true;
        "browser.tabs.tabMinWidth" = 66;
        "browser.tabs.tabClipWidth" = 86;
        "browser.tabs.tabmanager.enabled" = false;
        "apz.fling_min_velocity_threshold" = 1.9;
        "apz.fling_friction" = 1.5e-2;
        #  hw video decoding
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enable" = true;
      };
    };
  };
}
