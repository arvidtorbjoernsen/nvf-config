{ pkgs, ... }:
{
  imports = [
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./languages
  ];

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
  };
}
