local notify = require("hs.notify")

import = require("utils/import")
import.clear_cache()

config = import("config")

function config:get(key_path, default)
	local root = self
	for part in string.gmatch(key_path, "[^\\.]+") do
		root = root[part]
		if root == nil then
			return default
		end
	end
	return root
end

local modules = {}

for _, v in ipairs(config.modules) do
	local module_name = "modules/" .. v
	local module = import(module_name)

	if type(module.init) == "function" then
		module.init()
	end

	table.insert(modules, module_name)
end

local moduleNames = ""

for _, name in ipairs(modules) do
	moduleNames = moduleNames .. string.gsub(name, "modules/", "") .. "\n"
end

notify
	.new({
		title = "Hammerspoon Loaded",
		subTitle = "Active Modules:",
		informativeText = moduleNames,
	})
	:send()
