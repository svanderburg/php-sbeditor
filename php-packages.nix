{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-cb3dd1c0de175b36ddafd3c9d64c8e90b35134de";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "cb3dd1c0de175b36ddafd3c9d64c8e90b35134de";
        sha256 = "0s0qdd6y2p4l9cnv08m1bbqlcwndnbkf18rg904x400hlhmd994z";
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
