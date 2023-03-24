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
        emacs-vterm = import ./emacs-vterm { inherit pkgs; };
      in {
        packages = {
          inherit emacs-vterm;
        };
        overlays =
          self: super: {
            inherit pkgs;
            inherit emacs-vterm;
          };
      }
    );
}
