local config = {}
local mod = { "ctrl", "alt" }

-- modules for auto loading
config.modules = {
	"app_launcher",
	"auto_reload",
	"win_resizer",
}

-- maps monitor id -> screen index
config.monitors = {
	autodiscover = true,
	rows = 1,
}

-- app launcher app ids
config.app_launcher = {
	mash = mod,
	apps = {
		-- general
		p = "1Password",
		n = "Notion",
		-- browsers
		b = "Brave Browser",
		f = "Firefox",
		-- code
		t = "Alacritty",
		c = "Visual Studio Code",
		-- social
		a = "Around",
		d = "Discord",
		s = "Slack",
		g = "Telegram",
		o = "Microsoft Outlook",
		-- music
		m = "Spotify",
	},
}

config.win_resizer = {
	mash = mod,
	positions = {
		k = "top",
		j = "bottom",
		h = "left",
		l = "right",
		SPACE = "full",
	},
}

return config
