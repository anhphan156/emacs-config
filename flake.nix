{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = {
    nixpkgs,
    self,
    ...
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [self.overlays.default];
    };
  in {
    packages."x86_64-linux".default = pkgs.emacs;

    overlays.default = _: prev: {
      emacs = let
        emacs-config = prev.runCommandLocal "emacs-config" {} ''
          cp -r ${./emacs-config} $out

          substituteInPlace $out/main.el \
            --replace "<NIX_STORE_PATH>" "$out"
        '';
      in
        prev.symlinkJoin {
          name = "emacs";
          paths = [
            (prev.emacs.pkgs.withPackages (epkgs:
              with epkgs; [
                evil
              ]))
          ];
          nativeBuildInputs = [prev.makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/emacs \
              --add-flags '-q' \
              --add-flags '-l' \
              --add-flags '${emacs-config}/main.el'
          '';
        };
    };
  };
}
