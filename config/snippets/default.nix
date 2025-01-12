{ pkgs, outputs, ... }:
{
  vim = {
    snippets.luasnip = {
      enable = true;
      setupOpts = {
        update_events = "TextChanged,TextChangedI";
        store_selection_keys = "<Tab>";
        delete_check_events = "TextChanged";
        enable_autosnippets = true;
        history = false;
      };
      providers = [
        outputs.packages.${pkgs.system}.snippets
      ];
      loaders = # lua
        ''
          require("lilleaila-snippets").load_snippets()
        '';
    };

    lazy.plugins.luasnip.event = "BufEnter";
  };
}
