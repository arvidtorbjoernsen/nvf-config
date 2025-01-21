{
  imports = [
    ./dashboard.nix
    ./filetree.nix
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./languages
    ./notes
    ./snippets
    ./mini.nix
  ];

  _module.args.util = import ./util.nix;

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
  };
}
