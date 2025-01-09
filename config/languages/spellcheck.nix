{ util, lib, ... }:
let
  spellDir = "$HOME/.spell";
  mkSpellFile =
    lang: "${spellDir}/spell/${lib.lists.head (lib.strings.splitString "_" lang)}.utf-8.add";
  mkSpell =
    langs:
    let
      langs' = lib.nvim.lua.listToLuaTable langs;
      spellfiles = map mkSpellFile langs;
      spellfiles' = lib.nvim.lua.listToLuaTable spellfiles;
    in
    ''
      function()
        vim.opt.spellang = ${langs'}
        vim.opt.spellfile = ${spellfiles'}
      end
    '';
in
{
  vim = {
    options = {
      spell = true;
      spl = "en_us";
      spf = mkSpellFile "en_us";
    };

    keymaps = [
      (util.mkLuaKeymap "n" "<leader>cle" (mkSpell [
        "en_us"
        "nb"
        "fr"
      ]) "Engelsk")
      (util.mkLuaKeymap "n" "<leader>cle" (mkSpell [
        "fr"
        "en_us"
        "nb"
      ]) "Fransk")
      (util.mkLuaKeymap "n" "<leader>clb" (mkSpell [
        "nb"
        "en_us"
        "fr"
      ]) "Norsk Bokmål")
      (util.mkLuaKeymap "n" "<leader>clb" (mkSpell [
        "nn"
        "en_us"
        "fr"
      ]) "Norsk Bokmål")
    ];
  };
}
