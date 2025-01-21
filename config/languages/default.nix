{pkgs, ...}: {
  imports = [
    ./completion.nix
  ];

  vim = {
    languages = {
      # Options applied to all languages
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      # Languages
      nix = {
        enable = true;
        format = {
          type = "nixfmt";
          package = pkgs.nixfmt-rfc-style;
        };
      };
      markdown = {
        enable = true;
        lsp.enable = false;
        format.type = "prettierd";
        format.enable = false;
      };
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      java.enable = true;
      kotlin.enable = true;
      ts.enable = true;
      go.enable = true;
      lua.enable = true;
      zig.enable = true;
      python.enable = true;
      typst.enable = true;
      rust = {
        enable = true;
        crates.enable = true;
      };
      csharp.enable = true;
      dart.enable = true;
      ruby.enable = false;
      tailwind.enable = true;
      svelte.enable = true;
    };

    lsp = {
      formatOnSave = true;
      # lspkind.enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      lsplines.enable = true;
      nvim-docs-view.enable = true;
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
      context.enable = true;
    };
  };
}
