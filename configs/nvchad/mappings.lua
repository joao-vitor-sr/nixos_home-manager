---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["L"] = { "$", "go to the end of the line", opts = { nowait = true } },
    ["H"] = { "0", "gooes to the beginning of the line", opts = { nowait = true } },

    -- tmux navigation
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["P"] = { "\"_dP"}
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move line down", opts = { nowait = true } },
    ["K"] = { ":m '<-2<CR>gv=gv", "move line up", opts = { nowait = true } },
    ["P"] = { "\"_dP"}
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.undotree = {
  n = {
    ["<leader>u"] = {
      function()
        vim.cmd.UndotreeToggle()
      end,
      "Toggle Undotree",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.nabla = {
  n = {
    ["<leader>mp"] = {
      function()
        require("nabla").popup()
      end,
      "Open popup with nabla (to render math)",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    ["<leader>mv"] = {
      function()
        require("nabla").toggle_virt()
      end,
      "Toggle virtual text with nabla (to render math)",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

return M
