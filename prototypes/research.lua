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
	local tech = create_Tech(i, s, "research-speed", 0, 2)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end
--[[
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
--]]

s = 8
for i=s,max do
	local tech = create_Tech(i, s, "inserter-capacity-bonus", 200, 1.0)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 6
for i=s,max do
	local tech = create_Tech(i, s, "worker-robots-speed", 250, 2)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

s = 4
for i=s,max do
	local tech = create_Tech(i, s, "worker-robots-storage", 150, 1.25)
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

s = 7
for i=s,max do
	local tech = create_Tech(i, s, "flamethrower-damage", 100, 1.25)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

for i=s,max do
	local tech = create_Tech(i, s, "bullet-damage", 100, 1.25)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

for i=s,max do
	local tech = create_Tech(i, s, "grenade-damage", 0, 1.5)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

for i=s,max do
	local tech = create_Tech(i, s, "shotgun-shell-damage", 100, 1.1)
	if tech ~= nil then
		data:extend(
		{
		  tech
		})
	end
end

if data.raw.technology["character-inventory-slots-1"] then
	s = 4
	for i=s,max do
		local tech = create_Tech(i, s, "character-inventory-slots", 50, 1.05)
		if tech ~= nil then
			data:extend(
			{
			  tech
			})
		end
	end
end

if data.raw.technology["crafting-speed-upgrade-1"] then
	s = 21
	for i=s,max do
		local tech = create_Tech(i, s, "crafting-speed-upgrade", 100, 1.1)
		if tech ~= nil then
			data:extend(
			{
			  tech
			})
		end
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