{ pkgs }:
{
  pkgs.stdenv.mkDerivation {
    name = "emacs-vterm";
    src = fetchGit {
      name = "emacs-libvterm";
      url = "https://github.com/akermu/emacs-libvterm/";
      rev = "3e5a9b754b8e61850bb7d1b63b090b9fbf6687f3";
      # sha256 = "1px5nnwlnpiqry7s99ykvjf2hqryixnl6qvv9wj3808qkls6wykk";
      # "date": "2023-02-17T10:28:45+08:00",
    };
    nativeBuildInputs = with pkgs; [
      cacert
      clang
      cmake
      git
      libtool
      perl
    ];
    buildPhase = ''
      export LIBTOOL=libtool
      export USE_SYSTEM_LIBVTERM=false
      cmake .  && make
      cd ..
    '';
    installPhase = ''
      mkdir --parents "$out"
      cp -r * "$out/"
    '';
  };
}
