require("functions")
require("config")

for i = 8,16 do
	local stack = table.deepcopy(data.raw.technology["inserter-capacity-bonus-7"])
	stack.name = "inserter-capacity-bonus-" .. i
	stack.effects =
    {
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 2
      }
    }
	stack.prerequisites = {"inserter-capacity-bonus-" .. (i-1)}
	stack.unit.count = 100*i
	if i > 10 then
		table.insert(stack.unit.ingredients, {"space-science-pack", 1})
	end
	data:extend({stack})
end

for i = 4,9 do
	local cargo = table.deepcopy(data.raw.technology["worker-robots-storage-3"])
	cargo.name = "worker-robots-storage-" .. i
	cargo.prerequisites = {"worker-robots-storage-" .. (i-1)}
	cargo.unit.count = 150*i+150
	if i > 5 then
		table.insert(cargo.unit.ingredients, {"space-science-pack", 1})
	end
	data:extend({cargo})
end

data:extend({
  {
    type = "technology",
    name = "research-speed-7",
    icon_size = 128,
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.7
      }
    },
    prerequisites = {"research-speed-6"},
    unit =
    {
      count = 750,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-m-d"
  },
  {
    type = "technology",
    name = "research-speed-8",
    icon_size = 128,
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.75
      }
    },
    prerequisites = {"research-speed-7"},
    unit =
    {
      count_formula = "(L-7)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    max_level = "infinite",
    order = "c-m-d"
  }
})