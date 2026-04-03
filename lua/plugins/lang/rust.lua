return {
  {
    'saecki/crates.nvim',
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
        },
      }
    end
  },
}
