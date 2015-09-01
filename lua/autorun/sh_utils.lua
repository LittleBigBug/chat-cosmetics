-- Chat Cosmetics Created and Developed by LittleBigBug
-- http://www.steamcommunity.com/id/littlebigbug
-- All Rights reserved
-- Specially developed for Aero Game Servers
-- Aerogameservers.com

if not CUConfig then return end -- Make sure the config exists

if SERVER then

	AddCSLuaFile()
	AddCSLuaFile("autorun/sh_config.lua")
	include("autorun/sh_config.lua")
	
	util.AddNetworkString( "connectmc" )
	util.AddNetworkString( "fspawnmc" )
	util.AddNetworkString( "dconnectmc" )
	
	if CUConfig.EnableAdminSteamDisconnect then
	
		util.AddNetworkString( "adminsid" )
	
	end
	

	local table = table
	local color_white = color_white
	
	local DefMsgPrefix = "Server"
	
	if CUConfig.EnableConnectMessage then -- Checks Config

		function OnPlayerConnect( name, ip )
		
			local connectmsg = { }

			table.insert( connectmsg, CUConfig.PrefixColor )
			table.insert( connectmsg, "[")
				
			if CUConfig.MessagePrefix == nil then
			
				table.insert( connectmsg, DefMsgPrefix )
			
			else
			
				table.insert( connectmsg, CUConfig.MessagePrefix )
			
			end
			
			table.insert( connectmsg, "]")
			table.insert( connectmsg, color_white)
			
			table.insert( connectmsg, "Player " )
			table.insert( connectmsg, Color( 245, 219, 49 ) )
			table.insert( connectmsg, name )
			table.insert( connectmsg, color_white )
			table.insert( connectmsg, " Connected to the server!" )

			net.Start( "connectmc" )
				net.WriteTable( connectmsg )
			net.Broadcast()
			
		end

		hook.Add( "PlayerConnect", "Plyconnect", OnPlayerConnect ) -- Starts OnPlayerConnect function when a player connects

	end

	if CUConfig.EnableFirstSpawnMessage then

		function OnPlayerSpawn( ply )

			local fspawnmsg = { }
			
			table.insert( fspawnmsg, Color(0, 255, 168) )
			table.insert( fspawnmsg, "[")
				
			if CUConfig.MessagePrefix == nil then
			
				table.insert( fspawnmsg, DefMsgPrefix )
			
			else
			
				table.insert( fspawnmsg, CUConfig.MessagePrefix )
			
			end
			
			table.insert( fspawnmsg, "]")
			table.insert( fspawnmsg, color_white)
			
			table.insert( fspawnmsg, "Player " )
			table.insert( fspawnmsg, Color( 245, 219, 49 ) )
			table.insert( fspawnmsg, ply:Nick() )
			table.insert( fspawnmsg, color_white )
			table.insert( fspawnmsg, " Spawned in the server!")
			
			net.Start( "fspawnmc" )
				net.WriteTable( fspawnmsg )
			net.Broadcast()

		end

		hook.Add( "PlayerInitialSpawn", "FirstSpawn", OnPlayerSpawn ) -- Starts OnPlayerSpawn function when a player spawns for the first time

	end

	if CUConfig.EnableDisconnectMessage then

		function OnPlayerDisconnect( ply )

			local dconnectmsg = { }
			
			table.insert( dconnectmsg, Color(0, 255, 168) )
			table.insert( dconnectmsg, "[")
				
			if CUConfig.MessagePrefix == nil then
			
				table.insert( dconnectmsg, DefMsgPrefix )
			
			else
			
				table.insert( dconnectmsg, CUConfig.MessagePrefix )
			
			end
			
			table.insert( dconnectmsg, "]")
			table.insert( dconnectmsg, color_white)
			
			
			table.insert( dconnectmsg, "Player " )
			table.insert( dconnectmsg, Color( 245, 219, 49 ) )
			table.insert( dconnectmsg, ply:Nick() )
			table.insert( dconnectmsg, color_white )
			table.insert( dconnectmsg, " Disconnected from the server!" )

			net.Start( "dconnectmc" )
				net.WriteTable( dconnectmsg )
			net.Broadcast()

			if CUConfig.EnableAdminSteamDisconnect then
				
				adminsidmsg = { }
				
				table.insert( adminsidmsg, Color(0, 255, 168) )
				table.insert( adminsidmsg, "[")
					
				if CUConfig.MessagePrefix == nil then
				
					table.insert( adminsidmsg, DefMsgPrefix )
				
				else
				
					table.insert( adminsidmsg, CUConfig.MessagePrefix )
				
				end
				
				table.insert( adminsidmsg, "]")
				table.insert( adminsidmsg, color_white)
				
				table.insert( adminsidmsg, "Player " )
				table.insert( adminsidmsg, Color( 245, 219, 49 ) )
				table.insert( adminsidmsg, ply:Nick() )
				table.insert( adminsidmsg, color_white )
				table.insert( adminsidmsg, " Had the SteamID of " )
				table.insert( adminsidmsg, ply:SteamID() )
				table.insert( adminsidmsg, "." )
				
				
				net.Start( "adminsid" )
					net.WriteTable( adminsidmsg )
				net.Broadcast()
				
			end

		end

		hook.Add( "PlayerDisconnected", "Plydconnect", OnPlayerDisconnect ) -- Starts OnPlayerDisconnect function when a player disconnects

	end

elseif CLIENT then

	net.Receive( "connectmc", function() 
	
		chat.AddText( unpack( net.ReadTable() ) )
	
	end)
	
	net.Receive( "fspawnmc", function() 
	
		chat.AddText( unpack( net.ReadTable() ) )
	
	end)
	
	net.Receive( "dconnectmc", function() 
	
		chat.AddText( unpack( net.ReadTable()) )
	
	end)
	
	net.Receive( "adminsid", function() 
	
		ply = LocalPlayer()
	
		if CUConfig.AdminSteamGroups[ply:GetNWString("usergroup")] then
		
			chat.AddText( unpack( net.ReadTable()) )
	
		end
		
	end)
	
end
