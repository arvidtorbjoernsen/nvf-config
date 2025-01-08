{ colorScheme, ... }:
{
  vim = {
    theme = {
      enable = true;
      # Looks bad :(
      # name = "base16";
      # base16-colors = colorScheme.palette;
      name = "gruvbox";
      style = "dark";
    };

    statusline = {
      lualine = {
        enable = true;
      };
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    visuals = {
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    ui = {
      noice.enable = true;
      modes-nvim.enable = true;
    };

  };
}
