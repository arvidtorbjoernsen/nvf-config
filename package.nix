{ pkgs, inputs }:
(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [ (import ./config) ];
}).neovim
