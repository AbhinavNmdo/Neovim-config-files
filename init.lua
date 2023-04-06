for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify("Error setting up colorscheme: " .. astronvim.default_colorscheme, "error")
  end
end

local keyset = vim.keymap.set

-- Use Ctrl+p for global file search
keyset("n", "<C-p>", "<cmd>Telescope fd<CR>", {silent = true})
keyset("i", "<C-p>", "<cmd>Telescope fd<CR>", {silent = true})

-- Use Ctrl+s for file save
keyset("n", "<C-s>", "<cmd>w<CR>", {silent = true})
keyset("i", "<C-s>", "<cmd>w<CR><Esc>i", {silent = true})

-- Use Ctrl+k for Neotree
keyset("n", "<C-k>", "<cmd>Neotree toggle position=right<CR>", {silent = true})
keyset("i", "<C-k>", "<cmd>Neotree toggle position=right<CR><Esc>", {silent = true})

-- Move the line using alt and moving keys
keyset("n", "<A-j>", "<cmd>m +1<CR>", {silent = true})
keyset("n", "<A-k>", "<cmd>m -2<CR>", {silent = true})
keyset("n", "<A-s>", "<cmd>t.<CR>", {silent = true})

-- Remap the neotree to the right side
keyset("n", "<leader>e", "<cmd>Neotree toggle position=right<cr>", {silent = true})

-- Use Ctrl+backspace to delete a word
keyset("i", "<C-H>", "<C-W>", {silent = true, noremap = true})

-- Use Ctrl-z to undo
keyset("n", "<C-z>", "<cmd>undo<cr>", {silent = true})
keyset("i", "<C-z>", "<cmd>undo<cr><Esc>i", {silent = true})

-- Use Ctrl-y to redo
keyset("n", "<C-y>", "<cmd>redo<cr>", {silent = true})
keyset("i", "<C-y>", "<cmd>redo<cr><Esc>i", {silent = true})

-- Some easymotion keybindings
keyset("n", "<leader><leader>l", "<Plug>(easymotion-lineforward)", {silent = true})
keyset("n", "<leader><leader>h", "<Plug>(easymotion-linebackward)", {silent = true})

-- Use Ctrl-Enter to jump to the next line
keyset("i", "<S-Enter>", "<Esc>oa", {silent = true})




require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
