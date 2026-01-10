{ pkgs, lib, ... }:
{
  imports = [
    ./completion.nix
  ];

  vim.startPlugins = [
    "plenary-nvim" # NOTE: idk why this had to be enabled, but nvim just crashed without
    pkgs.vimPlugins.plantuml-syntax
  ];

  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      otter-nvim.enable = true;

      servers = {
        "*" = {
          root_markers = [ ".git" ];
        };

        nixd = {
          settings.nixd = {
            diagnostic.suppress = [
              "sema-escaping-with"
              "var-bind-to-this"
            ];
          };
        };
        ts_ls = { };
        pyright = {
          cmd = [
            "pyright-langserver"
            "--stdio"
          ];
          filetypes = [ "python" ];
          root_markers = [
            "pyproject.toml"
            "setup.py"
            ".git"
          ];
        };
        cssls = { };
        tailwindcss = { };
        lua_ls = { };
        hls = { };
        svelte = { };
        astro = { };
        rust_analyzer = { };
        blueprint_ls = { };
        vala_ls = { };
        tinymist = { };
        html = { };
        emmet_ls = { };
      };
    };

    diagnostics.nvim-lint = {
      enable = true;
      linters_by_ft = {
        nix = [ "statix" ];
        tex = [ "chktex" ];
        python = [ "ruff" ];
      };
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
            prettier = mkFormatter [
              "prettierd"
              "prettier"
            ];
          in
          {
            haskell = mkFormatter [
              "ormolu"
            ];
            html = prettier;
            css = prettier;
            javascript = prettier;
            javascriptreact = prettier;
            typescript = prettier;
            markdown = prettier;
            python = mkFormatter [ "ruff" ];
            lua = mkFormatter [ "stylua" ];
            nix = mkFormatter [
              "nixfmt"
              "alejandra"
            ];
            rust = mkFormatter [ "rustfmt" ];
            typst = mkFormatter [ "typstyle" ];
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
