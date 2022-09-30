{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-502b053ea3475f4e562f8f7ede48904ee65f8e7e";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "502b053ea3475f4e562f8f7ede48904ee65f8e7e";
        sha256 = "02q1qqry2cpqs7yqghi26l2ggw7dmwsb0xmd9f3m49i36b8w4mmn";
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
