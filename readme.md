<div align="center">

# LilleAila's Neovim Configuration

My personal configuration files for [neovim](https://neovim.io/), powered by [nvf](https://github.com/NotAShelf/nvf).

</div>

## Running

You can run the following command to test the configuration:

```bash
nix run github:LilleAila/nvf-config
```

## Snippets

My [LuaSnip](https://github.com/L3MON4D3/LuaSnip) snippets are also available from this flake. To use them in your nvf config, set the following options.

```nix
{ pkgs, inputs, ... }:
{
  vim.snippets.luasnip = {
    enable = true;
    setupOpts = {
        enable_autosnippets = true;
    };
    providers = [
      inputs.lilleaila-nvf.packages.${pkgs.stdenv.hostPlatform.system}.snippets
    ];
    loaders = # lua
      ''
        require("lilleaila-snippets").load_snippets()
      '';
  };
}
```

This package contains the following types of snippets:

- LaTeX math
- LaTeX math in markdown

The only dependency is [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), with the grammars of the supported languages installed.

Note that the snippets do not require nvf or nix, and can be used as long as the provided package (or `config/snippets`) are in neovim's path.
