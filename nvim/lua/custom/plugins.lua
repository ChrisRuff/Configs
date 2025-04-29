local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup({
                mappings = {
                    expand = "<CR>",
                    open = "o",
                    remove = "d",
                    edit = "<S-e>",
                },
            })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
      require "custom.configs.dap"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    -- Lazy load when event occurs. Events are triggered
    -- as mentioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
    -- You can also have it load at immediately at
    -- startup by commenting above and uncommenting below:
    -- lazy = false
    opts = function()
      return require "custom.configs.copilot"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
      }
    }
  },
  {
    "t-troebst/perfanno.nvim",
    config = function()
        require "custom.configs.perfanno"
    end,
    cmd = {
        "PerfCacheDelete",
        "PerfCacheLoad",
        "PerfLoadCallGraph",
        "PerfLoadFlamegraph",
        "PerfLoadFlat",
        "PerfLuaProfileStart"
    }
  },
  { "rose-pine/neovim", as = "rose-pine" },
}

return plugins
