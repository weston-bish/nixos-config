return {
  -- LSP support
  {
    "neovim/nvim-lspconfig", -- core LSP client configs
    dependencies = {
      "williamboman/mason.nvim",           -- LSP/DAP installer
      "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- Add LSPs here
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      -- Example config for lua_ls (sumneko_lua)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- Example config for pyright
      lspconfig.pyright.setup({})

      -- Add more servers here
    end,
  },
}
