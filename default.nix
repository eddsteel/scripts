{}:
with (import <nixpkgs> {});
let
  include = [
    "edit-selection.sh"
    "gpl"
    "myip"
    "s3"
    "regnome.sh"
    "emms"
  ];
in stdenv.mkDerivation rec {
  name = "scripts";
  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out/bin
    for n in ${toString include}; do cp -v ${./.}/$n $out/bin; done
    for n in ${toString include}; do chmod +x $out/bin/$n; done
  '';
}
