local hotkey = require("hs.hotkey")
local application = require("hs.application")
local alert = require("hs.alert")

local function module_init()
	local mash = config:get("app_launcher.mash")
	local apps = config:get("app_launcher.apps")

	if mash == nil or apps == nil then
		alert.show("app_launcher: missing config")
		return
	end

	for key, app in pairs(apps) do
		hotkey.bind(mash, key, function()
			application.launchOrFocus(app)
		end)
	end
end

return {
	init = module_init,
}
