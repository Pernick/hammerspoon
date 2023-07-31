local hotkey = require("hs.hotkey")
local window = require("hs.window")
local alert = require("hs.alert")

local position = import("utils/position")
local monitors = import("utils/monitors")

local function module_init()
	-- remove win animations
	window.animationDuration = 0

	local mash = config:get("win_resizer.mash")
	local positions = config:get("win_resizer.positions")

	if mash == nil or positions == nil then
		alert.show("win_resizer: missing config")
		return
	end

	for key, position_string in pairs(positions) do
		local position_fn = position[position_string]

		if position_fn == nil then
			error("win_resizer: " .. position_string .. " is not a valid position")
		end

		hotkey.bind(mash, key, function()
			local win = window.focusedWindow()
			if win == nil then
				alert.show("win_resizer: no focused window found")
				return
			end

			local screen = win:screen()
			local dimensions = monitors.get_screen_dimensions(screen)
			local newframe = position_fn(dimensions)

			win:setFrame(newframe)
		end)
	end
end

return {
	init = module_init,
}
