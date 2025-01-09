{ colorScheme, inputs, ... }:
{
  imports = [
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./languages
  ];

  _module.args = {
    util = import ./lib.nix;
    inherit colorScheme inputs;
  };

  vim = {
    viAlias = true;
    vimAlias = true;
  };
}
