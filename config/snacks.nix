{ pkgs, ... }:
{
  vim = {
    extraPackages = with pkgs; [
      imagemagick
      ghostscript
      texliveFull
      mermaid-cli
    ];

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        image = {
          enabled = false;
          force = true;
          doc = {
            conceal = false;
            inline = false;
            float = true;
          };
          math = {
            enabled = true;
          };
        };
      };
    };
  };
}
