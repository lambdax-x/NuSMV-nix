{ pkgs ? import <nixpkgs> {} }:

let
stdenv = pkgs.stdenv;
fetchurl = pkgs.fetchurl;
nusmvBin = fetchurl {
  url = "http://nusmv.fbk.eu/distrib/NuSMV-2.6.0-linux64.tar.gz";
  sha256 = "1370x2vwjndv9ham5q399nn84hvhm1gj1k7pq576qmh4pi12xc8i";
};
in
stdenv.mkDerivation {
  name = "NuSMV-bin";
  version = "2.6.0";
  meta = with stdenv.lib; {
    license = licenses.lgpl21;
  };

  src = nusmvBin;

  installPhase = ''
    mkdir $out
    cp -r bin lib include share $out
  '';
}
