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

keyset("n", "<A-l>", "]b", {silent = true, noremap = false})
keyset("n", "<A-h>", "[b", {silent = true})
keyset("n", "<C-p>", "<cmd>Telescope fd<CR>", {silent = true})
keyset("i", "<C-p>", "<cmd>Telescope fd<CR>", {silent = true})

keyset("n", "<C-s>", "<cmd>w<CR>", {silent = true})
keyset("i", "<C-s>", "<cmd>w<CR><Esc>i", {silent = true})

keyset("n", "<C-k>", "<cmd>Neotree<CR>", {silent = true})
keyset("i", "<C-k>", "<cmd>Neotree<CR><Esc>", {silent = true})

keyset("n", "<A-j>", "<cmd>m +1<CR>", {silent = true})
keyset("n", "<A-k>", "<cmd>m -2<CR>", {silent = true})
keyset("n", "<A-s>", "<cmd>t.<CR>", {silent = true})

keyset("n", "<C-q>", "<leader-c>", {silent = true})
keyset("i", "<S><CR>", "<Esc>o", {silent = true})

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
