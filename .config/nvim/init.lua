-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt_local.spelllang = { "en_us", "es_mx" }

-- Solo para markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
})
