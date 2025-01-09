{ pkgs, ... }:
{
  vim = {
    lazy.plugins."blink.cmp" = {
      package = pkgs.vimPlugins.blink-cmp;
      setupModule = "blink.cmp";

      setupOpts = {
        keymap =
          let
            fallback = a: [
              a
              "fallback"
            ];
          in
          {
            preset = "none";
            "<C-j>" = fallback "select_next";
            "<C-k>" = fallback "select_prev";
            "<CS-j>" = fallback "scroll_documentation_down";
            "<CS-k>" = fallback "scroll_documentation_up";
            "<C-space>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<C-e>" = [ "hide" ];
            "<C-y>" = [ "select_and_accept" ];
          };

        sources.default = [
          "lsp"
          "path"
          # "snippets"
          "buffer"
        ];

        # sources.cmdline = [ ];

        completion = {
          menu = {
            auto_show = true;
          };

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
