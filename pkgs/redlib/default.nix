{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "redlib";
  version = "0-unstable-2025-12-04";

  src = fetchFromGitHub {
    owner = "chowder";
    repo = "redlib";
    rev = "42fe41bc4c64690aa91cd1cfecec3bad3438354f";
    hash = "sha256-iYH5WeQLitDA6unTJoR0+DYQWmTSQd0WRFfwRYvkVHI=";
  };

  cargoHash = "sha256-/oSZR/VMYyDTA9b48EXll/FC7UwN0xhA9BtQVwrBoMk=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };

  meta = {
    description = "Private front-end for Reddit";
    homepage = "https://github.com/chowder/redlib";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ szanko ];
    mainProgram = "redlib";
  };
})
