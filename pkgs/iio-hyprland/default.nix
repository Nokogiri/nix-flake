{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  pkg-config,
  ninja,
  dbus,
  systemd,
}:

stdenv.mkDerivation rec {
  pname = "iio-hyprland";
  version = "git";

  #src = ./src;
  src = fetchFromGitHub {
    owner = "Nokogiri";
    repo = "iio-hyprland";
    rev = "a24989f001bc9f38267818538330cde5879105b4";
    hash = "sha256-UcUp88TY2m5R7Qc7ynZ01I4AwQzkso6zZZ+sGU58EW8=";
  };

  #patches = [ ./test.patch ];

  buildInputs = [
    dbus
    systemd
  ];

  nativeBuildInputs = [
    ninja
    meson
    pkg-config
  ];
}
