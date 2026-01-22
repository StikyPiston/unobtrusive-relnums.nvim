local M = {}

local ns = vim.api.nvim_create_namespace("unobtrusive-relnums")

local config = {
	step         = 5,
	max_distance = 200,
	sign_hl      = "LineNr"
}

return M
