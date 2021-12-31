{}:
with (import <nixpkgs> {});
let
  include = [
    ./edit-selection.sh
    ./gpl
    ./myip
    ./s3
    ./vantemp.sh
    ./regnome.sh
  ];
in runCommand "scripts" {inherit include;} ''
mkdir -p $out/bin
for n in $include; do
  script=$(echo $n | cut -c 45-) # there must be a better way.
  cp $n "$out/bin/$script"
done
''
