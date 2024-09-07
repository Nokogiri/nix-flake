{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,
  fetchPypi
}:

buildPythonPackage {
  pname = "chevron";
  version = "0.14.0";
  format = "setuptools";

  # No tests available in the PyPI tarball
  #src = fetchFromGitHub {
  #  owner = "noahmorrison";
  #  repo = "chevron";
  #  rev = "0.14.0";
  #  sha256 = "0l1ik8dvi6bgyb3ym0w4ii9dh25nzy0x4yawf4zbcyvvcb6af47s";
  #};
  src = fetchPypi {
    #inherit pname ;
    pname = "chevron";
    version = "0.14.0";
    hash = "sha256-h2E6r99td7apD/BzFlphrlCG4hrUkFeqDlNoFgGADr8=";
  };

  doCheck = false;
  checkPhase = ''
    ${python.interpreter} test_spec.py
  '';

  meta = with lib; {
    homepage = "https://github.com/noahmorrison/chevron";
    description = "Python implementation of the mustache templating language";
    mainProgram = "chevron";
    license = licenses.mit;
    maintainers = with maintainers; [ dhkl ];
  };
}
