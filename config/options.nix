{
  vim = {
    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    options = {
      # 2-space indents
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      breakindent = true;

      # Searching
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      # Splitting
      splitbelow = true;
      splitright = true;

      # Undo
      undofile = true;
      undolevels = 10000;
      swapfile = false;
      backup = false;

      # Disable folding
      foldlevel = 99;
      foldlevelstart = 99;

      # Misc
      termguicolors = true;
      timeoutlen = 1000;
      scrolloff = 4;
      sidescrolloff = 4;
      cursorline = true;
      encoding = "utf-8";
      fileencoding = "utf-8";
      fillchars = "eob: "; # Disable the "~" chars at end of buffer
    };

    globals = {
      tex_flavor = "latex";
    };
  };
}
