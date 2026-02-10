-- Conform.nvim - Formateador automático
-- URL: https://github.com/stevearc/conform.nvim

return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" }, -- se carga antes de guardar
  cmd = "ConformInfo",
  opts = {
    -- Autoformatear al guardar
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true, -- usa LSP si no hay formateador instalado
    -- },
    -- Configura los formateadores por tipo de archivo
    formatters_by_ft = {
      python = { "isort", "black" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      markdown = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = { "--prose-wrap", "always", "--print-width", "80" },
      },
    },
  },
}
