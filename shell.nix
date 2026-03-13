{
  mkShell,
  callPackage,
  rustPlatform,

  # extra tooling
  cargo,
  clippy,
  rustfmt,
  rust-analyzer,
}:
let
  defaultPackage = callPackage ./default.nix { };
in
mkShell {
  inputsFrom = [ defaultPackage ];

  env = {
    RUST_SRC_PATH = rustPlatform.rustLibSrc;
  };

  packages = [
    cargo
    clippy
    rustfmt
    rust-analyzer
  ];
}
