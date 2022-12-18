{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-0a9c962dcb92dfade5015c43637b8ab8800f52c3";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "0a9c962dcb92dfade5015c43637b8ab8800f52c3";
        sha256 = "0v5s2w9l8dcxk70m8v3mqad2505i7h9xlzb659p1b9csjyr6d21v";
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
