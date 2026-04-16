{ lib
, stdenv
, fetchurl
, pkg-config
, expat
, zlib
, lz4
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "overpass-api";
  version = "3s_v0.7.62.4";

  src = fetchurl {
    url = "https://dev.overpass-api.de/releases/osm-${finalAttrs.version}.tar.gz";
    hash = "sha256-/fMv4W/2ewRlBFQ/Q3AJVWmsYccDnObGNCPCZa3VEM8=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    expat
    zlib
    lz4
  ];

  configurePhase = ''
    runHook preConfigure
    ./configure --prefix=$out
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    make
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/libexec/overpass-api

    cp -r bin/. $out/bin/
    cp -r cgi-bin/. $out/libexec/overpass-api/

    runHook postInstall
  '';

  meta = {
    description = "A database engine to query the OpenStreetMap data";
    homepage = "https://github.com/drolbr/Overpass-API";
    license = lib.licenses.agpl3Only;
    platforms = lib.platforms.linux;
  };
})
