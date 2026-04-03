return {
  dir = "/home/abhi/Downloads/gh",   -- local
  -- OR "yourusername/ghostword.nvim" once pushed
  event = "InsertEnter",
  config = function()
    require("ghostword").setup({
      debounce_ms = 80,       -- lower = snappier
      min_prefix  = 2,
      hl_group    = "GhostwordHint",
      filetypes   = nil,      -- nil = all; or {"markdown","text","tex"}
    })
  end,
}
