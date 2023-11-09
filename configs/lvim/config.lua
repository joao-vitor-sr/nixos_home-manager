lvim.plugins = {
  {
    "mrjones2014/nvim-ts-rainbow"
  },
	{
		"lervag/vimtex",
		ft = { "tex", "bib" },
		config = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_indent_enabled = 1
			vim.g.vimtex_synctex = 1
			vim.g.vimtex_fold_enabled = 0
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{ "Mofiqul/dracula.nvim" },
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		config = function()
			require("luasnip-latex-snippets").setup()
			require("luasnip").config.setup({ enable_autosnippets = true })
		end,
	},
	{
		"mbbill/undotree",
		lazy = false,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
				require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
			end, 100)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
{
   "ThePrimeagen/harpoon"
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
}

-- enable relative line numbers
vim.opt.relativenumber = true

lvim.colorscheme = "dracula"

lvim.keys.normal_mode["<C-h>"] = "<cmd> TmuxNavigateLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = "<cmd> TmuxNavigateDown<CR>"
lvim.keys.normal_mode["<C-k>"] = "<cmd> TmuxNavigateUp<CR>"
lvim.keys.normal_mode["<C-l>"] = "<cmd> TmuxNavigateRight<CR>"
lvim.keys.normal_mode["<leader>u"] = function()
	vim.cmd.UndotreeToggle()
end

lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["H"] = "0"

lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"

lvim.keys.normal_mode["<leader>p"] = [["_dP]];
lvim.keys.visual_mode["<leader>p"] = [["_dP]];
lvim.builtin.treesitter.rainbow.enable = true

-- harpoon
lvim.builtin.which_key.mappings["m"] = {
  name = "Harpoon",
  h = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "󰃅 Add Mark" },
  [';'] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "  Harpoon" },
  [','] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Nav prev" },
  ['.'] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Nav next" },
}

lvim.builtin.bufferline.active = false
