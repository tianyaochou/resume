{
  description = "Resume in Typst";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  inputs.devshell.url = "github:numtide/devshell";
  inputs.pkl-nix.url = "github:capslock/pkl-flake";

  outputs = inputs@{ nixpkgs, flake-parts, pkl-nix, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshell.flakeModule
      ];
      systems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      perSystem = { pkgs, inputs', ... }: {
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
              pkl = "${inputs'.pkl-nix.packages.pkl}/bin/pkl-cli";
            in pkgs.stdenv.mkDerivation {
              name = "resume";
              buildInputs = [ pkgs.typst pkgs.pandoc ];
              src = ./.;
              pkl = pkl;
              configStr = configStr;
              fontPaths = fontPaths;
              # buildPhase = ''
              #   ${pkl} eval -f json resume.pkl -o resume.json
              #   ${pkl} eval -f json projects.pkl -o projects.json
              #   echo "" | pandoc -f typst -t typst --template main.typ ${configStr} -o resume.typ
              #   typst compile ${fontPaths} resume.typ resume.pdf
              # '';
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
