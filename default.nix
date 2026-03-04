{
  lib,
  cmake,
  hyprland,
  hyprlandPlugins,
  fetchFromGitHub,
  gnumake,
}:

hyprlandPlugins.mkHyprlandPlugin (finalAttrs: {
  pluginName = "hyprglass";
  version = "0-unstable-2026-03-04";

  src = fetchFromGitHub {
    owner = "jakkunight";
    repo = "hyprglass";
    rev = "0e82595ec5c1b04e30b559fe689f3ceae24bc3ef";
    hash = "sha256-i2NXWuvVM+n6m4kwfqVTUOpinNWJHhSQdzMPbMR/Bn8=";
  };

  # any nativeBuildInputs required for the plugin
  nativeBuildInputs = [ gnumake ];

  # set any buildInputs that are not already included in Hyprland
  # by default, Hyprland and its dependencies are included
  buildInputs = [ ];

  installPhase = ''
      mkdir -p $out/lib
      cp ./*.so $out/lib
    '';

  meta = {
    description = "Hyprland plugin that add blur, lens, difraction, refraction effects to transparent windows. Inspired by Liquid Glass design";
    homepage = "https://github.com/jakkunight/hyprglass";
    changelog = "https://github.com/jakkunight/hyprglass/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "hyprglass";
    platforms = lib.platforms.all;
  };
})
