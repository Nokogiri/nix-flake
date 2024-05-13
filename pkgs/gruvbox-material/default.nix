{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk-engine-murrine,
}:
stdenvNoCC.mkDerivation {
  pname = "gruvbox-material";
  version = "0-unstable-2024-05-12";
  srcs = [
    (fetchFromGitHub {
      owner = "TheGreatMcPain";
      repo = "gruvbox-material-gtk";
      rev = "a1295d8bcd4dfbd0cd6793d7b1583b442438ed89";
      hash = "sha256-VumO8F4ZrFI6GZU1XXaw4MCnP+Nla1rVS3uuSUzpl9E=";
      name = "gruvbox-material-gtk";
    })
    (fetchFromGitHub {
      owner = "SherlockH0";
      repo = "Kvantum-GruvboxMaterial";
      rev = "f175abaa5bf441385d9e91f47fb5853364715664";
      hash = "sha256-LSGwMd3Xxg8IMSqlqFLVrXlD6TEUVucFF+N7qO6E9Pk=";
      name = "gruvbox-material-kvantum";
    })
  ];
  sourceRoot = ".";

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes
    mkdir -p $out/share/icons
    mkdir -p $out/share/Kvantum/Gruvbox-Material

    cp -a gruvbox-material-gtk/themes $out/share
    cp -a gruvbox-material-gtk/icons $out/share
    cp -a gruvbox-material-kvantum/GruvboxMaterial.kvconfig $out/share/Kvantum/Gruvbox-Material/Gruvbox-Material.kvconfig
    cp -a gruvbox-material-kvantum/GruvboxMaterial.svg $out/share/Kvantum/Gruvbox-Material/GruvboxMaterial.svg

    runHook postInstall
  '';
}
