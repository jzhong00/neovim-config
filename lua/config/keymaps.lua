-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
-- Automatically enable diagnostics when entering a buffer
vim.cmd([[
  autocmd BufEnter * lua enable_diagnostics()  -- Enable diagnostics on buffer enter
]])

-- Variable to track warning visibility
vim.g.show_warnings = true

-- Function to enable diagnostics display
function _G.enable_diagnostics()
  vim.diagnostic.enable()
  -- Set diagnostic display options to always show errors
  vim.diagnostic.config({
    virtual_text = {
      severity = { min = vim.diagnostic.severity.ERROR },
    },
    signs = {
      severity = { min = vim.diagnostic.severity.ERROR },
    },
    underline = {
      severity = { min = vim.diagnostic.severity.ERROR },
    },
  })

  -- If warnings are enabled, include them
  if vim.g.show_warnings then
    vim.diagnostic.config({
      virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
      },
      signs = {
        severity = { min = vim.diagnostic.severity.WARN },
      },
      underline = {
        severity = { min = vim.diagnostic.severity.WARN },
      },
    })
  end
end

-- Function to toggle warnings display
function _G.toggle_warnings()
  vim.g.show_warnings = not vim.g.show_warnings
  enable_diagnostics() -- Re-enable diagnostics to apply changes
end

-- Function to disable diagnostics display
function _G.disable_diagnostics()
  vim.diagnostic.enable(false)
end

-- Key mapping to toggle warnings display
vim.api.nvim_set_keymap("n", "<leader>tw", ":lua toggle_warnings()<CR>", { noremap = true, silent = true })
-- Key mapping to disable diagnostics display
vim.api.nvim_set_keymap("n", "<leader>tf", ":lua disable_diagnostics()<CR>", { noremap = true, silent = true })
