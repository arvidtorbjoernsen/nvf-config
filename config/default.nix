colorScheme:
{
  pkgs,
  util,
  lib,
  ...
}:
{
  imports = [
    ./options.nix
  ];

  _module.args.util = import ./lib.nix;

  vim = {
    viAlias = true;
    vimAlias = true;

    theme = {
      enable = true;
      # Looks bad :(
      # name = "base16";
      # base16-colors = colorScheme.palette;
      name = "gruvbox";
      style = "dark";
    };

    languages = {
      # Options applied to all languages
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      # Languages
      nix = {
        enable = true;
        format = {
          type = "nixfmt";
          package = pkgs.nixfmt-rfc-style;
        };
      };
      markdown.enable = true;
      ts.enable = true;
      python.enable = true;
      html.enable = true;
      css.enable = true;
      tailwind.enable = true;
      lua.enable = true;
      haskell.enable = true;
      svelte.enable = true;
      astro.enable = true;
      rust.enable = true;
    };

    lsp = {
      formatOnSave = true;
      # lspkind.enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
      # context = {
      #   enable = true;
      #   setupOpts = {
      #     max_lines = 2;
      #   };
      # };
    };

    autopairs.nvim-autopairs.enable = true;

    filetree.nvimTree.enable = true;

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

    # Plugin does not exist in nvf
    lazy.plugins."fzf-lua" = {
      package = pkgs.vimPlugins.fzf-lua;
      cmd = [ "FzfLua" ];

      keys = [
        # Files
        (util.mkKeymap "n" "<leader>fF" ":FzfLua<cr>" "Picker picker")
        (util.mkKeymap "n" "<leader>ff" ":FzfLua files<cr>" "Files")
        (util.mkKeymap "n" "<leader>fo" ":FzfLua oldfiles<cr>" "File history")
        (util.mkKeymap "n" "<leader>fl" ":FzfLua blines<cr>" "Lines")
        (util.mkKeymap "n" "<leader>fs" ":FzfLua live_grep_glob<cr>" "Grep")
        (util.mkKeymap "n" "<leader>fS" ":FzfLua live_grep_resume<cr>" "Last grep")
        (util.mkKeymap "n" "<leader>fb" ":FzfLua lgrep_curbuf<cr>" "Grep buffer")
        # Git
        (util.mkKeymap "n" "<leader>gs" ":FzfLua git_status<cr>" "Status")
        (util.mkKeymap "n" "<leader>gc" ":FzfLua git_commits<cr>" "Commits")
        (util.mkKeymap "n" "<leader>gC" ":FzfLua git_bcommits<cr>" "Buffer commits")
        (util.mkKeymap "n" "<leader>gb" ":FzfLua git_blame<cr>" "Blame")
        (util.mkKeymap "n" "<leader>gB" ":FzfLua git_branches<cr>" "Branches")
        (util.mkKeymap "n" "<leader>gs" ":FzfLua git_stash<cr>" "Stash")
        # LSP: TODO
        # Other
        (util.mkKeymap "n" "<leader>fc" ":FzfLua command_history<cr>" "Command history")
        (util.mkKeymap "n" "<leader>fC" ":FzfLua commands<cr>" "Commands")
        (util.mkKeymap "n" "<leader>fh" ":FzfLua helptags<cr>" "Vim help")
        (util.mkKeymap "n" "<leader>fH" ":FzfLua manpages<cr>" "Man pages")
        (util.mkKeymap "n" "<leader>fr" ":FzfLua registers<cr>" "Registers")
        (util.mkKeymap "n" "<leader>fp" ":FzfLua complete_path<cr>" "Path")
      ];
    };
  };
}
