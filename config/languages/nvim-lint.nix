{
  config,
  lib,
  ...
}:
let
  inherit (lib.options) mkOption mkEnableOption;
  inherit (lib.types) attrsOf listOf str;
  inherit (lib.modules) mkIf;
  inherit (lib.nvim.dag) entryAnywhere;
  inherit (lib.nvim.lua) toLuaObject;

  cfg = config.vim.diagnostics.nvim-lint;
in
{
  options.my.nvim-lint = {
    enable = mkEnableOption "asynchronous linter plugin for Neovim [nvim-lint]";
    linters_by_ft = mkOption {
      type = attrsOf (listOf str);
      default = { };
      example = {
        text = [ "vale" ];
        markdown = [ "vale" ];
      };

      description = ''
        Map of filetype to formatters. This option takes a set of
        `key = value` format where the `value` will be converted
        to its Lua equivalent. You are responsible for passing the
        correct Nix data types to generate a correct Lua value that
        conform is able to accept.
      '';
    };
  };

  config = mkIf cfg.enable {
    vim = {
      startPlugins = [ "nvim-lint" ];
      pluginRC.nvim-lint = entryAnywhere ''
        require("lint").linters_by_ft = ${toLuaObject cfg.linters_by_ft}
      '';

      autocmds = [
        {
          command = ''lua require("lint").try_lint()'';
          event = [ "BufWritePost" ];
        }
      ];
    };
  };
}
