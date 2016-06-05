function create_Tech(level, start, parent_name, linear, exponent)

  --some name calculation
  local post = "-" .. (level-1)
  local new_post = "-" .. level
  parent_name = parent_name .. post
  local base_tech = data.raw["technology"][parent_name]
  if base_tech == nil then
	error(serpent.block("Could not create level " .. level .. " of tech, parent '" .. parent_name .. "' does not exist.")) --equivalent to 'throw new RuntimeException(sg)', since print, aka System.out.println(sg), does not work
  end
  local idx = base_tech.name:match'^.*()-' --equivalent to 'lastIndexOf('-')'
  local new_name = string.sub(base_tech.name, 1, idx-1) .. new_post --equivalent to 'base_tech.substring(0, idx-1)'
  
  -- if tech exists (eg a mod) do not override it
  if data.raw["technology"][new_name] then
    print("Skipping tech level " .. level .. ", name = " .. new_name .. ": Already exists.") --only prints if run from command line
	return nil
  end
  
  --calculate before modifying exponent
  local calc_time = math.floor(base_tech.unit.time*(1+(exponent-1)/32))
  
  --keep numbers reasonable (ie help prevent overflow and stupidly large values)
  --if base_tech.unit.count > 1000000 then
  if exponent > 1.05 then
	  if exponent >= 2 then
		exponent = math.max(1.05, 1+(exponent-1)/((31+level-start)/32)) --gradually reduce exponent by 1/32 each level, but keep >= 1.05; will eventually drop below 2
	  else
		local pow = 1.01^math.max(0, level-start-5) --start the decrease 5 levels in
		exponent = math.max(1.05, 1+(exponent-1)^pow) --divide exponent by 1.01 each level, but keep >= 1.05
	  end
  end
  --end
  
  local calc_count = math.floor(base_tech.unit.count*exponent+linear)
  
  if calc_count > 2000000000 or calc_count <= 0 then
	calc_count = 2000000000
  end
  
  --actual tech
  local result =
  {
    type = "technology",
    name = new_name,
    icon = base_tech.icon,
    effects = base_tech.effects, --doing it this way also lets it pick up modded tech's "better rewards"
    prerequisites = {base_tech.name},
	icon_size = base_tech.icon_size,
    unit =
    {
      ingredients = base_tech.unit.ingredients, --and upped costs
      time = calc_time,
	  count = calc_count,
    },
    upgrade = true,
    order = "e-p-b-c"
  }  
	  
  --debug line
  --error(serpent.block("Created tech level " .. level .. ", name = " .. new_name))
  print("Created tech level " .. level .. ", name = " .. new_name .. ": ") --only prints if run from command line
  
  return result
end