--[[

if data.raw["electric-turret"]["plasma-turret"] then
	local effect = table.deepcopy(data.raw.technology["laser-turret-speed-8"].effects[1])
	effect.ammo_category = "plasma-turret"
	table.insert(data.raw.technology["laser-turret-speed-8"].effects, effect)
end

--]]