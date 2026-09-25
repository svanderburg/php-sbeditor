{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-e348b06cba899322d1371384c532413890596f91";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "e348b06cba899322d1371384c532413890596f91";
        sha256 = "1d63dyp7mbdps1sp0wbkd0acs00id6cfayv69bckvhdwkhl9vsi5";
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
