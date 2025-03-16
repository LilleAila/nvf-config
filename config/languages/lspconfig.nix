# Languages module in nvf is just not very good.
# Might get better once https://github.com/NotAShelf/nvf/pull/382 is complete
# The main problem with the current languages is that `cmd` is hard-coded
# example: https://github.com/NotAShelf/nvf/blob/2d5ff939b0a55f0a143927fb52f3ff386077c22b/modules/plugins/languages/clang.nix#L32
# This solution gives more control anyways

{ config, lib, ... }:
let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.strings) optionalString;
  inherit (lib.attrsets) mapAttrs;
  inherit (lib.types) attrs;
  inherit (lib.generators) mkLuaInline;
  inherit (lib.nvim.lua) toLuaObject;
  inherit (lib.nvim.dag) entryAfter;

  cfg = config.my.lspconfig;
in
{
  options.my.lspconfig = {
    enable = mkEnableOption "nvim-lspconfig";

    sources = mkOption {
      description = "nvim-lspconfig sources";
      type = attrs;
      default = { };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      vim = {
        lsp.enable = true;
        lsp.lspconfig.enable = lib.mkForce false; # This module does the same, but better.
        startPlugins = [ "nvim-lspconfig" ];

        pluginRC.lspconfig = entryAfter [ "lsp-setup" ] ''
          local lspconfig = require('lspconfig')

          ${optionalString config.vim.ui.borders.enable ''
            require('lspconfig.ui.windows').default_options.border = ${toLuaObject config.vim.ui.borders.globalStyle}
          ''}
        '';
      };
    }

    {
      vim.pluginRC = mapAttrs (
        name: v:
        (
          let
            config = {
              inherit name;
              capabilities = mkLuaInline "capabilities";
              on_attach = mkLuaInline "default_on_attach";
            } // v;
          in
          entryAfter [ "lspconfig" ] ''
            lspconfig.${name}.setup(${toLuaObject config})
          ''
        )
      ) cfg.sources;
    }
  ]);
}
