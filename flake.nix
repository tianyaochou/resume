{
  description = "Resume in Typst";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, }: flake-utils.lib.eachDefaultSystem (system:
  let pkgs = nixpkgs.legacyPackages.${system};
      stdenv = pkgs.stdenv;
  in 
  {
    packages = rec {
      resume = stdenv.mkDerivation {
        name = "resume";
        buildInputs = [ pkgs.typst pkgs.iosevka ];
        src = ./.;
        buildPhase = ''
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
