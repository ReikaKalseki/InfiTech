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