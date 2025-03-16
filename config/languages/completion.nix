{ ... }:
{
  vim = {
    autocomplete.blink-cmp = {
      enable = true;

      sourcePlugins = {
        emoji.enable = true;
        # ripgrep.enable = true;
        spell.enable = true;
      };

      # For some reason nvf provides default options for all this
      mappings = {
        close = null;
        complete = null;
        confirm = null;
        next = null;
        previous = null;
        scrollDocsDown = null;
        scrollDocsUp = null;
      };

      setupOpts = {
        keymap =
          let
            fallback = a: [
              a
              "fallback"
            ];
          in
          {
            preset = "none";
            "<C-j>" = fallback "select_next";
            "<C-k>" = fallback "select_prev";
            "<CS-j>" = fallback "scroll_documentation_down";
            "<CS-k>" = fallback "scroll_documentation_up";
            "<C-space>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<C-e>" = [ "hide" ];
            "<C-y>" = [ "select_and_accept" ];
          };

        cmdline.sources = [ ];

        sources = {
          default = [
            "snippets"
            "lsp"
            "path"
            # "ripgrep"
            "buffer"
            "emoji"
          ];
        };

        snippets.preset = "luasnip";

        signature.enabled = true;

        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;
          };

          menu = {
            auto_show = true;
          };

          ghost_text.enabled = false;
        };
      };
    };
  };
}
