local lsp_connection = function()
	local message = vim.lsp.util.get_progress_messages()
	if (message.status == "begin") or (message.status == "report") then
		return (message.msg .. " : " .. message.percent .. "%% \239\130\150")
	elseif message.status == "end" then
		return "\239\131\136"
	elseif (message.status == "") and not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
		return "\239\131\136"
	else
		return "\239\130\150"
	end
end
return {
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("lualine").setup({
				options = {
					theme = "ayu_dark",
					icons_enabled = true,
					section_separators = { "", "" },
					component_separators = { "\239\145\138", "\239\144\184" },
					-- theme = "catppuccin",
				},
				sections = {
					lualine_a = {},
					lualine_b = { { "mode", { upper = true } } },
					lualine_c = {
						{ "FugitiveHead" },
						{ "filename", file_status = true, path = 1, shorting_target = 40 },
					},
					lualine_x = {
						{ "diagnostics", sections = { "error", "warn", "info", "hint" }, sources = { "nvim_lsp" } },
						{ lsp_connection },
						"location",
						"filetype",
					},
					lualine_y = { "encoding" },
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", file_status = true, path = 1 } },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
}
