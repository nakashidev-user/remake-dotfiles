return {
	{
		"stevearc/conform.nvim",
		opts = function()
			local opts = {
				default_format_opts = {
					timeout_ms = 3000,
					async = false, -- not recommended to change
					quiet = false, -- not recommended to change
					lsp_format = "fallback", -- not recommended to change
				},
				formatters_by_ft = {
					["javascript"] = { "prettier" },
					["typescript"] = { "prettier" },
					["json"] = { "prettier" },
					["yaml"] = { "prettier" },
					["lua"] = { "stylua" },
					["go"] = { "goimports", "gofumpt" }, -- Go formatters
				},
			}
			return opts
		end,
	},
	-- tools
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"typescript-language-server",
				"goimports", -- Go import formatter
				"gofumpt", -- Go code formatter
			})
		end,
	},

	--lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			-- @type lspconfig.options
			servers = {
				-- Configure diagnostic-languageserver without formatting
				-- diagnosticls = {
				-- 	on_attach = function(client, bufnr)
				-- 		-- Disable formatting capabilities to prevent Go format errors
				-- 		client.server_capabilities.documentFormattingProvider = false
				-- 		client.server_capabilities.documentRangeFormattingProvider = false
				-- 	end,
				-- },
				-- Core languages for development
				lua_ls = {
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = true,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
				-- Web development
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				eslint = {},
				-- Only essential servers for common file types
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
			},
			-- setup = {
			-- 	eslint = function()
			-- 		require("lazyvim.util").lsp.on_attach(function(client)
			-- 			if client.name == "eslint" then
			-- 				client.server_capabilities.documentFormattingProvider = true
			-- 			elseif client.name == "tsserver" then
			-- 				client.server_capabilities.documentFormattingProvider = false
			-- 			end
			-- 		end)
			-- 	end,
			-- },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				["*"] = {
					keys = {
						-- Add a keymap
						{ "H", "<cmd>echo 'hello'<cr>", desc = "Say Hello" },
						-- Change an existing keymap
						{ "K", "<cmd>echo 'custom hover'<cr>", desc = "Custom Hover" },
						-- Disable a keymap
						{ "gd", false },
						{ "K", false },
						{ "F", vim.lsp.buf.hover, mode = "n", desc = "LSP Hover" },
						{
							"gd",
							function()
								-- DO NOT RESUSE WINDOW
								require("telescope.builtin").lsp_definitions({ reuse_win = false })
							end,
							desc = "Goto Definition",
							has = "definition",
						},
					},
				},
			},
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
