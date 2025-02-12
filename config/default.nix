{ pkgs, ... }:
{
  imports = [
    ./ui.nix
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./git.nix
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
    autopairs.nvim-autopairs.enable = true;

    startPlugins = [
      "friendly-snippets"
      "nvim-neoclip-lua"
      "cheatsheet-nvim"
      "dressing-nvim"

      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };
}
