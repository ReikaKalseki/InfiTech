require("functions")
require("config")

local max = 200--1000--50

local s = 21
for i=s,max do
	local tech = create_Tech(i, s, "follower-robot-count", 200, 1.01)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 5
for i=s,max do
	local tech = create_Tech(i, s, "research-effectivity", 0, 2)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 5
for i=s,max do
	local tech = create_Tech(i, s, "inserter-stack-size-bonus", 100, 1.1)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 6
for i=s,max do
	local tech = create_Tech(i, s, "logistic-robot-speed", 250, 2)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 4
for i=s,max do
	local tech = create_Tech(i, s, "logistic-robot-storage", 150, 1.25)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 6
for i=s,max do
	local tech = create_Tech(i, s, "character-logistic-slots", 100, 2.5)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end


if Config.turretResearch then
	s = 7
	for i=s,max do
		local tech = create_Tech(i, s, "laser-turret-damage", 100, 3.5)
		if tech ~= nil then
			data:extend(
			{
			  tech
			})
		end
	end

	s = 7
	for i=s,max do
		local tech = create_Tech(i, s, "laser-turret-speed", 100, 3.25)
		if tech ~= nil then
			data:extend(
			{
			  tech
			})
		end
	end

	s = 11
	if data.raw["technology"]["plasma-turret-speed-1"] then
		for i=s,max do
			local tech = create_Tech(i, s, "plasma-turret-speed", 250, 3.75)
			if tech ~= nil then
				data:extend(
				{
				  tech
				})
			end
		end
	end

	s = 11
	if data.raw["technology"]["plasma-turret-damage-1"] then
		for i=s,max do
			local tech = create_Tech(i, s, "plasma-turret-damage", 250, 4)
			if tech ~= nil then
				data:extend(
				{
				  tech
				})
			end
		end
	end
end

if Config.evoResearch then
	data:extend(
	{
		{
		type = "technology",
		name = "evo-factor", -- was evo-factor-1
		icon = "__InfiTech__/graphics/evotech.png",
		prerequisites =
		{
		  "alien-technology",
		},
		unit =
		{
		  count = 1000,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 2},
			{"alien-science-pack", 4},
		  },
		  time = 1200
		},
		upgrade = true,
		order = "a-f",
		icon_size = 128,
	  },
	})
	--[[
	for i=2,2000 do
		local tech = create_Tech(i, s, "evo-factor", 0, 1)
		data:extend(
		{
		  tech
		})
	end
	--]]
end