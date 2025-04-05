return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local snippets_path = vim.fn.stdpath("config") .. "/snippets"
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { snippets_path } })

      local ls = require("luasnip")
      ls.setup({
        history = true,
        updateevents = "TextChanged,TextChangedI", -- Automatically update snippets on change
      })
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
