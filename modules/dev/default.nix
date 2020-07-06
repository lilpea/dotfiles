# modules/dev --- common settings for dev modules

{ pkgs, ... }:
{
  imports = [
    ./cc.nix
    # ./clojure.nix
    ./common-lisp.nix
    ./godot.nix
    # ./haskell.nix
    ./latex.nix
    # ./lua.nix
    # ./node.nix
    ./python.nix
    ./rust.nix
    # ./scala.nix
    # ./unity3d.nix
    ./zsh.nix
  ];
  # FIXME my.packages = with pkgs; [ gnumake nixfmt shellcheck shfmt clisp sbcl gcc cmake clang llvm rtags ccls ];

  options = {};
  config = {};
}
