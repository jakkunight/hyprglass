{
  lib,
  hyprland,
  hyprlandPlugins,
  pixman,
}:
hyprlandPlugins.mkHyprlandPlugin {
  pluginName = "hyprglass";
  version = "0.2.4";
  src = ./.;
  inherit (hyprland) nativeBuildInputs;

  dontUseCmakeConfigure = true;
  dontUseMesonConfigure = true;

  buildInputs = [
    hyprland.dev
    pixman
  ] ++ hyprland.buildInputs;

  buildPhase = "make all";

  meta = {
    description = "Hyprland plugin that add blur, lens, difraction, refraction effects to transparent windows. Inspired by Liquid Glass design";
    homepage = "https://github.com/jakkunight/hyprglass";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "hyprglass";
    platforms = lib.platforms.all;
  };
}
