{ pkgs, ... }:

{
  options.modules.dev.haskell = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.modules.dev.haskell.enable {
    my = {
      packages = with pkgs; [
        (haskellPackages.ghcWithPackages (ps: with ps;
          [
            cabal-install
            stack
            hoogle
            ghcid
            hlint
          ] # ghc-mod
        ))
      ];
    };
  };
}
