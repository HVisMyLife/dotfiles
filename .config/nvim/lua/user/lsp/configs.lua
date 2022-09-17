local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = {
	"jsonls",
	"sumneko_lua",
	"clangd",
	"rust_analyzer",
	"taplo",
	"clojure_lsp",
	"cmake",
	"pyright",
	"eslint",
	"bashls",
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "zsh" then
		server = "bash"
	end

	if server == "rust_analyzer" then
		local keymap = vim.keymap.set
		local key_opts = { silent = true }

		keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
		keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
		keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
		keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
		keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
		keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
		keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
		keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
		keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
		keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
		keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
		keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
		keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
		keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
		keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
		keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
		keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
		keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

		require("rust-tools").setup({
			tools = {
				on_initialized = function()
					vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
				end,
			},
			server = {
				on_attach = require("user.lsp.handlers").on_attach,
				capabilities = require("user.lsp.handlers").capabilities,
				settings = {
					["rust-analyzer"] = {
						lens = {
							enable = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		})

		goto continue
	end

	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)

	::continue::
end
