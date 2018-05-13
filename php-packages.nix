{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {};
  devPackages = {
    "cilex/cilex" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cilex-cilex-7acd965a609a56d0345e8b6071c261fbdb926cb5";
        src = fetchurl {
          url = https://api.github.com/repos/Cilex/Cilex/zipball/7acd965a609a56d0345e8b6071c261fbdb926cb5;
          sha256 = "0hi8xfwkj7bj15mpaqxj06bngz4gk2idhkc9yxxr5k4x72swvhzp";
        };
      };
    };
    "cilex/console-service-provider" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cilex-console-service-provider-25ee3d1875243d38e1a3448ff94bdf944f70d24e";
        src = fetchurl {
          url = https://api.github.com/repos/Cilex/console-service-provider/zipball/25ee3d1875243d38e1a3448ff94bdf944f70d24e;
          sha256 = "1g9zgx1hplkbhhqsci5l4m9j7mi6w6j6b32bg0sn3b9q3510damg";
        };
      };
    };
    "container-interop/container-interop" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "container-interop-container-interop-79cbf1341c22ec75643d841642dd5d6acd83bdb8";
        src = fetchurl {
          url = https://api.github.com/repos/container-interop/container-interop/zipball/79cbf1341c22ec75643d841642dd5d6acd83bdb8;
          sha256 = "1pxm461g5flcq50yabr01nw8w17n3g7klpman9ps3im4z0604m52";
        };
      };
    };
    "doctrine/annotations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-annotations-232c5da3903f788e02328b4e8486eceea0c76e58";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/annotations/zipball/232c5da3903f788e02328b4e8486eceea0c76e58;
          sha256 = "0p3nahqdpmyvl8s7h0jw868d3x9ybds4rkg9gmxv7rh8md5rm08x";
        };
      };
    };
    "doctrine/instantiator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-instantiator-870a62d7b0d63d4e0ffa8f2ce3ab7c8a53d1846d";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/instantiator/zipball/870a62d7b0d63d4e0ffa8f2ce3ab7c8a53d1846d;
          sha256 = "1bhrkfabdmfx4ssa0wx80a21i0riml9cckjllvdcjhly5c84hi7r";
        };
      };
    };
    "doctrine/lexer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-lexer-b4f2b2fe5d5726e08a7d46fe3149b577e738463a";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/lexer/zipball/b4f2b2fe5d5726e08a7d46fe3149b577e738463a;
          sha256 = "00id9kalqgr8n68j0xkimdc2b2x9s5im0qw38zdsj10z5jzf0xzf";
        };
      };
    };
    "erusev/parsedown" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "erusev-parsedown-1f69f7e69797104e73fdceaae22a4b4e3978f0a4";
        src = fetchurl {
          url = https://api.github.com/repos/erusev/parsedown/zipball/1f69f7e69797104e73fdceaae22a4b4e3978f0a4;
          sha256 = "0ww92xgmwgqg478ci10pm3vsrynbig5sgbjvr0n6fxmj49w9q6q7";
        };
      };
    };
    "herrera-io/json" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "herrera-io-json-60c696c9370a1e5136816ca557c17f82a6fa83f1";
        src = fetchurl {
          url = https://api.github.com/repos/kherge-php/json/zipball/60c696c9370a1e5136816ca557c17f82a6fa83f1;
          sha256 = "1bx6rnrhvfn0ia2c95nhjk2mci0c4aj2s7ijqv0ihvda54abpws0";
        };
      };
    };
    "herrera-io/phar-update" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "herrera-io-phar-update-00a79e1d5b8cf3c080a2e3becf1ddf7a7fea025b";
        src = fetchurl {
          url = https://api.github.com/repos/kherge-abandoned/php-phar-update/zipball/00a79e1d5b8cf3c080a2e3becf1ddf7a7fea025b;
          sha256 = "0dz3pbba9b6x6l8rba36mxa75dy131j3pvjbgads5xibdzb6zsj0";
        };
      };
    };
    "jms/metadata" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jms-metadata-6a06970a10e0a532fb52d3959547123b84a3b3ab";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/metadata/zipball/6a06970a10e0a532fb52d3959547123b84a3b3ab;
          sha256 = "0bmmgwgnphlsp5da9xjxmwky837k8fqyqrwcrfi37c2c32qm1h68";
        };
      };
    };
    "jms/parser-lib" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jms-parser-lib-6067cc609074ae215b96dc51047affee65f77b0f";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/parser-lib/zipball/6067cc609074ae215b96dc51047affee65f77b0f;
          sha256 = "00jn0fw3vvl4a3gfgw97bmpm5cspy11p364lds34fgrpnqh6ikh2";
        };
      };
    };
    "jms/serializer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jms-serializer-c7de3d85a0dec7005337f8999d409f5357d2d6e9";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/serializer/zipball/c7de3d85a0dec7005337f8999d409f5357d2d6e9;
          sha256 = "0n0cfy9ia5cqfkxvy0188kjq5n8z2v83kfqak00gxafhasdcvr34";
        };
      };
    };
    "justinrainbow/json-schema" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "justinrainbow-json-schema-cc84765fb7317f6b07bd8ac78364747f95b86341";
        src = fetchurl {
          url = https://api.github.com/repos/justinrainbow/json-schema/zipball/cc84765fb7317f6b07bd8ac78364747f95b86341;
          sha256 = "0hgk8yqis25ymjcn1nhvdmbk5rkbr0qdz4jqm84zr1rkk2v5ckv9";
        };
      };
    };
    "kherge/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "kherge-version-046ec90aeb307ef57b8fb30905067f802b3f83d5";
        src = fetchurl {
          url = https://api.github.com/repos/kherge-abandoned/Version/zipball/046ec90aeb307ef57b8fb30905067f802b3f83d5;
          sha256 = "16b66s5k95rcqb211i69nnpxjc48dpz8bxc1900fgs89k40wiv5k";
        };
      };
    };
    "monolog/monolog" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "monolog-monolog-fd8c787753b3a2ad11bc60c063cff1358a32a3b4";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/monolog/zipball/fd8c787753b3a2ad11bc60c063cff1358a32a3b4;
          sha256 = "0avf3y8raw23krwdb7kw9qb5bsr5ls4i7qd2vh7hcds3qjixg3h9";
        };
      };
    };
    "nikic/php-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nikic-php-parser-c4bbc8e236a1f21b2b17cfbf3d46aa6ece69b9f7";
        src = fetchurl {
          url = https://api.github.com/repos/nikic/PHP-Parser/zipball/c4bbc8e236a1f21b2b17cfbf3d46aa6ece69b9f7;
          sha256 = "17xpfpa6mgfwf34dawcrw1bgx6y4cavlnm2sj51bnbn08dy2fdhs";
        };
      };
    };
    "phpcollection/phpcollection" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpcollection-phpcollection-f2bcff45c0da7c27991bbc1f90f47c4b7fb434a6";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/php-collection/zipball/f2bcff45c0da7c27991bbc1f90f47c4b7fb434a6;
          sha256 = "0bfbg7bs7q3wmyl3kp3vqshcj0pklj14z1vlxk4ymxrjzxwmb8my";
        };
      };
    };
    "phpdocumentor/fileset" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-fileset-bfa78d8fa9763dfce6d0e5d3730c1d8ab25d34b0";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/Fileset/zipball/bfa78d8fa9763dfce6d0e5d3730c1d8ab25d34b0;
          sha256 = "0ncvq8zfnr3azzpw0navm2lk9w0dskk7mar2m4immzxyip00gp89";
        };
      };
    };
    "phpdocumentor/graphviz" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-graphviz-a906a90a9f230535f25ea31caf81b2323956283f";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/GraphViz/zipball/a906a90a9f230535f25ea31caf81b2323956283f;
          sha256 = "06y7pha2nrki27k2jdpb4l1px5ngpwlwrmgg6lcxlzp4brf1q7ds";
        };
      };
    };
    "phpdocumentor/phpdocumentor" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-phpdocumentor-be607da0eef9b9249c43c5b4820d25d631c73667";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/phpDocumentor2/zipball/be607da0eef9b9249c43c5b4820d25d631c73667;
          sha256 = "1gkvxw5q8fi2rpvc2g31n3bpywwcxjx2p1ickkd40bnvj9qw5wh1";
        };
      };
    };
    "phpdocumentor/reflection" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-59e61accdecf9ea69db71763a0f6f774094f656e";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/Reflection/zipball/59e61accdecf9ea69db71763a0f6f774094f656e;
          sha256 = "19f2xr79vb148my0mm3wm41aqapa64zcpp6wn4rk06i869g7xymb";
        };
      };
    };
    "phpdocumentor/reflection-docblock" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-docblock-e6a969a640b00d8daa3c66518b0405fb41ae0c4b";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/ReflectionDocBlock/zipball/e6a969a640b00d8daa3c66518b0405fb41ae0c4b;
          sha256 = "0hgrmgcdi9qadwsjcplg6lfjjwdjfajd2vm97bd0jkh0ykrxqghs";
        };
      };
    };
    "phpoption/phpoption" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpoption-phpoption-94e644f7d2051a5f0fcf77d81605f152eecff0ed";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/php-option/zipball/94e644f7d2051a5f0fcf77d81605f152eecff0ed;
          sha256 = "0vl5di2k4fypy1698hl86yjchlkcc8wacrgzlk6z66szf9xnn3nc";
        };
      };
    };
    "pimple/pimple" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "pimple-pimple-cae373ff3d87f8763fe78557312ec7f47f5c745c";
        src = fetchurl {
          url = https://api.github.com/repos/silexphp/Pimple/zipball/cae373ff3d87f8763fe78557312ec7f47f5c745c;
          sha256 = "1gvp8bbv8b0m8hd032bx5r4af791panmm3lppm85p3mjxscspzqf";
        };
      };
    };
    "psr/cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-cache-78c5a01ddbf11cf731f1338a4f5aba23b14d5b47";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/cache/zipball/78c5a01ddbf11cf731f1338a4f5aba23b14d5b47;
          sha256 = "0khxk3yddmid8f7f5n37npww0vfpwwyx8mzc0an4qbp91xk5wa40";
        };
      };
    };
    "psr/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-container-2cc4a01788191489dc7459446ba832fa79a216a7";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/container/zipball/2cc4a01788191489dc7459446ba832fa79a216a7;
          sha256 = "1hkf71bigxl1qi49bvh5ins6x50dqa5i27i5ilqcnfa0nb3ljxc1";
        };
      };
    };
    "psr/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-log-3490ba5925e6dcbe6de950c5c6b8dce9f6e96eda";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/log/zipball/3490ba5925e6dcbe6de950c5c6b8dce9f6e96eda;
          sha256 = "0bzljrfxcfy4rjjg63v0pskqa9mjkj05x6akxb08sfkw70srqz47";
        };
      };
    };
    "psr/simple-cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-simple-cache-408d5eafb83c57f6365a3ca330ff23aa4a5fa39b";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/simple-cache/zipball/408d5eafb83c57f6365a3ca330ff23aa4a5fa39b;
          sha256 = "1djgzclkamjxi9jy4m9ggfzgq1vqxaga2ip7l3cj88p7rwkzjxgw";
        };
      };
    };
    "seld/jsonlint" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "seld-jsonlint-d15f59a67ff805a44c50ea0516d2341740f81a38";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/jsonlint/zipball/d15f59a67ff805a44c50ea0516d2341740f81a38;
          sha256 = "1yd37g3c9gjk6d0qpd12xrlgd9mfvndv69h41n6fasvr1ags4ya1";
        };
      };
    };
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-365ecf3d2f5c0046d1bd7860a1efc009164ffb3b";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "365ecf3d2f5c0046d1bd7860a1efc009164ffb3b";
        sha256 = "0nl4z9l827y0aizpzhs5dpjwzkgjhymf9z140xbvyj4ckjcmrzp5";
      };
    };
    "symfony/config" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-config-93bdf96d0e3c9b29740bf9050e7a996b443c8436";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/config/zipball/93bdf96d0e3c9b29740bf9050e7a996b443c8436;
          sha256 = "1nidxy73y2562vyqd5r1ny9qvlmz3aqygks4y5paaxpnd8l8yh3k";
        };
      };
    };
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-932d1e4f7f33ee37d3534f5f452474daa66283c2";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/console/zipball/932d1e4f7f33ee37d3534f5f452474daa66283c2;
          sha256 = "08ik7rm1z8k1ar19z826rj9j23dy4wf43n0k79rzrbm5mj7nq78f";
        };
      };
    };
    "symfony/debug" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-debug-697c527acd9ea1b2d3efac34d9806bf255278b0a";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/debug/zipball/697c527acd9ea1b2d3efac34d9806bf255278b0a;
          sha256 = "00d4kbzswrymand3rrhyc173fs26x55d38bvs17d5y6bk5glr6q1";
        };
      };
    };
    "symfony/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-9b69aad7d4c086dc94ebade2d5eb9145da5dac8c";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/event-dispatcher/zipball/9b69aad7d4c086dc94ebade2d5eb9145da5dac8c;
          sha256 = "16zfkn3yw6nbkvc6sk5i7rp38hpda602499zvvys3l1hcx4cc2b2";
        };
      };
    };
    "symfony/filesystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-filesystem-b2da5009d9bacbd91d83486aa1f44c793a8c380d";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/filesystem/zipball/b2da5009d9bacbd91d83486aa1f44c793a8c380d;
          sha256 = "1ijgs2yj900q26f1dr81nbb1s3hjmhzh4pap13145r71acjh7q37";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-f53635b46bc2e43c2e325482666e09381cb5c9b5";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/finder/zipball/f53635b46bc2e43c2e325482666e09381cb5c9b5;
          sha256 = "01lk4wyyd1iw6rqa173q3sr92cg1zrg6q8b7jz0046h1vv94mp9k";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-7cc359f1b7b80fc25ed7796be7d96adc9b354bae";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-ctype/zipball/7cc359f1b7b80fc25ed7796be7d96adc9b354bae;
          sha256 = "139j2zcqd9dcb00g3qgan3lkamffx7a7jxz2dlwm0b1c6m30zapn";
        };
      };
    };
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-3296adf6a6454a050679cde90f95350ad604b171";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-mbstring/zipball/3296adf6a6454a050679cde90f95350ad604b171;
          sha256 = "02wyx9fjx9lyc5q5d3bnn8aw9xag8im2wqanmbkljwd5vmx9k9b2";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-ee2c91470ff262b1a00aec27875d38594aa87629";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/process/zipball/ee2c91470ff262b1a00aec27875d38594aa87629;
          sha256 = "1p4jz6fr71kd4bc9hpmdywvgdpjm3ryh8dkfjwrix71q5v5wzkd3";
        };
      };
    };
    "symfony/stopwatch" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-stopwatch-57021208ad9830f8f8390c1a9d7bb390f32be89e";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/stopwatch/zipball/57021208ad9830f8f8390c1a9d7bb390f32be89e;
          sha256 = "1x0sfv12wy8zg44xqkgii7p60vn3cab33zi0clcg8qpnx73qx40b";
        };
      };
    };
    "symfony/translation" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-translation-eee6c664853fd0576f21ae25725cfffeafe83f26";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/translation/zipball/eee6c664853fd0576f21ae25725cfffeafe83f26;
          sha256 = "1l6nxk7ik8a0hj9lrxgbzwi07xiwm9aai1yd4skswnb0r3qbbxzq";
        };
      };
    };
    "symfony/validator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-validator-96bbfd5534d2e07ba45255bad27ee90d3bc121a3";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/validator/zipball/96bbfd5534d2e07ba45255bad27ee90d3bc121a3;
          sha256 = "1qc5p4dw2ks7575yqcs5l37i86gxcs2m67sx9r8z90j8gdismkhn";
        };
      };
    };
    "twig/twig" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "twig-twig-5f18e99163a9e443cb9955502c2ac5656115cb1d";
        src = fetchurl {
          url = https://api.github.com/repos/twigphp/Twig/zipball/5f18e99163a9e443cb9955502c2ac5656115cb1d;
          sha256 = "0d4pryiv61cryb5y41fn3y2ghd77pz9p9zdkab4djlz1y1crpsg9";
        };
      };
    };
    "zendframework/zend-cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-cache-1e9b57c9f1a213811a53155419e00244db95b34c";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-cache/zipball/1e9b57c9f1a213811a53155419e00244db95b34c;
          sha256 = "030y0z3l3qldhsxnzfinj59qsq4lf2sqi72xi9z7i66r71cmvgcy";
        };
      };
    };
    "zendframework/zend-config" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-config-2920e877a9f6dca9fa8f6bd3b1ffc2e19bb1e30d";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-config/zipball/2920e877a9f6dca9fa8f6bd3b1ffc2e19bb1e30d;
          sha256 = "1gv5pcv7hclyk77sfc722w7qhxkgpz42wayj7nmqfjda0i6ka8fy";
        };
      };
    };
    "zendframework/zend-eventmanager" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-eventmanager-27eb1489df583456fac8c77c95059dde09ff38d8";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-eventmanager/zipball/27eb1489df583456fac8c77c95059dde09ff38d8;
          sha256 = "0gi1rlhmnmrdl26ck2gi2ylql9b95n9iikcbwhjky013kapadhpa";
        };
      };
    };
    "zendframework/zend-filter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-filter-55826928e35f2c62e4c1e05be8d4df65e3b2a4b2";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-filter/zipball/55826928e35f2c62e4c1e05be8d4df65e3b2a4b2;
          sha256 = "1jhw0k93wwfy8dwvlalcp9rkc9d7anq82yy2zh5hnaajk5j6vm5f";
        };
      };
    };
    "zendframework/zend-hydrator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-hydrator-22652e1661a5a10b3f564cf7824a2206cf5a4a65";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-hydrator/zipball/22652e1661a5a10b3f564cf7824a2206cf5a4a65;
          sha256 = "1wys4x4bw2i83h85wirl4b8l2pszzyr0d067mn6h7njipkqdn0dp";
        };
      };
    };
    "zendframework/zend-i18n" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-i18n-497ef2f0965f7a9a69e73fb5fcaa473e9a0f5e17";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-i18n/zipball/497ef2f0965f7a9a69e73fb5fcaa473e9a0f5e17;
          sha256 = "1rv5kq7qlslbpcmfndclcqnpsb17mlpwwrm909vd1j5avwgw8w4l";
        };
      };
    };
    "zendframework/zend-json" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-json-cecc5d9a44d2e4b7c63e5b6237e6284c874ebd0a";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-json/zipball/cecc5d9a44d2e4b7c63e5b6237e6284c874ebd0a;
          sha256 = "19v5pflrmz4drsryxi435vs00cqi28dw5rh33lnyxsbq7rbb89bc";
        };
      };
    };
    "zendframework/zend-serializer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-serializer-cfbaeff68a083ca473d44bcff99bc8b52b422ca9";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-serializer/zipball/cfbaeff68a083ca473d44bcff99bc8b52b422ca9;
          sha256 = "1brw7sz8xgwzyvjr2vg2z441i5bb668kah8v7km2zp3r21w3ipmy";
        };
      };
    };
    "zendframework/zend-servicemanager" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-servicemanager-ba7069c94c9af93122be9fa31cddd37f7707d5b4";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-servicemanager/zipball/ba7069c94c9af93122be9fa31cddd37f7707d5b4;
          sha256 = "09ygbiwx8pmf55fg4682m4k07r3hhvkqb7gg7j2cn743xpi3126r";
        };
      };
    };
    "zendframework/zend-stdlib" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-stdlib-0e44eb46788f65e09e077eb7f44d2659143bcc1f";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-stdlib/zipball/0e44eb46788f65e09e077eb7f44d2659143bcc1f;
          sha256 = "0i4cds0qql22fj2bipkcpv9pc30s63h10gr15kh8k6jxd04ln2fn";
        };
      };
    };
    "zetacomponents/base" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zetacomponents-base-489e20235989ddc97fdd793af31ac803972454f1";
        src = fetchurl {
          url = https://api.github.com/repos/zetacomponents/Base/zipball/489e20235989ddc97fdd793af31ac803972454f1;
          sha256 = "0fwzbz6a47l0lmfw52rvmbd1fds06vdwjpmvgkivgqmzp8r87zl5";
        };
      };
    };
    "zetacomponents/document" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zetacomponents-document-d444dd811659de20c112e13703ea4f48eb1c19ad";
        src = fetchurl {
          url = https://api.github.com/repos/zetacomponents/Document/zipball/d444dd811659de20c112e13703ea4f48eb1c19ad;
          sha256 = "0ii9mnfbfn00b11i38vm66by2c199n38jwx6r2m647750mcf573h";
        };
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