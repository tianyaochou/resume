{
  description = "Resume in Typst";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  inputs.devshell.url = "github:numtide/devshell";

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshell.flakeModule
      ];
      systems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      perSystem = { pkgs, ... }: {
        devshells.default = {
          packages = with pkgs; [ typst-lsp ];
        };
        packages = let
          fonts = [
            (pkgs.iosevka-bin.override { variant = "etoile"; })
            (pkgs.iosevka-bin.override { variant = "slab"; })
            (pkgs.iosevka-bin.override { variant = "aile"; })
            pkgs.iosevka
          ];
          fontPaths = builtins.concatStringsSep " " (builtins.map (f: "--font-path ${f}") fonts);
          resumeBase = { config ? [ "software" ] }:
            let
              configStr = builtins.concatStringsSep " "
                (builtins.map (f: "--metadata " + f + "=true") config);
            in pkgs.stdenv.mkDerivation {
              name = "resume";
              buildInputs = [ pkgs.typst pkgs.pandoc ];
              src = ./.;
              buildPhase = ''
                echo "" | pandoc -f typst -t typst --template main.typ ${configStr} -o resume.typ
                typst compile ${fontPaths} resume.typ resume.pdf
              '';
              installPhase = ''
                mkdir $out
                cp resume.pdf $out
              '';
            };
        in {
          default = resumeBase { config = [ "research" "software" "devops" "hardware" "web" ]; };
          resumeAcademic = resumeBase { config = [ "research" ]; };
          resumeDevOps = resumeBase { config = [ "software" "devops" ]; };
        };
      };
    };
}
