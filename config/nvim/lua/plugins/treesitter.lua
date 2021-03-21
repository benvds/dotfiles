require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "comment",
    "ruby",
    "lua",
    "php",
    "java",
    "c",
    "html",
    "svelte",
    "json",
    "jsonc",
    "css",
    "query",
    "erlang",
    "javascript",
    "jsdoc",
    "regex",
    "ql",
    "kotlin",
    "toml",
    "elm",
    "rst",
    "swift",
    "cpp",
    "c_sharp",
    "dart",
    "yaml",
    "vue",
    "typescript",
    "rust",
    "tsx",
    "bash",
    "python",
    "go",
    "jsonc",
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>gnn",
      node_incremental = "<leader>gnr",
      scope_incremental = "<leader>gne",
      node_decremental = "<leader>gnt",
    },
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true
  },
}
