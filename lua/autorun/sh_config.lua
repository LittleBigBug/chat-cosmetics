
-- Chat Cosmetics Created and Developed by LittleBigBug
-- http://www.steamcommunity.com/id/littlebigbug
-- All Rights reserved
-- Thanks Zerf! <3

-- _-----------------------------_
-- Chat Cosmetics Configuration
-- _-----------------------------_
-- --_________________--

if CUConfig == nil then CUConfig = {} end -- !!
CUConfig.Tags = {}

-- /\ DONT TOUCH ABOVE /\

-- Start Editing Below

CUConfig.MessagePrefix = "[Server] " -- Prefix for join/disconnect messages etc
CUConfig.PrefixColor = Color(0, 255, 168)

CUConfig.EnableConnectMessage = false -- Enables "Player <playername> has connected to the server" in chat when anyone joins.
CUConfig.EnableFirstSpawnMessage = false -- Enables "Player <playername> has Spawned in the server" in chat when anyone finishes loading in the server.

CUConfig.EnableDisconnectMessage = false -- Enables "Player <playername> has disconnected from the server" in the chat when anyone leaves.

CUConfig.EnableAdminSteamDisconnect = false -- Enables "Player <playername> had the steamid of <SteamID>" in the chat to all admins and superadmins when the player disconnects


CUConfig.AdminSteamGroups = function( ply ) -- What groups should be considered 'Admin' Groups to get admin specific messages.
	if ulx and ulib then
		return ply:CheckGroup( 'admin' )
	end
	return ply:IsAdmin()
end

-- Usage:
-- CUConfig.AddTag( group or steamid table, tagcolor, tagtext, bracketcolor, bracketleft, bracketright, chatcolor )

CUConfig.AddTag( {"STEAM_0:0:52985450", "STEAM_0:1:7099"}, Color( 48, 255, 162 ), "Dev", color_white, "[", "]", nil )
if maestro ~= nil then
	CUConfig.AddTag( "root", Color( 255, 0, 0 ), "Root", color_white, "[", "]", nil )
end
CUConfig.AddTag( "superadmin", Color( 255, 0, 0 ), "SuperAdmin", color_white, "[", "]", nil )
CUConfig.AddTag( "admin", Color( 255, 100, 0 ), "Admin", color_white, "[", "]", nil )
CUConfig.AddTag( "user", Color( 0, 0, 0 ), "Guest", color_white, "[", "]", nil )

CUConfig.AdvertChatColor = Color( 0, 255, 238 ) -- Color For /advert chats (DarkRP only - just leave this alone if you don't use DarkRP)
