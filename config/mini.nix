{
  util,
  lib,
  ...
}: {
  vim = {
    mini = {
      icons.enable = true;
      statusline.enable = true;
      tabline.enable = true;
      git.enable = true;
      diff.enable = true;
      align.enable = true;
      notify.enable = true;
      files.enable = true;
      indentscope = {
        enable = true;
        setupOpts.draw.animation = lib.generators.mkLuaInline ''require("mini.indentscope").gen_animation.none()'';
      };
      operators.enable = true;
      starter.enable = true;
      trailspace.enable = true;
      jump2d = {
        enable = true;
        setupOpts = {
          labels = "abcdefghijklmnopqrstuvwxyzæøåABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ";
          mappings.start_jumping = "<cr>";
          view.dim = true;
          silent = true;
        };
      };
      hipatterns = {
        enable = true;
        setupOpts.highlighters = let
          mkPattern = pattern: "%f[%w]()${pattern}()%f[%W]";
          mkHi = pattern: group: {
            inherit group;
            pattern = mkPattern pattern;
          };
        in {
          todo = mkHi "TODO" "MiniHipatternsTodo";
          hack = mkHi "HACK" "MiniHipatternsHack";
          note = mkHi "NOTE" "MiniHipatternsNote";
          fixme = mkHi "FIXME" "MiniHipatternsFixme";
        };
      };
      comment.enable = true;
      move.enable = true;
      pairs.enable = true;
      splitjoin.enable = true;
      bracketed.enable = true;
    };

    keymaps = [
      (util.mkKeymap' "n" "<tab>" ":bn<cr>")
      (util.mkKeymap' "n" "<S-tab>" ":bp<cr>")
      (util.mkKeymap' "n" "<C-c>" ":bd<cr>")
      (util.mkKeymap "n" "<leader>fm" ":lua MiniFiles.open()<cr>" "Open mini.files")
    ];
  };
}
