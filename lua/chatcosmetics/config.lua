-- chatcosmetics rewrite by littlebigbug
-- if you're using luarefresh, you might want to refresh the other files too (save the other files) if you want the config to take effect.
-- or, just restart :b

chatcosmetics.tags = {}
local cfg = {}

-- This is the layout of how Server messages look from say in console
-- Server: Hello :D
cfg.ConsoleMessage = function(message)
  return
  { -- Don't leave this one empty lol
    Color(100, 100, 100),
    "Server: ",
    Color(255, 255, 255),
    message
  }
end

-- Shows when the player is talking in team chat
cfg.Team = {
  Color(0, 255, 50),
  "[TEAM]",
}

-- Shows when the player is talking while dead
cfg.Dead = {
  Color(255, 50, 50),
  "-DEAD-",
}

cfg.Advert = "[Advert]" -- How the advert prefix looks, leave "" to keep default
cfg.OOC = "[OOC]" -- Same thing except how the OOC prefix looks.

cfg.AdvertColor = Color(220, 220, 60) -- Applies to darkrp only
cfg.OOCColor = Color(200, 200, 200) -- Again, only darkrp

cfg.ChatColor = Color(255, 255, 255) -- Default Chat Color

chatcosmetics.addTag({
  suffix = false, -- make true to show the tag after the player's name.
  tag = { -- a table of what the tag looks like, you can add a comma and add more.
    Color(255, 255, 255),
    "[",
    Color(220, 0, 0),
    "S-Admin",
    Color(255, 255, 255),
    "]",
  },
  chatcolor = nil, -- Default chat color. (Advert overrides this color)
  advertcolor = nil, -- Advert Chat color specific to this tag. You can leave this 'nil' to use the default.
  ooccolor = nil, -- Same thing, but for OOC. Leave it nil to use default.
  players = { -- can be a group, or a steam id.
    "superadmin"
  },
  priority = 1, -- the higher the priority, it uses this tag first. (as in chat colors, etc, if you have more than one tag, you'll also have all tags assigned to you.)
})

chatcosmetics.addTag({
  suffix = false,
  tag = {
    Color(255, 255, 255),
    "[",
    Color(240, 50, 50),
    "Admin",
    Color(255, 255, 255),
    "]",
  },
  chatcolor = nil,
  advertcolor = nil,
  ooccolor = nil,
  players = {
    "admin"
  },
  priority = 1,
})

chatcosmetics.addTag({
  suffix = false,
  tag = {
    Color(255, 255, 255),
    "[",
    Color(60, 200, 220),
    "Guest",
    Color(255, 255, 255),
    "]",
  },
  chatcolor = nil,
  advertcolor = nil,
  ooccolor = nil,
  players = {
    "user"
  },
  priority = 1,
})

-- I'm not trying to force you to give myself a tag, just an example for steamid tags and priority
chatcosmetics.addTag({
  suffix = false,
  tag = {
    Color(255, 255, 255),
    "[",
    Color(160, 50, 220),
    "Dev",
    Color(255, 255, 255),
    "]",
  },
  chatcolor = nil,
  advertcolor = nil,
  ooccolor = nil,
  players = {
    "STEAM_0:0:52985450", -- Me :D
    "STEAM_0:1:7099", -- Garry
    "STEAM_0:1:54849576", -- Harley, finally got me to rewrite this crap
  },
  priority = 2,
})

return cfg
