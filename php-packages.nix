{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-2532ede5954d15690cf6e00b6280a3ecd01aff4e";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "2532ede5954d15690cf6e00b6280a3ecd01aff4e";
        sha256 = "0l30w61pvd3c42l28g81z3ninj5hcv8q8kci8yaw57bkgvwfr447";
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
