{
  lib,
  python3Packages,
  fetchFromGitHub,
  nix-update-script,
  wrapGAppsHook4,
  gobject-introspection,
  gtk4,
  libadwaita,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "pipewire-controller";
  version = "0.5.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "knightinfected";
    repo = "PipeWireController";
    tag = "v${finalAttrs.version}";
    hash = "sha256-18Tbwv4uv75U+l7TQY+6spppB5OkSfHmDn2pSy5EUGM=";
  };

  build-system = [
    python3Packages.hatchling
  ];

  nativeBuildInputs = [
    gobject-introspection
    wrapGAppsHook4
  ];

  buildInputs = [
    gtk4
    libadwaita
  ];

  dependencies = with python3Packages; [
    numpy
    pycairo
    pygobject3
    soundfile
  ];

  pythonImportsCheck = [
    "pwctl"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "GTK4/libadwaita audio control center for PipeWire — audio management, signal paths, virtual devices, live patchbay, parametric equalizer, performance monitoring, filter chains, microphone cleanup (echo/noise), HRIR virtual surround, routing snapshots, per-app policies, LADSPA/LV2 effect inserts and more. On the AUR: pipewire-control-center";
    homepage = "https://github.com/knightinfected/PipeWireController";
    changelog = "https://github.com/knightinfected/PipeWireController/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = with lib.licenses; [
      gpl3Only
      gpl3Plus
    ];
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pipewire-control-center";
  };
})
