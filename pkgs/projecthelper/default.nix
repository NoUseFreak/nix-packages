# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "1x0xhbm1g6s2060rg97xl5pbs2byplvlkpqlr78dwxbwdfr1hgi4";
    x86_64-linux = "0z3m5wnw0h337mkp8qma9phq311m1i2kazaprja3hqr455vyqqxc";
    aarch64-linux = "01h7l2iqf6n7spky4d0rnji15hd12hbvwhfibcj7aiwkydzip3il";
    x86_64-darwin = "0hpgpgafx7nwfzb8dw0470wywdkl228x7s3vpmmpapq8nmw6yxpy";
    aarch64-darwin = "0hmjqiz70ndyyk9yq5a03albd6r249x059ajynwc2ddrcczpa5qr";
  };

  urlMap = {
    i686-linux = "https://github.com/NoUseFreak/projecthelper/releases/download/v0.6.0/projecthelper_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/NoUseFreak/projecthelper/releases/download/v0.6.0/projecthelper_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/NoUseFreak/projecthelper/releases/download/v0.6.0/projecthelper_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/NoUseFreak/projecthelper/releases/download/v0.6.0/projecthelper_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/NoUseFreak/projecthelper/releases/download/v0.6.0/projecthelper_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "projecthelper";
  version = "0.6.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./projecthelper $out/bin/projecthelper
    installManPage ./manpages/projecthelper.1.gz
  '';

  system = system;

  meta = {
    description = "Project helper tries to save time";
    homepage = "https://github.com/nousefreak/projecthelper";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
