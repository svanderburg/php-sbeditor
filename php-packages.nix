{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-ee777698c697ddee23e060db9621487022f76c11";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "ee777698c697ddee23e060db9621487022f76c11";
        sha256 = "0l878g61d8kqmp3inwglxv2c50c6r0dmf4gi0p2n5ww59m3f29vx";
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
