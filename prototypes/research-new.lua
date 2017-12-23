require("functions")
require("config")

data:extend(
{
  {
    type = "technology",
    name = "laser-turret-speed-8",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.5
      }
    },
    prerequisites = {"laser-turret-speed-7"},
    unit =
    {
      count_formula = "2^(L-8)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    icon_size = 128,
    upgrade = true,
    order = "e-n-g"
  },
    {
    type = "technology",
    name = "research-speed-7",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.6
      }
    },
    prerequisites = {"research-speed-6"},
    unit =
    {
      count_formula = "2^(L-6)*500",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 30
    },
    max_level = "infinite",
    icon_size = 128,
    upgrade = true,
    order = "c-m-d"
  },
    {
    type = "technology",
    name = "worker-robots-storage-4",
    icon = "__base__/graphics/technology/worker-robots-storage.png",
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"worker-robots-storage-3"},
    unit =
    {
      count_formula = "2^(L-4)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    icon_size = 128,
    upgrade = true,
    order = "c-k-g-c"
  },
    {
    type = "technology",
    name = "character-logistic-slots-7",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 6
      }
    },
    prerequisites = {"character-logistic-slots-6"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 30
    },
    max_level = "infinite",
    icon_size = 128,
    upgrade = true,
    order = "c-k-e-f"
  },
})