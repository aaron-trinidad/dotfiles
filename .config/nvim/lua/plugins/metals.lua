return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" }, -- obligatorio
  ft = { "scala", "sbt", "java" },
  config = function(_, _)
    local metals = require("metals")
    local metals_config = metals.bare_config()

    -- Integración con blink.cmp (capabilities del LSP client)
    metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Opcional: status bar y hints
    metals_config.init_options.statusBarProvider = "on"

    -- Si quieres, aquí puedes poner tu función on_attach personalizada
    metals_config.on_attach = function(client, bufnr)
      -- keymaps, etc.
    end

    -- Auto attach Metals al abrir archivos Scala/SBT/Java
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}

-- return {
--   "scalameta/nvim-metals",
--   ft = { "scala", "sbt", "java" },
--   opts = function()
--     local metals_config = require("metals").bare_config()
--     metals_config.on_attach = function(client, bufnr)
--       -- your on_attach function
--     end
--
--     return metals_config
--   end,
--   config = function(self, metals_config)
--     local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = self.ft,
--       callback = function()
--         require("metals").initialize_or_attach(metals_config)
--       end,
--       group = nvim_metals_group,
--     })
--   end,
-- }
