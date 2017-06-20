require("functions")
require("config")

if Config.evoResearch then
	data:extend(
	{
		{
		type = "technology",
		name = "evo-factor",
		icon = "__InfiTech__/graphics/evotech.png",
		prerequisites =
		{
		  "rocket-silo",
		  "atomic-bomb",
		},
		unit =
		{
		  count = 100,
		  ingredients =
		  {
			{"science-pack-1", 10},
			{"science-pack-2", 7},
			{"science-pack-3", 3},
			{"space-science-pack", 1},
		  },
		  time = 1200
		},
		upgrade = true,
		order = "a-f",
		icon_size = 128,
	  },
	})
end