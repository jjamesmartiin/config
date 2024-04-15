vim.api.nvim_set_keymap('n', '<S-CR>', '<cmd>lua require("telescope.builtin").find_files({find_command = {"rg", "--files", "--hidden", "--follow"}})<CR><cmd>tabnew<CR>', {noremap = true})

-- oil setup
require("oil").setup({
	cleanup_delay_ms = 1000,
	view_options = {
	  show_hidden = true
	}
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- glow setup: https://github.com/ellisonleao/glow.nvim?tab=readme-ov-file#setup
require('glow').setup({
  width = 80,
  height = 100,
  width_ratio = 1, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 1,
})

-- telescope config
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      mirror = true,
      prompt_position = 'bottom',
      preview_height = 0.65,
      width = 0.95,
      height = 0.95,
    }
  }
})

-- require("ccryptor").setup({
--     dir_path = '~/gitprojects/personal_notes/secrets',
-- })
