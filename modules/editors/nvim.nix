{ config, options, lib, pkgs, ... }:

with lib;
{
  options.modules.editors.vim = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };


  programs.neovim = mkIf config.modules.editors.vim.enable {
    enable = true;
    env.VIMINIT = "let \\$MYVIMRC='\\$XDG_CONFIG_HOME/nvim/init.vim' | source \\$MYVIMRC";
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # Themes
      NeoSolarized

      # Linting
      ale

      # Search
      ctrlp-vim
      #vim-ripgrep

      # Tools
      coc-nvim
      nerdcommenter
      #nerdtree
      #supertab
      vim-buffergator
      vim-css-color
      vim-fugitive
      #vim-gitgutter
      #vim-localvimrc
      vim-multiple-cursors
      vim-surround
      vim-trailing-whitespace

      # Languages
      vim-stylish-haskell
      vim-polyglot
    ];
  };

  };
}
