{ util, ... }:
{
  vim = {
    binds.whichKey = {
      enable = true;
      register = {
        "<leader>f" = " Picker";
        "<leader>g" = " Git";
        "<leader>d" = " Debug";
        "<leader>l" = " LSP";
        "<leader>c" = " Spellcheck";
        "<leader>cl" = "󰗊 Language";
        "<leader>o" = " Obsidian";
      };
      setupOpts = {
        preset = "classic";
        delay = 0;
        icons = {
          mappings = false;
          separator = "➜";
          group = "";
        };
        win.border = "none";
        triggers = [
          {
            "@" = "<leader>";
            mode = "n";
          }
        ];
      };
    };

    keymaps = [
      (util.mkKeymap' "v" "<" "<gv")
      (util.mkKeymap' "v" ">" ">gv")
      (util.mkKeymap' "n" "j" "gj")
      (util.mkKeymap' "n" "k" "gk")
      (util.mkKeymap' "n" "H" "_")
      (util.mkKeymap' "n" "L" "g_")
      (util.mkLuaKeymap "n" "<leader>fd" # lua
        ''
          function()
            local file = vim.fn.expand('%:p')
            local confirm = vim.fn.confirm("Delete file?\n" .. file, "&Yes\n&No", 2)
            if confirm == 1 then
              vim.fn.delete(file)
              vim.cmd('bdelete!')
              print("File deleted: " .. file)
            else
              print("Delete canceled")
            end
          end
        ''
        "Delete file"
      )
    ];
  };
}
