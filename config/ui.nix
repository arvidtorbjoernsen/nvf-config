{
  vim = {
    ui = {
      borders.enable = true;
      noice.enable = false;
      colorizer.enable = true;
      modes-nvim.enable = true;
      illuminate.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = [
            "90"
            "130"
          ];
        };
      };
      fastaction.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = true;
      alpha.enable = true;
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };
    filetree = {
      neo-tree = {
        enable = true;
      };
    };
    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };
  };
}
