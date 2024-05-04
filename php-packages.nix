{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-434133b7b1341885bd064ba84ee48732abeb9b3d";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "434133b7b1341885bd064ba84ee48732abeb9b3d";
        sha256 = "1m753gy4dicajxhrxvvkxbb6pchdppbkwvwbf4z9dzlxnwxsij00";
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "svanderburg-php-sbeditor";
  src = composerEnv.filterSrc ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    license = "Apache-2.0";
  };
}
