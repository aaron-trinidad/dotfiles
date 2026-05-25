return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    ts.install({
      "lua",
      "python",
      "cpp",
      "sql",
      "bash",
      "json",
      "markdown",
      "markdown_inline",
      "latex",
    }):wait(300000)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "python",
        "cpp",
        "sh",
        "json",
      },
      callback = function()
        vim.treesitter.start()

        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
