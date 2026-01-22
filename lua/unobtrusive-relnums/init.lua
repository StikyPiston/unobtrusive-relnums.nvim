local M = {}

local ns = vim.api.nvim_create_namespace("unobtrusive-relnums")

local config = {
	step         = 5,
	max_distance = 200,
	sign_hl      = "LineNr"
}

M.render = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local win = vim.api.nvim_get_current_win()

	if not vim.api.nvim_buf_is_loaded(bufnr) then return end

	vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

	local cursor = vim.api.nvim_win_get_cursor(win)
	local cursor_line = cursor[1]

	local first = vim.fn.line("w0")
	local last  = vim.fn.line("w$")

	for l = first, last do
	local dist = math.abs(l - cursor_line)

	if dist > 0
	and dist <= config.max_distance
	and dist % config.step == 0
	then
	vim.api.nvim_buf_set_extmark(bufnr, ns, l - 1, 0, {
	sign_text = tostring(dist),
	sign_hl_group = config.sign_hl,
	priority = 10,
	})
	end
	end
end

local M.setup = function(opts)
  config = vim.tbl_extend("force", config, opts or {})

  vim.api.nvim_create_autocmd({
    "CursorMoved",
    "CursorMovedI",
    "BufEnter",
    "WinScrolled",
  }, {
    callback = M.render,
  })
end

return M
