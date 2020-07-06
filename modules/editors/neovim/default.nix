let
  plugins = pkgs.vimPlugins // pkgs.callPackage ./custom-plugins.nix {};
in {
  programs.neovim = {

    configure = {
      customRC = builtins.readFile ./init.vim;

      plug.plugins = with plugins; [
        NeoSolarized
	vim-nix
      ];
    };
  };
}
