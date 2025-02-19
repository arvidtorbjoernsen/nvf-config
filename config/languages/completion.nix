{ pkgs, inputs', ... }:
{
  vim = {
    lazy.plugins = {
      "vimplugin-blink-emoji.nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "blink-emoji.nvim";
          src = inputs'.plugin-blink-emoji;
          dependencies = [ pkgs.vimPlugins.blink-cmp ];
        };
      };

      "vimplugin-blink-cmp-spell" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "blink-cmp-spell";
          src = inputs'.plugin-blink-cmp-spell;
          dependencies = [ pkgs.vimPlugins.blink-cmp ];
        };
      };

      "blink.cmp" = {
        package = pkgs.vimPlugins.blink-cmp;
        # event = [ "LspAttach" ];
        # ft = [ "markdown" ];
        event = [ "BufEnter" ];
        setupModule = "blink.cmp";

        setupOpts = {
          keymap.preset = "enter";

          snippets.preset = "luasnip";

          cmdline.sources = [ ];

          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
              "emoji"
            ];

            providers = {
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
              };

              spell = {
                name = "Spell";
                module = "blink-cmp-spell";
              };
            };
          };

          completion = {
            menu = {
              auto_show = true;
            };

            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
            };

            ghost_text.enabled = false;
          };
        };
      };
    };
  };
}
