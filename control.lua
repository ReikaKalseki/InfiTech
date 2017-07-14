--require "defines"
require "util"

local reset_evo_factor = false

script.on_event(defines.events.on_research_finished, function(event)
	--local idx = event.research.name:match'^.*()-'
	--if idx ~= nil then
		--local sub = string.sub(event.research.name, 1, idx-1)
		if event.research.name == "evo-factor" then --was sub
			reduceEvolution()
			
			--reset tech so it can be researched again, ad infinitum
			--does not work--game.player.force.technologies['evo-factor'].researched=false
			reset_evo_factor = true--[[
		elseif stringStarts(event.research.name, "crafting-speed-upgrade") then
			local lvl = getTechLevel(event.research.name)
			--game.print(lvl)
			event.research.force.manual_crafting_speed_modifier = math.max(1+0.2*lvl, event.research.force.manual_crafting_speed_modifier)--corrected formula to match the names 0.1*math.floor(lvl^1.2)
			--game.print(event.research.force.manual_crafting_speed_modifier)--]]
		end
	--end
end)

function reduceEvolution()  
	local reduction = math.max(0.00005, math.min(0.04, (0.25*game.forces.enemy.evolution_factor*(1-game.forces.enemy.evolution_factor)))) --more effective at lower evo factor
	
	--game.player.print("Evo factor going down by " .. reduction .. ", from " .. game.forces.enemy.evolution_factor .. " to " .. (game.forces.enemy.evolution_factor-reduction))
	
	if game.forces.enemy.evolution_factor > reduction then
		game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor-reduction
	else
		game.forces.enemy.evolution_factor = 0
	end
	
	--game.player.print("Evo factor now " .. game.forces.enemy.evolution_factor)
end

function getTechLevel(name)
	--game.print(name)
	local idx = name:match'^.*()-' --equivalent to 'lastIndexOf('-')'
	return tonumber(string.sub(name, idx+1))
end

function stringStarts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end

script.on_event(defines.events.on_tick, function(event)
	if reset_evo_factor then
		reset_evo_factor = false
		game.forces.player.technologies['evo-factor'].researched = false
	end
end)
