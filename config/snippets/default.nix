{ pkgs, ... }:
{
  vim.snippets.luasnip = {
    enable = true;
    setupOpts = {
      update_events = "TextChanged,TextChangedI";
      store_selection_keys = "<Tab>";
      delete_check_events = "TextChanged";
      enable_autosnippets = true;
      history = false;
    };
    providers = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "my-snippets";
        src = ./.;
        dependencies = with pkgs.vimPlugins; [
          luasnip
        ];
      })
    ];
    loaders = # lua
      ''
        require("my-snippets").load_snippets()
      '';
  };
}