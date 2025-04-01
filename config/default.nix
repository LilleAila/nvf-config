{ colorScheme, lib, ... }:
{
  imports = [
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./languages
    ./notes
    ./snippets
    ./mini.nix
    ./snacks.nix
  ];

  _module.args.colorScheme' = lib.attrsets.mapAttrs (_: value: "#${value}") colorScheme.palette;
  _module.args.util = import ./util.nix;

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
  };
}
