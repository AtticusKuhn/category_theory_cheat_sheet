{
  description = "Category Theory Cheat Sheet";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    # Use local git repo (requires committing changes)
  };

  outputs = inputs @ {
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = { system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
            ];
          };
  my-python = pkgs.python3;
  python-with-my-packages = my-python.withPackages (p: with p; [
    pygments
    # add more needed python packages here
  ]);

  my-texlive = pkgs.texlive.combine { 
    inherit (pkgs.texlive) 
    scheme-medium

    preprint
    catchfile
    comment
    environ
    framed
    fvextra
    hyperxmp
    ifmtarg
    lipsum
    marginnote
    minted
    ncctools
    pygmentex
    todonotes
    totpages
    upquote
    xargs
    xifthen
    xstring

    # add more needed texlive packages here
    ; 
  };

        in
        {

          devShells.default = pkgs.mkShell {
            # Provide Lean + Lake matching ./lean-toolchain, plus essential tools.
            # Keep this minimal to avoid attr or non-derivation issues on some channels.
            # Use oxalica/rust-overlay nightly toolchain so `cargo bench`
            # works for crates requiring unstable features.
            packages =
              [

                my-texlive
                python-with-my-packages
              ]
              ++ (with pkgs; [
                git unzip codex
                gemini-cli
                claude-code
                sshpass
                # include this if you wish to run --pure shells, otherwise save you the trouble and use your texlive scheme-full system installation

                # "normal dependencies"
                python3
                gnumake
                which
                evince
              ]);
          };
        };
    };
}
