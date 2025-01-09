{
  pkgs,
  inputs,
  colorScheme,
}:
(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [ (import ./config) ];
  extraSpecialArgs = {
    util = import ./config/util.nix;
    # Inputs is seemingly reserver, though the docs don't show it
    inputs' = inputs;
    inherit colorScheme;
  };
}).neovim
