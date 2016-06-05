require "defines"
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
			reset_evo_factor = true
		end
	--end
end)

function reduceEvolution()  
	reduction = math.max(0.00005, math.min(0.04, (0.25*game.evolution_factor*(1-game.evolution_factor)))) --more effective at lower evo factor
	
	game.player.print("Evo factor going down by " .. reduction .. ", from " .. game.evolution_factor .. " to " .. (game.evolution_factor-reduction))
	
	if game.evolution_factor > reduction then
		game.evolution_factor = game.evolution_factor-reduction
	else
		game.evolution_factor = 0
	end
	
	--game.player.print("Evo factor now " .. game.evolution_factor)
end

script.on_event(defines.events.on_tick, function(event)
   if reset_evo_factor then
      reset_evo_factor = false
      game.forces.player.technologies['evo-factor'].researched = false
   end
end)