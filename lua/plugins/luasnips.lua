return {
  -- {
  --   dir = "/home/abhi/dev/github/typst-snippets",
  --   config = function()
  --     require("snippets").setup()
  --   end
  -- },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      ls.setup({
        history = true,
        updateevents = "TextChanged,TextChangedI", -- Automatically update snippets on change
      })
      --
      --
      -- set keybinds for both INSERT and VISUAL.
      -- vim.api.nvim_set_keymap("i", "<l>", "<Plug>luasnip-next-choice", {})
      -- vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
      -- vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
      -- vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
      --
      --

      vim.keymap.set({ "i", "s" }, "<A-n>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)

      vim.keymap.set({ "i", "s" }, "<A-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<A-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    end
  }
}
