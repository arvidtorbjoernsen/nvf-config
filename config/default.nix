colorScheme: {
  imports = [
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./languages
  ];

  _module.args.util = import ./lib.nix;
  _module.args.colorScheme = colorScheme;

  vim = {
    viAlias = true;
    vimAlias = true;
  };
}
