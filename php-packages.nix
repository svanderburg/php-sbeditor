{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-abaed513ead847b98696797467bc8c8422a64d17";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "abaed513ead847b98696797467bc8c8422a64d17";
        sha256 = "0f7m5ma3ffhybgq6h2zclmylhf5lmnhizgk5z8ip3cp4cigkcl2c";
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
