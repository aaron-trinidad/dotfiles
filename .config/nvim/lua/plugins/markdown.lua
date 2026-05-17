return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      -- 🎨 Paleta de headers (Avalon × Kanagawa)
      local header_colors = {
        "#c55845", -- H1
        "#4f7f9e", -- H2
        "#729471", -- H3
        "#764754", -- H4
        "#3d5a6c", -- H5
        "#3f4750", -- H6
      }

      -- 🖌️ Crear los grupos de highlight
      for i, color in ipairs(header_colors) do
        vim.api.nvim_set_hl(0, "MarkdownHeader" .. i, { bg = color })
      end

      -- ⚙️ Configurar el plugin después de definir los colores
      require("render-markdown").setup({
        heading = {
          -- enabled = true,
          -- style = "bar", -- 'block' para fondo completo
          -- bar = { width = 1 },
          backgrounds = {
            "MarkdownHeader1",
            "MarkdownHeader2",
            "MarkdownHeader3",
            "MarkdownHeader4",
            "MarkdownHeader5",
            "MarkdownHeader6",
          },
        },
      })
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = "work",
          path = "~/Documents/mnemonic",
        },
      },
      ui = { enable = false }, -- solo usar render-markdown para UI

      legacy_commands = false,

      callbacks = {
        -- Runs anytime you enter the buffer for a note.
        enter_note = function(note)
          -- Setup keymaps for obsidian notes
          vim.keymap.set("n", "gf", function()
            return require("obsidian").util.gf_passthrough()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

          vim.keymap.set("n", "<leader>ch", function()
            return require("obsidian").util.toggle_checkbox()
          end, { buffer = note.bufnr, desc = "Toggle checkbox" })

          vim.keymap.set("n", "<cr>", function()
            return require("obsidian").util.smart_action()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })
        end,
      },

      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        customizations = {
          simple = {
            notes_subdir = "aux-temp",
            note_id_func = function(title)
              if not title then
                return tostring(os.time())
              end
              local clean_title = title
                :gsub("|.*", "") -- elimina alias si hay "|"
                :gsub(" ", "-") -- reemplaza espacios por guiones
                :gsub("[^%w%-]", "") -- elimina caracteres no alfanuméricos
                :lower()
              return clean_title
            end,
          },
        },
      },
    },
  },
}
