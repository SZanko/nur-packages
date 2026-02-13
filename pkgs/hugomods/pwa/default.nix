{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule (finalAttrs: {
  pname = "hugomods-pwa";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "hugomods";
    repo = "pwa";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8t4nv/AnqcfB9G4Jai9zFc1Wf5qKd7yOBXlxf5hL3CY=";
  };

  vendorHash = "sha256-PdQPnMBH+FqyG6QzcClczDBVx8fXTcPCBDsTCmdD2KM=";

  ldflags = [ "-s" ];

  meta = {
    description = "Rocket: Hugo programmatic PWA Module, which allows precaching assets, making sites installable and offline available";
    homepage = "https://github.com/hugomods/pwa";
    changelog = "https://github.com/hugomods/pwa/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "hugomods-pwa";
  };
})
