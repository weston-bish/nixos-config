require("config.lazy")
require("core.options")
require("core.keymaps")
require("lazy").setup("plugins")

require'lualine'.setup {
    options = {
        theme = 'sonokai'
    }
}
