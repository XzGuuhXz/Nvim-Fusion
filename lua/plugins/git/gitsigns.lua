return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = { follow_files = true },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, "󰊢 Next Git hunk")

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, "󰊢 Previous Git hunk")

        map("n", "<leader>hs", gs.stage_hunk, "󰐕 Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "󰦒 Reset hunk")
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "󰐕 Stage hunk")
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "󰦒 Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "󰐕 Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "󰦒 Undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer, "󰦒 Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk, "󰋖 Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "󰊢 Blame line")
        map("n", "<leader>tb", gs.toggle_current_line_blame, "󰊢 Toggle line blame")
        map("n", "<leader>hd", gs.diffthis, "󰦒 Diff this")
        map("n", "<leader>hD", function() gs.diffthis("~") end, "󰦒 Diff this ~")
        map("n", "<leader>td", gs.toggle_deleted, "󰍵 Toggle deleted")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "󰊢 Select hunk")
      end,
    },
  },
}
