-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "clangd", "pyright", "rust_analyzer", "wgsl_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local DEFAULT_FQBN = "arduino:avr:nano"
local fqbn = DEFAULT_FQBN

lspconfig.arduino_language_server.setup {
  cmd = {
      "arduino-language-server",
      "-cli-config", "/home/hvlife/.arduino15/arduino-cli.yaml",
      "-fqbn",
      fqbn
  },

  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  --capabilities = capabilities,
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
