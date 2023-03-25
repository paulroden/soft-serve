{
  description = "A collection of crumbly flakes. ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  
  outputs =
    { self
    , utils
    , nixpkgs
    }:
    utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages = {
          emacs-vterm = import ./emacs-vterm { inherit pkgs; };
        };
      }
    ) // {
      overlays.default = (
        final: _: {
          emacs-vterm = import ./emacs-vterm { pkgs = final; };
        }
      );
    };
}
