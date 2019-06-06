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
			{"automation-science-pack", 10},
			{"logistic-science-pack", 7},
			{"chemical-science-pack", 3},
			{"space-science-pack", 1},
		  },
		  time = 1200
		},
		upgrade = true,
		order = "a-f",
		icon_size = 128,
	  },
	})
	
	if data.raw.tool["biter-flesh"] then
		table.insert(data.raw.technology["evo-factor"].unit.ingredients, {"biter-flesh", 5})
	end
end
