return {
  {
    -- 'abhi-xyz/just.nvim',
    dir = '/home/abhi/dev/github/md-roam-nvim',
    -- build = "make all",
    -- cond = function() -- -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
    --  return vim.fn.executable 'make' == 1
    -- end,
    cmd = { "MdRoam", "M" },
    config = function()
      local secrets = require('key')
      require('mdroam').setup({
        public_key = secrets.public_key,
        private_key = secrets.private_key, -- defined in another lua file which is not includes in git for safty
      })
    end
  },
}
