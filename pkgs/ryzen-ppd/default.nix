{
  lib,
  pkgs,
  fetchgit,
  python312Packages,
  ryzenadj,
  wrapGAppsHook,
}:
python312Packages.buildPythonApplication {
  pname = "ryzen-ppd";
  version = "0.5";

  src = fetchgit {
    url = "https://git.sr.ht/~nokogiri/ryzen-ppd";
    #rev = "f1fe7aba834b32e117a33a33fe5b36e4192469a2";
    rev = "d205b41c37f4d56f5af0da8b983307162a098622";
    #sha256 = "sha256-+yDdkL7DzgEFp5ncfg86h3eCtlK5mACdAW4N0rJoXyA=";
    sha256 = "sha256-+JsPPCFEoiLCUmFEO4zazcssmH/b/JvLfbBc4Con1VE=";
  };

  propagatedBuildInputs = [
    python312Packages.dbus-python
    python312Packages.pygobject3
    python312Packages.setuptools
    python312Packages.dbus-next
    ryzenadj
  ];
  buildInputs = [ryzenadj];
  nativeBuildInputs = [
    ryzenadj
    wrapGAppsHook
  ];
  postInstall = ''
    install -Dm644 $src/scripts/systemd/ryzen-ppd.service -t $out/lib/systemd/system
    substituteInPlace $out/lib/systemd/system/ryzen-ppd.service --replace-quiet "/usr/bin/ryzen-ppd" "$out/bin/ryzen-ppd"
    substituteInPlace $out/lib/python3.12/site-packages/ryzen_ppd/cpu.py --replace-quiet "libryzenadj.so" "${pkgs.ryzenadj}/lib/libryzenadj.so"
  '';
  doCheck = false;

  meta = with lib; {
    description = "CHANGE";
    homepage = "https://github.com/CHANGE/ryzen-ppd";
    license = licenses.gpl3;
  };
}
