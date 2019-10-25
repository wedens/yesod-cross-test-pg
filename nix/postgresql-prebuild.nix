{ stdenv, fetchurl, unzip }:
stdenv.mkDerivation {
  name = "postgresql-11.5-2-prebuilt";
  src = fetchurl {
    url = "http://get.enterprisedb.com/postgresql/postgresql-11.5-2-windows-x64-binaries.zip";
    sha256 = "01m39dl80q3nh09fjh0xpnsrx0b8fdv77djclryb3svm5snwlq0c";
  };
  nativeBuildInputs = [ unzip ];
  buildInputs = [ unzip ];

  unpackPhase = ''
    unzip $src
  '';
  dontBuild = true;
  dontStrip = true;
  installPhase = ''
    install -d $out/lib
    # dlls
    for dll in $(find ./pgsql/lib -name "*.dll"); do
        install -C -m 755 $dll $out/lib
    done
    for dll in $(find ./pgsql/bin -name "*.dll"); do
        install -C -m 755 $dll $out/lib
    done
    # libs
    for lib in $(find ./pgsql/lib -name "*.lib"); do
        install -C -m 755 $lib $out/lib
    done
    # archives
    for archive in $(find ./pgsql/lib -name "*.a"); do
        install -C -m 755 $archive $out/lib
    done

    cp -r ./pgsql/include $out/include

    install -d $out/bin
    install -C -m 0644 ./pgsql/bin/pg_config.exe $out/bin
  '';
}
