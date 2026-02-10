return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("blink-cmp").get_lsp_capabilities()
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
    -- Esto activa automáticamente cualquier LSP instalado con mason-lspconfig
    vim.lsp.enable("pyright")
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("sqls")
    vim.lsp.enable("marksman")

    vim.diagnostic.config({
      float = true,
      jump = {
        float = false,
        wrap = true,
      },
      severity_sort = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_lines = false,
      virtual_text = true,
    })
  end,
}
