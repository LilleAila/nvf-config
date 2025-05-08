{ pkgs, ... }:
{
  vim = {
    extraPackages = with pkgs; [
      imagemagick
      ghostscript
      mermaid-cli
    ];

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        image = {
          enabled = true;
          doc = {
            enabled = true;
            inline = true;
            float = false;
          };
        };
      };
    };
  };
}
