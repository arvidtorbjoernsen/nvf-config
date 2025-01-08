{
  vim = {
    binds.whichKey = {
      enable = true;
      register = {
        "<leader>f" = "Pickers";
        "<leader>g" = "Git";
        "<leader>d" = "Debugger";
        "<leader>l" = "LSP";
      };
      setupOpts = {
        preset = "classic";
        delay = 0;
        icons.mappings = false;
        win.border = "none";
        triggers = [
          {
            "@" = "<leader>";
            mode = "n";
          }
        ];
      };
    };

  };
}
