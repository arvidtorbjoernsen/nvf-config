{
  pkgs,
  inputs,
  colorScheme,
}:
(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [ (import ./config { inherit inputs colorScheme; }) ];
}).neovim
