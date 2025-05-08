{ util, ... }:
{
  vim = {
    # Plugin does not exist in nvf
    fzf-lua = {
      enable = true;
      profile = "default-title";
      setupOpts = {
        previewers.builtin.snacks_image.enabled = true;
      };
    };

    keymaps = [
      # Files
      (util.mkKeymap "n" "<leader>fF" ":FzfLua<cr>" "Picker picker")
      (util.mkKeymap "n" "<leader>ff" ":FzfLua files<cr>" "Files")
      (util.mkKeymap "n" "<leader>fo" ":FzfLua oldfiles<cr>" "File history")
      (util.mkKeymap "n" "<leader>fl" ":FzfLua blines<cr>" "Lines")
      (util.mkKeymap "n" "<leader>fs" ":FzfLua live_grep_glob<cr>" "Grep")
      (util.mkKeymap "n" "<leader>fS" ":FzfLua live_grep_resume<cr>" "Last grep")
      (util.mkKeymap "n" "<leader>fb" ":FzfLua lgrep_curbuf<cr>" "Grep buffer")
      # Git
      (util.mkKeymap "n" "<leader>gs" ":FzfLua git_status<cr>" "Status")
      (util.mkKeymap "n" "<leader>gc" ":FzfLua git_commits<cr>" "Commits")
      (util.mkKeymap "n" "<leader>gC" ":FzfLua git_bcommits<cr>" "Buffer commits")
      (util.mkKeymap "n" "<leader>gb" ":FzfLua git_blame<cr>" "Blame")
      (util.mkKeymap "n" "<leader>gB" ":FzfLua git_branches<cr>" "Branches")
      (util.mkKeymap "n" "<leader>gs" ":FzfLua git_stash<cr>" "Stash")
      # LSP: TODO
      # Other
      (util.mkKeymap "n" "<leader>fc" ":FzfLua command_history<cr>" "Command history")
      (util.mkKeymap "n" "<leader>fC" ":FzfLua commands<cr>" "Commands")
      (util.mkKeymap "n" "<leader>fh" ":FzfLua helptags<cr>" "Vim help")
      (util.mkKeymap "n" "<leader>fH" ":FzfLua manpages<cr>" "Man pages")
      (util.mkKeymap "n" "<leader>fr" ":FzfLua registers<cr>" "Registers")
      (util.mkKeymap "n" "<leader>fp" ":FzfLua complete_path<cr>" "Path")
    ];
  };
}
