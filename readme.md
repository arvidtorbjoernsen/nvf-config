<div align="center">

# LilleAila's Neovim Configuration

My personal configuration files for [neovim](https://neovim.io/), powered by [nvf](https://github.com/NotAShelf/nvf).

</div>

## Running

You can run the following command to test the configuration:

```bash
nix run github:LilleAila/nvf-config
```

## Snippets

My [LuaSnip](https://github.com/L3MON4D3/LuaSnip) snippets are also available from this flake. To use them in your nvf config, set the following options.

```nix
{ pkgs, inputs, ... }:
{
  vim.snippets.luasnip = {
    providers = [
      inputs.packages.${pkgs.system}.snippets
    ];
    loaders = # lua
      ''
        require("lilleaila-snippets").load_snippets()
      '';
  };
}
```

This package contains the following types of snippets:

- LaTeX math
- LaTeX math in markdown
