return {
  {
    -- 'abhi-xyz/age.nvim',
    dir = '/home/abhi/dev/github/age.nvim',
    -- build = "make all",
    -- cond = function() -- -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
    --  return vim.fn.executable 'make' == 1
    -- end,
    cmd = { "Age" },
    config = function()
      local secrets = require('key')
      require('age').setup({
        encrypt_and_del = true,
        public_key = secrets.public_key,
        private_key = secrets.private_key, -- defined in another lua file which is not includes in git for safty
      })
    end
  },
}
