{
  lib,
  stdenv,
  fetchFromGitHub,
  gn,
  pkg-config,
  ninja,
  unstableGitUpdater,
  python3,
}:

stdenv.mkDerivation {
  # TODO: Find / apply NixOS package name conflict resolution algorithm.
  pname = "Antares (game)";
  version = "v0.9.1-unstable-2024-12-09";

  src = fetchFromGitHub {
    owner = "arescentral";
    repo = "antares";
    rev = "a63a4132b5a5675b1f4d2f07e6ebb0711f2a1745";
    hash = "sha256-S7yG50x7lrPmqCzn4s6ho0toXJXM549jVf4qtsPZ3mU=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    python3
    ninja
    gn
    pkg-config
  ];

  buildInputs = [ ];

  strictDeps = true;

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Antares is a tactical space-combat game, combining elements of both arcade shooters and real-time strategy games.";
    longDescription = ''
      Ares was a tactical space-combat game written by Nathan Lamont for classic Mac OS.
      Antares is a port of the original Ares code base that was open sourced in 2008. Antares is an extremely faithful reproduction of the original Ares experience, making changes only as necessary to support running on modern computers.
    '';
    homepage = "https://arescentral.org/";
    license = lib.licenses.gpl3Plus;
    # FIXME: Figure this out.
    # mainProgram = "???";
    maintainers = with lib.maintainers; [ nateeag ];
    platforms = lib.platforms.linux;
  };
}
