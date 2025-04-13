{ pkgs, lib, ... }:
{
  imports = [
    ./completion.nix

    # My own versions of some upstream modules
    ./lspconfig.nix
    ./nvim-lint.nix
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
      blueprint_ls = { };
      vala_ls = { };
    };
  };

  my.nvim-lint = {
    enable = true;
    linters_by_ft = {
      nix = [
        "statix"
        "deadnix"
      ];
      tex = [
        "chktex"
      ];
    };
  };

  vim = {
    lsp = {
      formatOnSave = true;
      # lspkind.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        format_after_save = {
          lsp_format = "never";
          async = true;
        };
        formatters.prettierd.command = lib.getExe pkgs.prettierd;
        formatters_by_ft =
          let
            mkFormatter =
              formatters:
              (lib.attrsets.listToAttrs (map (f: lib.attrsets.nameValuePair "@${f}" f) formatters))
              // {
                stop_after_first = true;
              };
          in
          {
            haskell = mkFormatter [
              "ormolu"
            ];
            html = mkFormatter [
              "prettierd"
              "prettier"
            ];
            css = mkFormatter [
              "prettierd"
              "prettier"
            ];
            javascript = mkFormatter [
              "prettierd"
              "prettier"
            ];
            javascriptreact = mkFormatter [
              "prettierd"
              "prettier"
            ];
            typescript = mkFormatter [
              "prettierd"
              "prettier"
            ];
            python = mkFormatter [
              "black"
            ];
            lua = mkFormatter [
              "stylua"
            ];
            nix = mkFormatter [
              "nixfmt"
              "alejandra"
            ];
            markdown = mkFormatter [
              "prettierd"
              "prettier"
            ];
            rust = mkFormatter [
              "rustfmt"
            ];
          };
      };
    };

    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
  };
}
