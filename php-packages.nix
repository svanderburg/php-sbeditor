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
    "composer/ca-bundle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-ca-bundle-47fe531de31fca4a1b997f87308e7d7804348f7e";
        src = fetchurl {
          url = https://api.github.com/repos/composer/ca-bundle/zipball/47fe531de31fca4a1b997f87308e7d7804348f7e;
          sha256 = "0cvmfh4d5v4ws5sc1c9g57wvq5zfxj9biljq586kcl4j43c6pyis";
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
        name = "doctrine-annotations-f9deab6d08fd03f2508f8c771f1a447287f327d8";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/annotations/zipball/f9deab6d08fd03f2508f8c771f1a447287f327d8;
          sha256 = "1y647xchdhiasf0zrfsi91w00qcjwk2zw8fb6fpfjp7shzx2blc2";
        };
      };
    };
    "doctrine/instantiator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-instantiator-6a1471ddbf2f448b35f3a8e390c903435e6dd5de";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/instantiator/zipball/6a1471ddbf2f448b35f3a8e390c903435e6dd5de;
          sha256 = "0swfwjw49clciz0jv0vsb0k4xizvr3v1dpwm0fhz4vsz4mk82j9m";
        };
      };
    };
    "doctrine/lexer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-lexer-ec953a1b157db060fc9576a6f6b6b1865a09aac9";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/lexer/zipball/ec953a1b157db060fc9576a6f6b6b1865a09aac9;
          sha256 = "1z0nfyg3daq0f5m16wrbij8bb8dd6zrm773rmqyhm3ir9pccjb3y";
        };
      };
    };
    "erusev/parsedown" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "erusev-parsedown-fe7a50eceb4a3c867cc9fa9c0aa906b1067d1955";
        src = fetchurl {
          url = https://api.github.com/repos/erusev/parsedown/zipball/fe7a50eceb4a3c867cc9fa9c0aa906b1067d1955;
          sha256 = "0n6f31kps1jsslcms3p5liqfhf4fy901in3vvhddbfmjmjplybrx";
        };
      };
    };
    "jms/metadata" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "jms-metadata-e5854ab1aa643623dc64adde718a8eec32b957a8";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/metadata/zipball/e5854ab1aa643623dc64adde718a8eec32b957a8;
          sha256 = "0rzdbhy2bpzm4d8ai1d9ybv26ri6n5y1x9wdrr0r40hh4ngypffy";
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
        name = "jms-serializer-4fad8bbbe76e05de3b79ffa3db027058ed3813ff";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/serializer/zipball/4fad8bbbe76e05de3b79ffa3db027058ed3813ff;
          sha256 = "1mcxqdqjg021rsii90fkmii2brk9ahn4yrlbnyr9839nlv9w5cgb";
        };
      };
    };
    "monolog/monolog" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "monolog-monolog-5c670ec3d2cebcc3c20f014f5b8fe2087e434a60";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/monolog/zipball/5c670ec3d2cebcc3c20f014f5b8fe2087e434a60;
          sha256 = "1sx7ynijzaphx2p91gy7kxnv7p2y87g4s9gpnlg6j8kbkzqs2a74";
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
    "padraic/humbug_get_contents" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "padraic-humbug_get_contents-dcb086060c9dd6b2f51d8f7a895500307110b7a7";
        src = fetchurl {
          url = https://api.github.com/repos/humbug/file_get_contents/zipball/dcb086060c9dd6b2f51d8f7a895500307110b7a7;
          sha256 = "1pw0dwhd3h7jdjx9llliphym1x30lfc2h93577p3ax1dqphhkh8y";
        };
      };
    };
    "padraic/phar-updater" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "padraic-phar-updater-e5a5da3dc3344031271157c7f10b0fa04afffa9b";
        src = fetchurl {
          url = https://api.github.com/repos/humbug/phar-updater/zipball/e5a5da3dc3344031271157c7f10b0fa04afffa9b;
          sha256 = "0x2a94wmx9y1kmixmdv50zdx6ksd8d44p0pcwmmj2mj02rs5walk";
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
        name = "phpdocumentor-phpdocumentor-e8f668eddd20f8fa9710f3dbd8e3f7989d2be5e1";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/phpDocumentor/zipball/e8f668eddd20f8fa9710f3dbd8e3f7989d2be5e1;
          sha256 = "1msz62wz7rr58q9injyxd31jq2h02rv9kgnkl8r5i5iz9qa59m0x";
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
        name = "phpoption-phpoption-4acfd6a4b33a509d8c88f50e5222f734b6aeebae";
        src = fetchurl {
          url = https://api.github.com/repos/schmittjoh/php-option/zipball/4acfd6a4b33a509d8c88f50e5222f734b6aeebae;
          sha256 = "0wb6zmnj6kh78gvmscmy0y7w3vcmc730gdyg5y6zwgqqz5976f10";
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
        name = "psr-cache-b9aa2cd4dd36cec02779bee07ee9dab8bd2d07d7";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/cache/zipball/b9aa2cd4dd36cec02779bee07ee9dab8bd2d07d7;
          sha256 = "12df603k18np90k1v9r3gwxnypcsk1n8yk09pam4kkw2jmwczakf";
        };
      };
    };
    "psr/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-container-fc1bc363ecf887921e3897c7b1dad3587ae154eb";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/container/zipball/fc1bc363ecf887921e3897c7b1dad3587ae154eb;
          sha256 = "0fb4pmsnhhhsj1b659fin4hrrnvv2nl7jml44i0089bwwlv3lv4a";
        };
      };
    };
    "psr/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-log-0f73288fd15629204f9d42b7055f72dacbe811fc";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/log/zipball/0f73288fd15629204f9d42b7055f72dacbe811fc;
          sha256 = "1npi9ggl4qll4sdxz1xgp8779ia73gwlpjxbb1f1cpl1wn4s42r4";
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
    "svanderburg/php-sbdata" = {
      targetDir = "";
      src = fetchgit {
        name = "svanderburg-php-sbdata-6452dfc654e8a58c867ffe59cd06d734b6ea9286";
        url = "https://github.com/svanderburg/php-sbdata.git";
        rev = "6452dfc654e8a58c867ffe59cd06d734b6ea9286";
        sha256 = "0cp1l56n1lpp3hg5iy7dxbz63mnjspwycmyipfpkn3ipj5wgdj3l";
      };
    };
    "symfony/config" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-config-7dd5f5040dc04c118d057fb5886563963eb70011";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/config/zipball/7dd5f5040dc04c118d057fb5886563963eb70011;
          sha256 = "09cmr151xyl76il2vdgy92vpmhxg5wpmi8jbxxvxlphh6bqk6l3h";
        };
      };
    };
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-cbcf4b5e233af15cd2bbd50dee1ccc9b7927dc12";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/console/zipball/cbcf4b5e233af15cd2bbd50dee1ccc9b7927dc12;
          sha256 = "1bcjfhpccs4r5988rqmfdi1xx0pcvc9yh5hba11ba46sql1hwxr3";
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
        name = "symfony-event-dispatcher-a77e974a5fecb4398833b0709210e3d5e334ffb0";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/event-dispatcher/zipball/a77e974a5fecb4398833b0709210e3d5e334ffb0;
          sha256 = "1v0hv5ghbrjl3hhvrfhhks1adwms05ybm4yvffwyqqcm77yvv8cg";
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
        name = "symfony-finder-1444eac52273e345d9b95129bf914639305a9ba4";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/finder/zipball/1444eac52273e345d9b95129bf914639305a9ba4;
          sha256 = "0vnc79kvnk6n5jcd3kfp5sfgm0q4ghh3wv33nnjpkavl894zlv7f";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-4719fa9c18b0464d399f1a63bf624b42b6fa8d14";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-ctype/zipball/4719fa9c18b0464d399f1a63bf624b42b6fa8d14;
          sha256 = "16argd4p6fi28l4dwgmrlp8cwczx8qay14dbicjj9zxnrqb41cqb";
        };
      };
    };
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-81ffd3a9c6d707be22e3012b827de1c9775fc5ac";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-mbstring/zipball/81ffd3a9c6d707be22e3012b827de1c9775fc5ac;
          sha256 = "196ql3qk157nqy1sq5xxcac5fliws3bc67zi5scxa471y3jy497j";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-c3591a09c78639822b0b290d44edb69bf9f05dc8";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/process/zipball/c3591a09c78639822b0b290d44edb69bf9f05dc8;
          sha256 = "1xm7v9zzy9ccrq2c87asqzzcp2vrjgi659hxssj3x5qxahpgp0c7";
        };
      };
    };
    "symfony/stopwatch" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-stopwatch-752586c80af8a85aeb74d1ae8202411c68836663";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/stopwatch/zipball/752586c80af8a85aeb74d1ae8202411c68836663;
          sha256 = "1gsrf5388a6vzmdsxlnb4v5a0i01cz4s0da38h9nv7nmwr2f8hdw";
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
        name = "symfony-validator-d5d2090bba3139d8ddb79959fbf516e87238fe3a";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/validator/zipball/d5d2090bba3139d8ddb79959fbf516e87238fe3a;
          sha256 = "16y25dj2ag825s0xhx89ajk5di0w4i804p7nw1n10ji6mbswx42w";
        };
      };
    };
    "twig/twig" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "twig-twig-a940d7890924ceabfbe1f1e5e10a89258fe7875a";
        src = fetchurl {
          url = https://api.github.com/repos/twigphp/Twig/zipball/a940d7890924ceabfbe1f1e5e10a89258fe7875a;
          sha256 = "1d5pvs8avppk8k34nd1b35w1glqwvxxk6117r8lg8q384m8r8ifi";
        };
      };
    };
    "webmozart/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-assert-aed98a490f9a8f78468232db345ab9cf606cf598";
        src = fetchurl {
          url = https://api.github.com/repos/webmozart/assert/zipball/aed98a490f9a8f78468232db345ab9cf606cf598;
          sha256 = "00w4s4z7vlsyvx3ii7374vgq705a3yi4maw3haa05906srn3d1ik";
        };
      };
    };
    "zendframework/zend-cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-cache-edde41f1ee5c28e01701a032f434d03751b65df4";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-cache/zipball/edde41f1ee5c28e01701a032f434d03751b65df4;
          sha256 = "0c01n0y4w2znx5rpwgiy4rnf0bsrmp45r17hh0gg15rjbzmqkmzk";
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
        name = "zendframework-zend-eventmanager-3ad808d60d0df54e16440a71fb9c8a33988e4d78";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-eventmanager/zipball/3ad808d60d0df54e16440a71fb9c8a33988e4d78;
          sha256 = "1myyhkahc5f3cpzn3ljxf2zdbrs311jp2fck32f7jbjksx0wnkhi";
        };
      };
    };
    "zendframework/zend-filter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-filter-1a372040067e177fdec4612e375e526b663681e3";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-filter/zipball/1a372040067e177fdec4612e375e526b663681e3;
          sha256 = "0mdq2i05d8whraiyx04yp3n7ffjmxgx4r04v2i4yx94kn4as4gp6";
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
        name = "zendframework-zend-i18n-11675c83593219949b79cb5c4671d604b2541025";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-i18n/zipball/11675c83593219949b79cb5c4671d604b2541025;
          sha256 = "1z2b6av1fd3byxvz0706gi8k0662b37bm582k0c9q9dmb87rd1mz";
        };
      };
    };
    "zendframework/zend-json" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-json-b7b53ac36056cedfff020fe89139d264c20993b0";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-json/zipball/b7b53ac36056cedfff020fe89139d264c20993b0;
          sha256 = "1aki4g9scgr9z7rs6nyrj58y3y39mn4nwqbwc9badj0jxg1n63kp";
        };
      };
    };
    "zendframework/zend-serializer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-serializer-2ee41a1463ca5817775a8c89b246390b12ab0321";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-serializer/zipball/2ee41a1463ca5817775a8c89b246390b12ab0321;
          sha256 = "0rmqzd0dnlr8fabwyq8lbp8j6cp7ggm8df18qa8mz774s9nchmh0";
        };
      };
    };
    "zendframework/zend-servicemanager" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "zendframework-zend-servicemanager-99ec9ed5d0f15aed9876433c74c2709eb933d4c7";
        src = fetchurl {
          url = https://api.github.com/repos/zendframework/zend-servicemanager/zipball/99ec9ed5d0f15aed9876433c74c2709eb933d4c7;
          sha256 = "0s5d5yh9d8s0grrwpc8rw5cp5ww7x9f1n09d9w3qch6py1l2prz4";
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
        name = "zetacomponents-document-b7e76532ce40e706193239330c633976d5cb580b";
        src = fetchurl {
          url = https://api.github.com/repos/zetacomponents/Document/zipball/b7e76532ce40e706193239330c633976d5cb580b;
          sha256 = "1arhq36qs775nxdyq64i9haq7a1hswk2zf7sr2pd4yksbxdqdbg0";
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