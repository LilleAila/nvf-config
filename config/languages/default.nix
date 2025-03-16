{ pkgs, lib, ... }:
{
  imports = [
    ./completion.nix
    ./lspconfig.nix
  ];

  # NOTE: idk why this had to be enabled, but nvim just crashed without
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
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      # Languages
      # nix = {
      #   enable = true;
      #   lsp.package = [
      #     "nixd"
      #   ];
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
      # ts = {
      #   enable = true;
      #   lsp.package = [
      #     "typescript-language-server"
      #     "--stdio"
      #   ];
      # };
      # python = {
      #   enable = true;
      #   lsp.package = [
      #     "pyright"
      #   ];
      # };
      # html.enable = true;
      # css = {
      #   enable = true;
      #   lsp.package = [
      #     "vscode-css-language-server"
      #     "--stdio"
      #   ];
      # };
      # tailwind = {
      #   enable = true;
      #   lsp.package = [
      #     "tailwindcss-language-server"
      #     "--stdio"
      #   ];
      # };
      # lua = {
      #   enable = true;
      #   lsp.package = [
      #     "lua-language-server"
      #   ];
      # };
      # haskell = {
      #   enable = true;
      #   lsp.package = [
      #     "haskell-language-server-wrapper"
      #     "--lsp"
      #   ];
      # };
      # svelte = {
      #   enable = true;
      #   lsp.package = [
      #     "svelteserver"
      #     "--stdio"
      #   ];
      # };
      # astro = {
      #   enable = true;
      #   lsp.package = [
      #     "astro-ls"
      #     "--stdio"
      #   ];
      # };
      # rust = {
      #   enable = true;
      #   lsp.package = [
      #     "rust-analyzer"
      #   ];
      # };
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
