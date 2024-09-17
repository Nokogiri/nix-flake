{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  more-itertools,
  click,
  chevron,
  hyprland,
  makeWrapper,
}:

buildPythonPackage rec {
  pname = "hyprshade";
  version = "3.2.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "loqusion";
    repo = "hyprshade";
    rev = "152cd2ea06d9412d62bc628d62ee5af7771190b1";
    hash = "sha256-VRoP7WIiHL7E0uDZWTl/0HX+YV6rOHhmGuU8NyOOwXE=";
  };

  nativeBuildInputs = [
    hatchling
    makeWrapper
    chevron
  ];

  propagatedBuildInputs = [
    more-itertools
    click
    chevron
  ];

  postFixup = ''
    wrapProgram $out/bin/hyprshade \
      --set HYPRSHADE_SHADERS_DIR $out/share/hyprshade/shaders \
      --prefix PATH : ${lib.makeBinPath [ hyprland ]}
  '';

  meta = with lib; {
    homepage = "https://github.com/loqusion/hyprshade";
    description = "Hyprland shade configuration tool";
    mainProgram = "hyprshade";
    license = licenses.mit;
    maintainers = with maintainers; [ willswats ];
    platforms = platforms.linux;
  };
}
