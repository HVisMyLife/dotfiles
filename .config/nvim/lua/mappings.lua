require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>cc", "<cmd>VimtexCompile<CR>")
map("n", "<leader>cv", "<cmd>VimtexView<CR>")
map("n", "<leader>cq", "<cmd>VimtexStop<CR>")

map("n", "<leader>dl", function ()
  require('tabufline').enabled = false
end, {})

map("n", "<RightMouse>", function()
  require('menu.utils').delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {} )

-- nnoremap <leader>p :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`

-- map("n", "<leader>l", require("nabla").popup, { noremap=true })

-- map("n", "<leader>l", function()
--   require("nabla").popup {}--{ noremap=true }
-- end, { desc = "nabla" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
