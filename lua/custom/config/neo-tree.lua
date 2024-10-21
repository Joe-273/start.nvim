-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰌵 ", texthl = "DiagnosticSignHint" })

require('neo-tree').setup({
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = false,
  sources = { 'filesystem' },
  source_selector = {
    statusline = false,
  },
  window = {
    position = "left",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["h"] = "close_node",
      ["l"] = "open",
      ['<Space>'] = false,
    },
  },
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added = '✚',
        modified = '',
        deleted = '✖',
        renamed = 'R', -- this can only be used in the git_status source
        untracked = '?',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
  },
})
