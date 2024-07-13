-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
-- Automatically enable diagnostics when entering a buffer

local lsp = "pyright" -- Define your language server here

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        enabled = lsp == "pyright",
      },
      basedpyright = {
        enabled = lsp == "basedpyright",
      },
      [lsp] = {
        enabled = true,
      },
      -- Removed ruff_lsp and ruff configurations
    },
    setup = {
      -- Removed ruff setup
    },
  },
}
