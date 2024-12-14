return {
  {
    dir = "/home/abhi/dev/github/typst-snippets",
    config = function()
      require("snippets").setup()
    end
  },
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

      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local extras = require("luasnip.extras")
      local rep = extras.rep
      local fmt = require("luasnip.extras.fmt").fmt
      local c = ls.choice_node
      local f = ls.function_node
      local d = ls.dynamic_node
      local sn = ls.snippet_node

      -- Snippet to print "hello world" with dynamic input.
      ls.add_snippets("typst", {
        s("h1", {
          t('= '), -- doc
          i(1),
          i(0), rep(1)
        }),
        s("h2", {
          t('== '), -- doc
          i(1),
          i(0), rep(1)
        }),
        s("h3", {
          t('=== '), -- doc
          i(1),
          i(0), rep(1)
        })
      })

      ls.add_snippets("typst", {
        s("beg", {
          t("\\begin{"), i(1), t("}"),
          t({ "", "\t" }), i(0),
          t({ "", "\\end{" }), rep(1), t("}"),
        }),
        s({
            trig = "helloworld",
            snippetType = "snippet",
            desc =
            "A hello world snippet\n\nThis snippet demonstrates a basic\nmultiline description with additional\nexplanation about its usage.",
            wordTrig = true
          },
          { t("Just a hint of what's to come!") }
        ),
        -- footnote


        s("tester", {
          t("\\begin{"), i(1), t("}"),
          t({ "", "\t" }),
          t({ "", "\\end{" }), rep(1), t("}"),
        }),
        
        -- footnote entry
        s({
            trig = "footnote.entry",
            snippetType = "snippet",
            desc =
            "An entry in a footnote list.\nThis function is not intended to be called directly. Instead, it is used in set and show rules to customize footnote listings.",
            wordTrig = true
          },
          {
            t('#footnote.enrty['),
            i(1),
            t(']')
          }
        ),
      })

      ls.add_snippets("lua", {
        s("logc",
          fmt([[Debug.Log($"<color={}>{}</color>");]],
            {
              c(1, {
                t("red"),
                t("green"),
                t("blue"),
                t("cyan"),
                t("magenta")
              }),
              i(2),
            })),
      })
    end
  }
}
