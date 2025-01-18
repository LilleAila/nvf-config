{
  vim = {
    theme = {
      enable = true;
      # Looks bad :(
      # name = "base16";
      # base16-colors = colorScheme.palette;
      name = "gruvbox";
      style = "dark";
    };

    statusline = {
      lualine = {
        enable = true;
      };
    };

    tabline.nvimBufferline = {
      enable = true;
      setupOpts = {
        options = {
          numbers = "none";
          tab_size = 14;
          pick.alphabet = "abcdefghijklmnopqrstuvwxyzæøåABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ";
        };
      };
      mappings = {
        pick = "<leader>b";
        cycleNext = "<tab>";
        cyclePrevious = "<S-tab>";
        moveNext = "<C-.>";
        movePrevious = "<C-,>";
        closeCurrent = "<C-c>";
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      indent-blankline.enable = true;
    };
  };
}
