local options = {
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
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions = {
    whaler = {
      directories = {
        { path = "~/.config/", alias = "configs" },
        { path = "~/sandbox", alias = "sandbox" },
        { path = "~/sandbox/finance", alias = "finance" },
        "~/sandbox/network",
        { path = "/mnt/c/users/vagrant/projects/Sandbox/Graphics", alias = "windows" }
      },
      oneoff_directories = { "~/sandbox/playground",  { path = "~/sandbox/rustlings", alias = "Project Rust" } },
      auto_cwd = true,
      file_explorer = "nvimtree",
      theme = {                -- Telescope theme default Whaler options.
        results_title = false,
        layout_strategy = "center",
        previewer = true,
        layout_config = {
          height =  0.3,
          width = 0.5
        },
        sorting_strategy = "ascending",
        border = true
      }
    }
  },

  extensions_list = { "themes", "terms", "whaler" },
}

return options
