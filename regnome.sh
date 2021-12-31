#!/bin/sh
set -ex

pushd ~
rm -r Desktop Documents Downloads Music Pictures Public \
Templates Videos .config/user-dirs.dirs
sed -i s/createDirectories/#createDirectories/ .config/nixpkgs/home.nix 
sed -i s/programs.direnv.nix-direnv.enable/#programs.direnv.nix-direnv.enable/ .config/nixpkgs/home.nix 
sed -i s/programs.exa.enable/#programs.exa.enable/ .config/nixpkgs/home.nix 
home-manager switch
sed -i s/#createDirectories/createDirectories/ .config/nixpkgs/home.nix 
sed -i s/#programs.direnv.nix-direnv.enable/programs.direnv.nix-direnv.enable/ .config/nixpkgs/home.nix 
sed -i s/#programs.exa.enable/programs.exa.enable/ .config/nixpkgs/home.nix 
