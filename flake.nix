{
  description = "Resume in Typst";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      perSystem = { pkgs, ... }: {
        packages = let
          fonts = [
            (pkgs.iosevka-bin.override { variant = "etoile"; })
            (pkgs.iosevka-bin.override { variant = "slab"; })
            (pkgs.iosevka-bin.override { variant = "aile"; })
            pkgs.iosevka
          ];
          fontPaths = builtins.concatStringsSep " " (builtins.map (f: "--font-path " + f) fonts);
          resumeBase = { config ? [ "software" ] }:
            let
              configStr = builtins.concatStringsSep " "
                (builtins.map (f: "--define " + f + "=true") config);
            in pkgs.stdenv.mkDerivation {
              name = "resume";
              buildInputs = [ pkgs.typst pkgs.perlPackages.TemplateToolkit ];
              src = ./.;
              buildPhase = ''
                tpage ${configStr} main.typ > resume.typ
                typst compile ${fontPaths} resume.typ resume.pdf
              '';
              installPhase = ''
                mkdir $out
                cp resume.pdf $out
              '';
            };
        in {
          default = resumeBase { config = [ "all" ]; };
          resumeAcademic = resumeBase { config = [ "research" ]; };
          resumeDevOps = resumeBase { config = [ "software" "devops" ]; };
        };
      };
    };
}
