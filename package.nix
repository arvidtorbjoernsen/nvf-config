{
  pkgs,
  nvf,
  colorScheme,
}:
(nvf.lib.neovimConfiguration {
  inherit pkgs;
  modules = [ (import ./config colorScheme) ];
}).neovim
