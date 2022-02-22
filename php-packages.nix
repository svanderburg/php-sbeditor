{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-cbe47d7b902779decd54399dac570beb1e75373a";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "cbe47d7b902779decd54399dac570beb1e75373a";
        sha256 = "09kk38vccjwp7bdz1qh7czgf6ik6rxhzhv57x4ipz44jism9ly21";
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "svanderburg-php-sbeditor";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    license = "Apache-2.0";
  };
}
