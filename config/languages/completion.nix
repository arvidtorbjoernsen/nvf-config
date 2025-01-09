{ pkgs, ... }:
{
  vim = {
    lazy.plugins."blink.cmp" = {
      package = pkgs.vimPlugins.blink-cmp;
      setupModule = "blink.cmp";

      setupOpts = {
        keymap.preset = "default";
        sources.default = [
          "lsp"
          "path"
          # "snippets"
          "buffer"
        ];

        completion = {
          menu.auto_show = true;

          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
          };

          ghost_text.enabled = true;
        };
      };
    };
  };
}
