-- _PRIORITY = 9998
-- Chat Cosmetics Created and Developed by LittleBigBug
-- http://www.steamcommunity.com/id/littlebigbug
-- All Rights reserved
-- Specially developed for Aero Game Servers
-- Aerogameservers.com

-- _-----------------------------_
-- Chat Cosmetics Configuration
-- _-----------------------------_
-- --_________________--

CUConfig = {}
CUConfig.Tags = {}

CUConfig.Debug = false -- For testing - prints in console

local color_white = color_white

-- /\ DONT TOUCH ABOVE /\

-- Start Editing Below

CUConfig.MessagePrefix = nil -- Message prefix for the messages. Nil is default: [Server]
CUConfig.PrefixColor = Color(0, 255, 168)

CUConfig.EnableConnectMessage = true -- Enables "Player <playername> has connected to the server" in chat when anyone joins.
CUConfig.EnableFirstSpawnMessage = true -- Enables "Player <playername> has Spawned in the server" in chat when anyone finishes loading in the server.

CUConfig.EnableDisconnectMessage = true -- Enables "Player <playername> has disconnected from the server" in the chat when anyone leaves.

CUConfig.EnableAdminSteamDisconnect = true -- Enables "Player <playername> had the steamid of <SteamID>" in the chat to all admins and superadmins when the player disconnects
CUConfig.AdminSteamGroups = { -- Groups to show the disconnecting players steamid to

["superadmin"] = 0,
["admin"] = 1

}

CUConfig.CustomTag = { }
CUConfig.CustomTag.Enabled = false -- Enable the additional chat tags to only affect specific SteamIDS. Will be shown before the group tag.
CUConfig.CustomTag.Colour = Color( 48, 255, 162 ) -- Color of the tag (not the brackets)
CUConfig.CustomTag.Name = "Dev" -- What to display in the tag
CUConfig.CustomTag.BracketsColour = color_white -- The bracket colors of the tag
CUConfig.CustomTag.BracketLeft = "[" -- The bracket or the right of the tag You could leave this blank
CUConfig.CustomTag.BracketRight = "]" -- and instead just use | as a seperator ( Admin | LittleBigBug: Hi!)
CUConfig.CustomTag.SteamIDs = { -- List of steamids to assign the Tag to.
	
["STEAM_0:0:52985450"] = 1, -- LittleBigBug
["STEAM_0:1:7099"] = 2 -- Garry

}

-- Chat Tags
-- These do work with almost every gamemode.
-- Tested Gamemodes:
-- Deathrun, DarkRP
-- OOC, Advert, and PM work.

CUConfig.Tags["superadmin"] = { -- Group name in the ""
	Color( 255, 0, 0 ), -- The color of the tag
	"SuperAdmin", -- What to display in the tag
	color_white, -- The brackets color of the tag
	Color( 255, 94, 94 ) -- Chat color, or if you don't want a specific chat color, use 'false' (WILL NOT OVVERIDE /advert CHAT COLOR!)
}

CUConfig.Tags["admin"] = {
	Color( 255, 94, 94 ), 
	"Admin", 
	color_white, 
	false 
}

CUConfig.Tags["user"] = {
	Color(138, 138, 138), 
	"Guest", 
	color_white, 
	false 
}

CUConfig.BracketLeft = "[" -- the bracket on the right of the tag. You can leave this blank
CUConfig.BracketRight = "] " -- and this one like | as a seperator.

CUConfig.AdvertChatColor = Color( 0, 255, 238 ) -- Color For /advert chats (DarkRP only - just leave this alone if you don't use DarkRP)
