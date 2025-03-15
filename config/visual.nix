{ lib, colorScheme', ... }:
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

    visuals = {
      nvim-web-devicons.enable = true;
      rainbow-delimiters.enable = true;
    };

    highlight = {
      SignColumn.bg = colorScheme'.base00;
    };

    ui.borders = {
      enable = true;
      globalStyle = "single";
    };
  };
}
