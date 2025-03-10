{pkgs, ...}: {
  console = {
    useXkbConfig = true;
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v20b.psf.gz";
    packages = [pkgs.terminus_font];
    colors = [
      "000000"
      "ff5555"
      "50fa7b"
      "f1fa8c"
      "bd93f9"
      "ff79c6"
      "8be9fd"
      "f8f8f2"
      "6272a4"
      "ff7777"
      "70fa9b"
      "ffb86c"
      "cfa9ff"
      "ff88e8"
      "97e2ff"
      "ffffff"
    ];
  };
}
