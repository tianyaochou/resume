{
  description = "Resume in Typst";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, }: flake-utils.lib.eachDefaultSystem (system:
  let pkgs = nixpkgs.legacyPackages.${system};
      stdenv = pkgs.stdenv;
      fonts = [ pkgs.iosevka ];
      fontPaths = builtins.concatStringsSep ":" fonts;
  in 
  {
    packages = rec {
      resume = stdenv.mkDerivation {
        name = "resume";
        buildInputs = [ pkgs.typst ];
        src = ./.;
        buildPhase = ''
          export TYPST_FONT_PATHS=${fontPaths}
          typst compile main.typ resume.pdf
        '';
        installPhase = ''
          mkdir $out
          cp resume.pdf $out
        '';
      };
      default = resume;
    };
  });
}
