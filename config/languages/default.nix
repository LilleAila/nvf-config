{ pkgs, lib, ... }:
{
  imports = [
    ./completion.nix
    ./lspconfig.nix
  ];

  vim.startPlugins = [ "plenary-nvim" ];

  my.lspconfig = {
    enable = true;
    sources = {
      ts_ls = { };
      nixd = {
        settings.nixd = {
          diagnostic.suppress = [
            "sema-escaping-with"
            "var-bind-to-this"
          ];
        };
      };
      pyright = { };
      cssls = { };
      tailwindcss = { };
      lua_ls = { };
      hls = { };
      svelte = { };
      astro = { };
      rust_analyzer = { };
    };
  };

  vim = {
    languages = {
      # Options applied to all languages
      enableLSP = false;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      # Languages
      # nix = {
      #   enable = true;
      #   format = {
      #     type = "nixfmt";
      #     package = pkgs.nixfmt-rfc-style;
      #   };
      # };
      # markdown = {
      #   enable = true;
      #   lsp.enable = false;
      #   format.type = "prettierd";
      #   format.enable = false;
      # };
      # ts.enable = true;
      # python.enable = true;
      # html.enable = true;
      # css.enable = true;
      # tailwind.enable = true;
      # lua.enable = true;
      # haskell.enable = true;
      # svelte.enable = true;
      # astro.enable = true;
      # rust.enable = true;
    };

    lsp = {
      null-ls.enable = lib.mkForce false;
      formatOnSave = true;
      # lspkind.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    # startPlugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];

    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
      # Maybe just install every single one?
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        yaml # Affects obsidian note frontmatter
        latex
      ];
    };
  };
}
