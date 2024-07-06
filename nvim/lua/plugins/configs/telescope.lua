return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Now requiring telescope inside the config function
      local telescope = require('telescope')

      telescope.setup{
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = " 🔍 ",
          selection_caret = "➤ ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.85,
            height = 0.75,
            preview_cutoff = 100,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules", ".git/" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 10,  -- Slight transparency
          border = {},
          borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            i = {
              ["<C-n>"] = "move_selection_next",
              ["<C-p>"] = "move_selection_previous",
              ["<C-c>"] = "close",
              ["<CR>"] = "select_default",
            },
            n = {
              ["q"] = "close",
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",  -- Use dropdown theme for find_files picker
            previewer = true,
            hidden = true,
          },
          live_grep = {
            theme = "ivy",  -- Use ivy theme for live_grep picker
            previewer = true,
          },
        },
        extensions = {
          -- Load Telescope extensions here if needed
        },
      }

      -- Load Telescope extensions if any
      -- telescope.load_extension('fzf')
    end,
  },
}

